import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_settings/app_settings.dart';

class CameraPreviewWidget extends StatelessWidget {
  final CameraController? controller;
  final String? error;
  final VoidCallback? onRetry;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;

  const CameraPreviewWidget({
    super.key,
    required this.controller,
    this.error,
    this.onRetry,
    this.onTap,
    this.onDoubleTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final cameraController = controller;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(19.r),
        child: _buildContent(context, theme, colorScheme, cameraController),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
    CameraController? cameraController,
  ) {
    if (error != null) {
      return _buildErrorState(theme, colorScheme, error!);
    }

    // Null controller state
    if (cameraController == null) {
      return _buildLoadingState(colorScheme, 'Đang khởi tạo camera...');
    }

    // Uninitialized state
    if (!cameraController.value.isInitialized) {
      return _buildLoadingState(colorScheme, 'Đang khởi tạo camera...');
    }

    // Success state - show camera preview
    return _buildPreviewState(cameraController);
  }

  Widget _buildLoadingState(ColorScheme colorScheme, String message) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(19.r),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: colorScheme.surface,
              strokeWidth: 2,
            ),
            SizedBox(height: 16.h),
            Text(
              message,
              style: TextStyle(
                color: colorScheme.surface,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(
    ThemeData theme,
    ColorScheme colorScheme,
    String errorMessage,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(19.r),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.no_photography_outlined, // Icon phù hợp hơn
                color: colorScheme.error,
                size: 48.sp,
              ),
              SizedBox(height: 16.h),
              Text(
                'Không thể truy cập camera',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                errorMessage,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.surface,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              // THÊM: Các nút hành động
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: onRetry,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: colorScheme.surface),
                    ),
                    child: Text(
                      'Thử lại',
                      style: TextStyle(color: colorScheme.surface),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  ElevatedButton(
                    onPressed: AppSettings.openAppSettings, // Mở cài đặt
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.surface,
                    ),
                    child: Text(
                      'Mở cài đặt',
                      style: TextStyle(color: colorScheme.onSurface),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPreviewState(CameraController cameraController) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: AspectRatio(
        aspectRatio: _calculateAspectRatio(cameraController),
        child: CameraPreview(cameraController),
      ),
    );
  }

  double _calculateAspectRatio(CameraController controller) {
    // Sử dụng aspect ratio thực tế của camera thay vì hardcode
    final size = controller.value.previewSize;
    if (size != null) {
      return size.height / size.width;
    }
    // Fallback cho trường hợp không có size
    return 3 / 4;
  }
}
