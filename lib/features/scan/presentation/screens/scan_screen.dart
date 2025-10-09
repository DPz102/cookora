import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

// Core & DI
import 'package:cookora/core/di/service_locator.dart';
import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/snackbar_helper.dart';

// Features
import 'package:cookora/features/kitchen_log/presentation/bloc/kitchen_log_bloc.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_bloc.dart';

// Scan Feature - Bloc
import 'package:cookora/features/scan/domain/enums/scan_mode.dart' as scan_enum;
import 'package:cookora/features/scan/domain/entities/scan_result.dart';
import 'package:cookora/features/scan/presentation/bloc/camera/camera_bloc.dart';
import 'package:cookora/features/scan/presentation/bloc/scan/scan_bloc.dart';
import 'package:cookora/features/scan/presentation/bloc/scan/scan_event.dart';
import 'package:cookora/features/scan/presentation/bloc/scan/scan_state.dart';

// Scan Feature - Widgets
import 'package:cookora/features/scan/presentation/widgets/camera_controls.dart';
import 'package:cookora/features/scan/presentation/widgets/camera_preview.dart';
import 'package:cookora/features/scan/presentation/widgets/dish_result_dialog.dart';
import 'package:cookora/features/scan/presentation/widgets/ingredient_result_dialog.dart';

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
  scan_enum.ScanMode _scanMode = scan_enum.ScanMode.ingredient;

  void _onTakePicture(CameraController? controller) async {
    if (controller == null ||
        !controller.value.isInitialized ||
        controller.value.isTakingPicture) {
      return;
    }

    final scanBloc = context.read<ScanBloc>();
    if (scanBloc.state.isScanning) return;

    try {
      final image = await controller.takePicture();
      scanBloc.add(
        ScanEvent.recognizeImage(imageFile: File(image.path), mode: _scanMode),
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
            mode: _scanMode,
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

    return BlocListener<ScanBloc, ScanState>(
      listener: (context, state) {
        final status = state.scanStatus;
        if (status is AsyncSuccess<ScanResult>) {
          final scanResult = status.data;
          scanResult.when(
            dish: (recipe) => showDialog<void>(
              context: context,
              builder: (_) => BlocProvider.value(
                value: context.read<KitchenLogBloc>(),
                child: DishResultDialog(recipe: recipe),
              ),
            ).then((_) => scanBloc.add(const ScanEvent.reset())),

            ingredients: (results) {
              if (results.isEmpty) {
                context.showSnackBar(
                  'Không nhận diện được nguyên liệu nào.',
                  type: SnackBarType.info,
                );
                context.read<ScanBloc>().add(const ScanEvent.reset());
                return;
              }
              showDialog<void>(
                context: context,
                builder: (_) => BlocProvider.value(
                  value: context.read<PantryBloc>(),
                  child: IngredientResultDialog(results: results),
                ),
              ).then((_) => scanBloc.add(const ScanEvent.reset()));
            },
          );
        } else if (status is AsyncFailure) {
          context.showSnackBar(
            (status as AsyncFailure).error,
            type: SnackBarType.error,
          );
          context.read<ScanBloc>().add(const ScanEvent.reset());
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<CameraBloc, CameraState>(
          builder: (context, cameraState) {
            return cameraState.when(
              initial: () => const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
              loadInProgress: () => const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
              loadFailure: (error) => Center(
                child: Text(
                  'Lỗi Camera: $error',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              loadSuccess: (controller) {
                return BlocBuilder<ScanBloc, ScanState>(
                  builder: (context, scanState) {
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        CameraPreviewWidget(controller: controller),
                        CameraControls(
                          scanStatus: scanState.scanStatus,
                          currentMode: _scanMode,
                          onModeChanged: (mode) =>
                              setState(() => _scanMode = mode),
                          onTakePicture: () => _onTakePicture(controller),
                          onPickFromGallery: _onPickFromGallery,
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
    );
  }
}
