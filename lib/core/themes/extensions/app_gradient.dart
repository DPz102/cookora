import 'package:flutter/material.dart';

class AppGradients extends ThemeExtension<AppGradients> {
  final LinearGradient background;

  const AppGradients({required this.background});

  @override
  ThemeExtension<AppGradients> copyWith({LinearGradient? background}) {
    return AppGradients(background: background ?? this.background);
  }

  @override
  ThemeExtension<AppGradients> lerp(
    ThemeExtension<AppGradients>? other,
    double t,
  ) {
    if (other is! AppGradients) return this;

    return AppGradients(
      background: LinearGradient.lerp(background, other.background, t)!,
    );
  }

  /// Light theme gradients
  static AppGradients light(ColorScheme scheme) {
    // Dựa theo Figma, opacity tổng là 15%.
    // Giá trị Alpha tương ứng là (255 * 0.15).round() = 38.
    const int alpha = 38;

    // Màu ở giữa từ Figma
    const Color middleColor = Color(0xFFEDF0FF);

    return AppGradients(
      background: LinearGradient(
        // Figma không ghi rõ begin/end, nhưng mặc định là từ trên xuống.
        // Alignment(0.5, -1.0) -> (0.5, 1.0) là chính xác.
        begin: const Alignment(0.5, -1.0),
        end: const Alignment(0.5, 1.0),
        colors: [
          // Stop 1 (0%): Màu primary (#012AFE) với 15% opacity
          scheme.primary.withAlpha(alpha),

          // Stop 2 (50%): Màu #EDF0FF với 15% opacity
          middleColor.withAlpha(alpha),

          // Stop 3 (90%): Màu tertiary (#DAFF01) với 15% opacity
          scheme.tertiary.withAlpha(alpha),
        ],
        // Vị trí các điểm dừng màu
        stops: const [0.0, 0.5, 0.9],
      ),
    );
  }
}
