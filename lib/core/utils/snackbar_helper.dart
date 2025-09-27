import 'package:flutter/material.dart';

// Định nghĩa các kiểu SnackBar để dễ dàng thay đổi màu sắc
enum SnackBarType { success, error, info }

extension SnackBarHelper on BuildContext {
  void showSnackBar(String message, {SnackBarType type = SnackBarType.info}) {
    // Ẩn SnackBar hiện tại (nếu có) để tránh chồng chéo
    ScaffoldMessenger.of(this).hideCurrentSnackBar();

    // Xác định màu nền dựa trên type
    final Color backgroundColor;

    switch (type) {
      case SnackBarType.success:
        backgroundColor = Theme.of(this).colorScheme.primary;
        break;
      case SnackBarType.error:
        backgroundColor = Theme.of(this).colorScheme.error;
        break;
      case SnackBarType.info:
        backgroundColor = Theme.of(this).colorScheme.onSurface;
        break;
    }

    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
