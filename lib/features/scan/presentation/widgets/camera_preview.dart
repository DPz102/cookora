import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CameraPreviewWidget extends StatelessWidget {
  final CameraController? controller;

  const CameraPreviewWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return Center(
        child: CircularProgressIndicator(color: colorScheme.surface),
      );
    }

    if (cameraController.value.hasError) {
      return Center(
        child: Text(
          'Camera Error: ${cameraController.value.errorDescription}',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.surface,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(19.r), // Bo tròn các góc
        child: AspectRatio(
          aspectRatio: 3 / 4, // Tỉ lệ khung hình dọc
          child: CameraPreview(cameraController),
        ),
      ),
    );
  }
}
