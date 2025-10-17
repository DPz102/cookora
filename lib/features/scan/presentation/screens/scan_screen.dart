import 'dart:io';
import 'dart:ui';
import 'package:camera/camera.dart';

// Core & DI
import 'package:cookora/core/di/service_locator.dart';
import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/snackbar_helper.dart';
// Features
import 'package:cookora/features/kitchen_log/presentation/bloc/kitchen_log_bloc.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_bloc.dart';
import 'package:cookora/features/scan/domain/entities/scan_result.dart';
// Scan Feature - Bloc
import 'package:cookora/features/scan/domain/enums/scan_mode.dart' as scan_enum;
import 'package:cookora/features/scan/domain/models/camera_settings.dart';
import 'package:cookora/features/scan/presentation/bloc/camera/camera_bloc.dart';
import 'package:cookora/features/scan/presentation/bloc/scan/scan_bloc.dart';
import 'package:cookora/features/scan/presentation/bloc/scan/scan_event.dart';
import 'package:cookora/features/scan/presentation/bloc/scan/scan_state.dart';
// Scan Feature - Widgets
import 'package:cookora/features/scan/presentation/widgets/scan_header.dart';
import 'package:cookora/features/scan/presentation/widgets/scan_footer.dart';
import 'package:cookora/features/scan/presentation/widgets/camera_preview.dart';
import 'package:cookora/features/scan/presentation/widgets/dish_result_dialog.dart';
import 'package:cookora/features/scan/presentation/widgets/ingredient_result_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<ScanBloc>()),
        BlocProvider(
          create: (_) =>
              locator<CameraBloc>()..add(const CameraEvent.initialize()),
        ),
      ],
      child: const _ScanView(),
    );
  }
}

class _ScanView extends StatefulWidget {
  const _ScanView();
  @override
  State<_ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<_ScanView> {
  final ImagePicker _picker = ImagePicker();
  var _cameraSettings = const CameraSettings();

  double _maxZoom = 1.0;
  final List<double> _zoomLevels = [1.0, 2.0, 3.0];

  void _toggleFlash(CameraController? controller) {
    if (controller == null) return;

    final newFlashMode = switch (_cameraSettings.flashMode) {
      FlashMode.off => FlashMode.auto,
      FlashMode.auto => FlashMode.torch,
      _ => FlashMode.off,
    };

    setState(() {
      _cameraSettings = _cameraSettings.copyWith(flashMode: newFlashMode);
    });
    controller.setFlashMode(newFlashMode);
  }

  void _cycleZoom(CameraController? controller) {
    if (controller == null) return;

    final currentIndex = _zoomLevels.indexOf(_cameraSettings.currentZoom);
    final nextIndex = (currentIndex + 1) % _zoomLevels.length;
    final newZoom = _zoomLevels[nextIndex];

    final finalZoom = (newZoom <= _maxZoom) ? newZoom : 1.0;

    setState(() {
      _cameraSettings = _cameraSettings.copyWith(currentZoom: finalZoom);
    });
    controller.setZoomLevel(finalZoom);
  }

  void _cycleScanMode() {
    final newMode = _cameraSettings.scanMode == scan_enum.ScanMode.ingredient
        ? scan_enum.ScanMode.dish
        : scan_enum.ScanMode.ingredient;
    setState(() {
      _cameraSettings = _cameraSettings.copyWith(scanMode: newMode);
    });
  }

  void _onTakePicture(CameraController? controller) async {
    if (controller == null ||
        !controller.value.isInitialized ||
        controller.value.isTakingPicture) {
      return;
    }

    final scanBloc = context.read<ScanBloc>();
    if (scanBloc.state.isScanning) return;

    try {
      if (_cameraSettings.flashMode == FlashMode.torch) {
        await controller.setFlashMode(FlashMode.off);
      }
      final image = await controller.takePicture();
      if (_cameraSettings.flashMode == FlashMode.torch) {
        await controller.setFlashMode(FlashMode.torch);
      }

      scanBloc.add(
        ScanEvent.recognizeImage(
          imageFile: File(image.path),
          mode: _cameraSettings.scanMode,
        ),
      );
    } catch (e) {
      if (mounted) {
        context.showSnackBar('Lỗi khi chụp ảnh: $e', type: SnackBarType.error);
      }
    }
  }

  void _onPickFromGallery() async {
    final scanBloc = context.read<ScanBloc>();
    if (scanBloc.state.isScanning) return;

    try {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null && mounted) {
        scanBloc.add(
          ScanEvent.recognizeImage(
            imageFile: File(image.path),
            mode: _cameraSettings.scanMode,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        context.showSnackBar('Lỗi khi chọn ảnh: $e', type: SnackBarType.error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final scanBloc = context.read<ScanBloc>();
    final cameraBloc = context.read<CameraBloc>();
    final colorScheme = Theme.of(context).colorScheme;

    return BlocListener<ScanBloc, ScanState>(
      listener: (context, state) async {
        final status = state.scanStatus;
        if (status is AsyncSuccess<ScanResult>) {
          cameraBloc.add(const CameraEvent.dispose());

          final scanResult = status.data;

          await scanResult.when(
            dish: (recipe) => showDialog<void>(
              context: context,
              builder: (_) => BlocProvider.value(
                value: context.read<KitchenLogBloc>(),
                child: DishResultDialog(recipe: recipe),
              ),
            ),
            ingredients: (results) {
              if (results.isEmpty) {
                context.showSnackBar(
                  'Không nhận diện được nguyên liệu nào.',
                  type: SnackBarType.info,
                );
                return Future.delayed(const Duration(milliseconds: 100));
              }
              return showDialog<void>(
                context: context,
                builder: (_) => BlocProvider.value(
                  value: context.read<PantryBloc>(),
                  child: IngredientResultDialog(results: results),
                ),
              );
            },
          );

          if (mounted) {
            scanBloc.add(const ScanEvent.reset());
            cameraBloc.add(const CameraEvent.initialize());
          }
        } else if (status is AsyncFailure) {
          context.showSnackBar(
            (status as AsyncFailure).error,
            type: SnackBarType.error,
          );
          if (mounted) {
            scanBloc.add(const ScanEvent.reset());
            cameraBloc.add(const CameraEvent.initialize());
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: BlocBuilder<CameraBloc, CameraState>(
            builder: (context, cameraState) {
              return cameraState.when(
                initial: () => Center(
                  child: CircularProgressIndicator(color: colorScheme.surface),
                ),
                loadInProgress: () => Center(
                  child: CircularProgressIndicator(color: colorScheme.surface),
                ),
                loadFailure: (error) => Center(
                  child: Text(
                    'Lỗi Camera: $error',
                    style: TextStyle(color: colorScheme.surface),
                  ),
                ),
                loadSuccess: (controller) {
                  controller.getMaxZoomLevel().then((max) => _maxZoom = max);
                  return BlocBuilder<ScanBloc, ScanState>(
                    builder: (context, scanState) {
                      final isScanning = scanState.scanStatus is AsyncLoading;

                      return Stack(
                        children: [
                          // Lớp 1: Giao diện chính
                          Column(
                            children: [
                              ScanHeader(
                                flashMode: _cameraSettings.flashMode,
                                currentZoom: _cameraSettings.currentZoom,
                                onToggleFlash: () => _toggleFlash(controller),
                                onCycleZoom: () => _cycleZoom(controller),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                  ),
                                  child: isScanning
                                      ? const SizedBox.shrink()
                                      : CameraPreviewWidget(
                                          controller: controller,
                                        ),
                                ),
                              ),
                              // Chỉ hiển thị footer khi không scanning
                              if (!isScanning)
                                ScanFooter(
                                  currentMode: _cameraSettings.scanMode,
                                  onTakePicture: () =>
                                      _onTakePicture(controller),
                                  onPickFromGallery: _onPickFromGallery,
                                  onCycleMode: _cycleScanMode,
                                ),
                            ],
                          ),

                          // Lớp 2: Lớp phủ loading
                          if (isScanning)
                            Positioned.fill(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 10,
                                  sigmaY: 10,
                                ),
                                child: Container(
                                  color: Colors.black.withAlpha(50),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: colorScheme.surface,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
