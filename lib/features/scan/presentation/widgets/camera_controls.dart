import 'package:camera/camera.dart';
import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/features/scan/domain/enums/scan_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CameraControls extends StatelessWidget {
  final AsyncState scanStatus;
  final ScanMode currentMode;
  final FlashMode? flashMode;
  final double currentZoom;
  final VoidCallback onCycleMode;
  final VoidCallback onTakePicture;
  final VoidCallback onPickFromGallery;
  final VoidCallback onToggleFlash;
  final VoidCallback onCycleZoom;

  const CameraControls({
    super.key,
    required this.scanStatus,
    required this.currentMode,
    required this.onTakePicture,
    required this.onPickFromGallery,
    this.flashMode,
    required this.onToggleFlash,
    required this.onCycleZoom,
    required this.currentZoom,
    required this.onCycleMode,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _buildHeader(context),
          const Spacer(),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    IconData flashIcon;
    switch (flashMode) {
      case FlashMode.auto:
        flashIcon = Icons.flash_auto_rounded;
        break;
      case FlashMode.torch:
        flashIcon = Icons.flash_on_rounded;
        break;
      default:
        flashIcon = Icons.flash_off_rounded;
    }

    final buttonBackgroundColor = colorScheme.inverseSurface.withAlpha(100);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(flashIcon, color: colorScheme.surface, size: 28.sp),
            onPressed: onToggleFlash,
            style: IconButton.styleFrom(backgroundColor: buttonBackgroundColor),
          ),
          TextButton(
            onPressed: onCycleZoom,
            style: TextButton.styleFrom(
              backgroundColor: buttonBackgroundColor,
              foregroundColor: colorScheme.surface,
              shape: const CircleBorder(),
              padding: EdgeInsets.all(12.r),
            ),
            child: Text(
              '${currentZoom.toStringAsFixed(1)}x',
              style: theme.textTheme.labelMedium?.copyWith(
                color: colorScheme.surface,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.only(bottom: 32.h, left: 16.w, right: 16.w),
      child: scanStatus is AsyncLoading
          ? CircularProgressIndicator(color: colorScheme.surface)
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: IconButton(
                      icon: Icon(Icons.photo_library_outlined, size: 32.sp),
                      onPressed: onPickFromGallery,
                      color: colorScheme.surface,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onTakePicture,
                  child: Container(
                    width: 80.r,
                    height: 80.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colorScheme.surface,
                        width: 6.w,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 62.r,
                        height: 62.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorScheme.surface,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: _ModeSwitcher(
                      currentMode: currentMode,
                      onPressed: onCycleMode,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class _ModeSwitcher extends StatelessWidget {
  final ScanMode currentMode;
  final VoidCallback onPressed;

  const _ModeSwitcher({required this.currentMode, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final bool isIngredient = currentMode == ScanMode.ingredient;
    final IconData icon = isIngredient
        ? Icons.ramen_dining_outlined
        : Icons.fastfood_outlined;
    final String label = isIngredient ? 'Nguyên liệu' : 'Món ăn';

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28.sp),
          SizedBox(height: 4.h),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.surface,
              fontSize: 10.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
