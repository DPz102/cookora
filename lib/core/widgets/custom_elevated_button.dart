import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final ButtonStyle? style;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // Vô hiệu hóa nút khi đang loading
      onPressed: isLoading ? null : onPressed,
      style: style,
      child: isLoading
          ? SizedBox(
              height: 48.h,
              width: 48.h,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: Theme.of(context).colorScheme.surface,
              ),
            )
          : Text(text),
    );
  }
}
