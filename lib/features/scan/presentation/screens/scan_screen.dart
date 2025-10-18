import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Core & DI
import 'package:cookora/core/di/service_locator.dart';
import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/snackbar_helper.dart';
// Features
import 'package:cookora/features/kitchen_log/presentation/bloc/kitchen_log_bloc.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_bloc.dart';
import 'package:cookora/features/scan/domain/entities/scan_result.dart';
import 'package:cookora/features/scan/domain/models/camera_settings.dart';
// Scan Feature - Bloc
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

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ScanBloc>(),
      child: const _ScanView(),
    );
  }
}

class _ScanView extends StatelessWidget {
  const _ScanView();

  /// Xử lý việc hiển thị dialog kết quả sau khi scan thành công.
  void _handleScanResult(BuildContext context, ScanResult result) async {
    final cameraBloc = context.read<CameraBloc>();
    final scanBloc = context.read<ScanBloc>();

    // Tạm dừng camera preview trước khi hiển thị dialog
    cameraBloc.add(const CameraEvent.pausePreview());

    // Hiển thị dialog tương ứng với kết quả
    await result.when(
      dish: (recipe) => showDialog<void>(
        context: context,
        barrierDismissible: false, // Ngăn đóng dialog khi nhấn ra ngoài
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
          barrierDismissible: false,
          builder: (_) => BlocProvider.value(
            value: context.read<PantryBloc>(),
            child: IngredientResultDialog(results: results),
          ),
        );
      },
    );

    // Sau khi dialog đóng, tiếp tục preview và reset trạng thái scan
    if (context.mounted) {
      cameraBloc.add(const CameraEvent.resumePreview());
      scanBloc.add(const ScanEvent.reset());
    }
  }

  @override
  Widget build(BuildContext context) {
    final cameraBloc = context.read<CameraBloc>();
    final scanBloc = context.read<ScanBloc>();

    return MultiBlocListener(
      listeners: [
        // Lắng nghe tín hiệu có ảnh mới từ CameraBloc
        BlocListener<CameraBloc, CameraState>(
          listenWhen: (p, c) =>
              p.capturedImage != c.capturedImage && c.capturedImage != null,
          listener: (context, state) {
            final imageFile = state.capturedImage;
            if (imageFile != null) {
              // Khi có ảnh mới, kích hoạt ScanBloc để xử lý
              scanBloc.add(
                ScanEvent.recognizeImage(
                  imageFile: File(imageFile.path),
                  mode: state.settings.scanMode,
                ),
              );
              // Reset tín hiệu để không trigger lại
              cameraBloc.add(const CameraEvent.resetCapture());
            }
          },
        ),
        // Lắng nghe kết quả hoặc lỗi từ ScanBloc
        BlocListener<ScanBloc, ScanState>(
          listenWhen: (p, c) => p.scanStatus != c.scanStatus,
          listener: (context, state) {
            final status = state.scanStatus;

            if (status is AsyncSuccess<ScanResult>) {
              _handleScanResult(context, status.data);
            } else if (status is AsyncFailure) {
              context.showSnackBar(
                (status as AsyncFailure).error,
                type: SnackBarType.error,
              );
              // Reset trạng thái và tiếp tục preview nếu có lỗi
              scanBloc.add(const ScanEvent.reset());
              cameraBloc.add(const CameraEvent.resumePreview());
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child:
              BlocSelector<
                CameraBloc,
                CameraState,
                (AsyncState<CameraController>, CameraSettings)
              >(
                selector: (state) => (state.cameraStatus, state.settings),
                builder: (context, tuple) {
                  final cameraStatus = tuple.$1;
                  final settings = tuple.$2;

                  // Kiểm tra trạng thái
                  final isScanning = context.select(
                    (ScanBloc bloc) => bloc.state.scanStatus is AsyncLoading,
                  );
                  final isTakingPicture = context.select(
                    (CameraBloc bloc) => bloc.state.isTakingPicture,
                  );
                  /*
                  final isLoading =
                      cameraStatus is AsyncLoading ||
                      cameraStatus is AsyncInitial;
                  */
                  final isProcessing =
                      isScanning || isTakingPicture; //|| isLoading;

                  final error = switch (cameraStatus) {
                    AsyncFailure(:final error) => error,
                    _ => null,
                  };

                  final controller = switch (cameraStatus) {
                    AsyncSuccess<CameraController>(:final data) => data,
                    _ => null,
                  };

                  return Stack(
                    children: [
                      Column(
                        children: [
                          ScanHeader(
                            flashMode: settings.flashMode,
                            currentZoom: settings.currentZoom,
                            onToggleFlash: () =>
                                cameraBloc.add(const CameraEvent.toggleFlash()),
                            onCycleZoom: () =>
                                cameraBloc.add(const CameraEvent.cycleZoom()),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: isProcessing
                                  ? const Center()
                                  : CameraPreviewWidget(
                                      controller: controller,
                                      error: error,
                                      onRetry: () {
                                        cameraBloc.add(
                                          const CameraEvent.retryInitialization(),
                                        );
                                      },
                                      onTap: () => cameraBloc.add(
                                        const CameraEvent.cycleZoom(),
                                      ),
                                      onDoubleTap: () => cameraBloc.add(
                                        const CameraEvent.toggleFlash(),
                                      ),
                                    ),
                            ),
                          ),
                          if (!isProcessing)
                            ScanFooter(
                              currentMode: settings.scanMode,
                              isDisabled: isProcessing,
                              onTakePicture: () {
                                HapticFeedback.mediumImpact();
                                if (controller != null && error == null) {
                                  HapticFeedback.mediumImpact();
                                  cameraBloc.add(
                                    const CameraEvent.takePicture(),
                                  );
                                }
                              },
                              onPickFromGallery: () {
                                HapticFeedback.lightImpact();
                                cameraBloc.add(const CameraEvent.pickImage());
                              },
                              onCycleMode: () {
                                HapticFeedback.selectionClick();
                                cameraBloc.add(
                                  const CameraEvent.cycleScanMode(),
                                );
                              },
                            ),
                        ],
                      ),

                      if (isProcessing)
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              color: Colors.black.withAlpha(50),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
        ),
      ),
    );
  }
}
