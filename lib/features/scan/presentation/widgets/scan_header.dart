import 'package:camera/camera.dart';
import 'package:cookora/core/widgets/glassmorphic_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScanHeader extends StatelessWidget {
  final FlashMode flashMode;
  final double currentZoom;
  final VoidCallback onToggleFlash;
  final VoidCallback onCycleZoom;

  const ScanHeader({
    super.key,
    required this.flashMode,
    required this.currentZoom,
    required this.onToggleFlash,
    required this.onCycleZoom,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final IconData flashIcon = switch (flashMode) {
      FlashMode.auto => Icons.flash_auto_rounded,
      FlashMode.torch => Icons.flash_on_rounded,
      _ => Icons.flash_off_rounded,
    };

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Nút Flash với hiệu ứng kính mờ
            _GlassmorphicCircleButton(
              onPressed: onToggleFlash,
              child: Icon(flashIcon, color: colorScheme.onSurface, size: 28.sp),
            ),
            // Nút Zoom với hiệu ứng kính mờ
            _GlassmorphicCircleButton(
              onPressed: onCycleZoom,
              child: Text(
                '${currentZoom.toStringAsFixed(1)}x',
                style: textTheme.labelLarge?.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget private tạo ra một nút bấm hình tròn với hiệu ứng kính mờ.
/// Widget này đảm bảo tính nhất quán và có thể tái sử dụng.
class _GlassmorphicCircleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const _GlassmorphicCircleButton({
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    // Chuyển đổi opacity -> alpha (0.2 * 255 = 51)
    final glassBackgroundColor = colorScheme.surface.withAlpha(51);
    // Chuyển đổi opacity -> alpha (0.3 * 255 = 77)
    final glassBorderColor = colorScheme.surface.withAlpha(77);

    // Sử dụng SizedBox.square để ép nút có kích thước vuông, tạo ra hình tròn hoàn hảo.
    return SizedBox.square(
      dimension: 52.r, // Kích thước vùng chạm tiêu chuẩn
      child: GlassmorphicContainer(
        borderRadius: 26.r, // Bằng một nửa dimension để tạo hình tròn
        blurSigma: 8.0,
        backgroundColor: glassBackgroundColor,
        border: Border.all(color: glassBorderColor, width: 2.w),
        // Dùng TextButton bên trong để có hiệu ứng ripple khi nhấn
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            shape: const CircleBorder(),
            padding: EdgeInsets.zero,
          ),
          child: child,
        ),
      ),
    );
  }
}
