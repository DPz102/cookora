import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cookora/features/scan/domain/enums/scan_mode.dart';

// Chuyển thành StatefulWidget để quản lý trạng thái nhấn nút
class ScanFooter extends StatefulWidget {
  final ScanMode currentMode;
  final VoidCallback onTakePicture;
  final VoidCallback onPickFromGallery;
  final VoidCallback onCycleMode;

  const ScanFooter({
    super.key,
    required this.currentMode,
    required this.onTakePicture,
    required this.onPickFromGallery,
    required this.onCycleMode,
  });

  @override
  State<ScanFooter> createState() => _ScanFooterState();
}

class _ScanFooterState extends State<ScanFooter> {
  // Biến state để theo dõi trạng thái nhấn của nút chụp
  bool _isShutterPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final takePictureButton = GestureDetector(
      // Cập nhật trạng thái khi nhấn xuống, thả ra, hoặc hủy
      onTapDown: (_) => setState(() => _isShutterPressed = true),
      onTapUp: (_) => setState(() => _isShutterPressed = false),
      onTapCancel: () => setState(() => _isShutterPressed = false),
      onTap: widget.onTakePicture,
      child: AnimatedScale(
        // Dùng AnimatedScale để tạo hiệu ứng co giãn mượt mà
        scale: _isShutterPressed ? 0.9 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: SizedBox(
          width: 80.r,
          height: 80.r,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colorScheme.inverseSurface,
                    width: 4.w,
                  ),
                ),
              ),
              Container(
                width: 65.r,
                height: 65.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorScheme.surface,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // Bỏ logic loading ở đây vì đã chuyển lên màn hình chính
    final content = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: _FooterCircleButton(
              onPressed: widget.onPickFromGallery,
              child: Icon(
                Icons.image_outlined,
                size: 35.sp,
                color: colorScheme.onSurface,
              ),
            ),
          ),
        ),
        Expanded(child: Center(child: takePictureButton)),
        Expanded(
          child: Center(
            child: _FooterCircleButton(
              onPressed: widget.onCycleMode,
              child: _ModeSwitcher(currentMode: widget.currentMode),
            ),
          ),
        ),
      ],
    );

    return Padding(
      padding: EdgeInsets.only(bottom: 80.h, top: 30.h),
      child: content,
    );
  }
}

class _FooterCircleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const _FooterCircleButton({required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final buttonBackgroundColor = colorScheme.surface.withAlpha(51);

    return SizedBox.square(
      dimension: 60.r,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: buttonBackgroundColor,
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
        ),
        child: child,
      ),
    );
  }
}

class _ModeSwitcher extends StatelessWidget {
  final ScanMode currentMode;
  const _ModeSwitcher({required this.currentMode});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final isIngredient = currentMode == ScanMode.ingredient;
    final icon = isIngredient
        ? Icons.inventory_2_outlined
        : Icons.menu_book_outlined;
    final label = isIngredient ? 'Nguyên liệu' : 'Món ăn';

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 35.sp, color: colorScheme.onSurface),
        SizedBox(height: 2.h),
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurface,
            fontSize: 9.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
