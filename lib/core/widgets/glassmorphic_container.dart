import 'dart:ui';
import 'package:flutter/material.dart';

/// Một widget tạo ra hiệu ứng kính mờ (glass morphism) với bóng đổ chỉ ở viền ngoài.
/// Nó kết hợp BackdropFilter để làm mờ nền và CustomPaint để vẽ bóng.
class GlassmorphicContainer extends StatelessWidget {
  const GlassmorphicContainer({
    super.key,
    required this.child,
    required this.height,
    this.width,
    this.borderRadius = 27.0,
    this.blurSigma = 5.0,
    this.backgroundColor = const Color(0x70FFFFFF),
    this.shadowColor = const Color(0x26000000),
    this.shadowElevation = 4.0,
  });

  /// Nội dung sẽ được hiển thị bên trong container.
  final Widget child;

  /// Chiều cao của container.
  final double height;

  /// Chiều rộng của container. Mặc định sẽ co giãn theo `child`.
  final double? width;

  /// Độ bo tròn của các góc.
  final double borderRadius;

  /// Độ mờ của hiệu ứng kính (giá trị sigma cho ImageFilter.blur).
  final double blurSigma;

  /// Màu nền bán trong suốt phủ lên trên lớp kính mờ.
  final Color backgroundColor;

  /// Màu của bóng đổ.
  final Color shadowColor;

  /// Độ "nổi" của bóng, quyết định độ lan tỏa của bóng.
  final double shadowElevation;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      // Sử dụng painter tùy chỉnh để vẽ bóng chỉ ở viền ngoài.
      painter: _OuterShadowPainter(
        shadowColor: shadowColor,
        elevation: shadowElevation,
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
          child: Container(
            height: height,
            width: width,
            color: backgroundColor,
            child: child,
          ),
        ),
      ),
    );
  }
}

/// Lớp Painter helper (private) chỉ để vẽ bóng.
class _OuterShadowPainter extends CustomPainter {
  final Color shadowColor;
  final double elevation;
  final double borderRadius;

  _OuterShadowPainter({
    required this.shadowColor,
    required this.elevation,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final RRect rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    );
    final Path path = Path()..addRRect(rrect);

    // Tham số cuối cùng 'false' (transparentOccluder) là chìa khóa
    // để chỉ vẽ bóng ở bên ngoài.
    canvas.drawShadow(path, shadowColor, elevation, false);
  }

  @override
  bool shouldRepaint(covariant _OuterShadowPainter oldDelegate) {
    return oldDelegate.shadowColor != shadowColor ||
        oldDelegate.elevation != elevation ||
        oldDelegate.borderRadius != borderRadius;
  }
}
