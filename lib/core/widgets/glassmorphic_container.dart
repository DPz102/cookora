import 'dart:ui';

import 'package:flutter/material.dart';

/// Một widget tạo ra hiệu ứng kính mờ (glass morphism) với bóng đổ chỉ ở viền ngoài.
///
/// Widget này kết hợp BackdropFilter để làm mờ nền, cho phép sử dụng màu nền đơn,
/// gradient, và border để tùy chỉnh, cùng với CustomPaint để vẽ bóng đổ.
class GlassmorphicContainer extends StatelessWidget {
  const GlassmorphicContainer({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.borderRadius = 27.0,
    this.blurSigma = 5.0,
    this.backgroundColor = const Color(0x70FFFFFF),
    this.gradient,
    this.border,
    this.shadowColor = const Color(0x26000000),
    this.shadowElevation = 4.0,
  }) : assert(
         gradient == null || backgroundColor == const Color(0x70FFFFFF),
         'Cannot provide both a backgroundColor and a gradient. Use one or the other.',
       );

  /// Nội dung sẽ được hiển thị bên trong container.
  final Widget child;

  /// Chiều cao của container. Mặc định sẽ co giãn theo `child`.
  final double? height;

  /// Chiều rộng của container. Mặc định sẽ co giãn theo `child`.
  final double? width;

  /// Độ bo tròn của các góc.
  final double borderRadius;

  /// Độ mờ của hiệu ứng kính (giá trị sigma cho ImageFilter.blur).
  final double blurSigma;

  /// Màu nền bán trong suốt phủ lên trên lớp kính mờ.
  /// Sẽ bị bỏ qua nếu `gradient` được cung cấp.
  final Color backgroundColor;

  /// [MỚI] Gradient cho nền. Sẽ được ưu tiên hơn `backgroundColor`.
  final Gradient? gradient;

  /// [MỚI] Đường viền cho container.
  final BoxBorder? border;

  /// Màu của bóng đổ.
  final Color shadowColor;

  /// Độ "nổi" của bóng, quyết định độ lan tỏa của bóng.
  final double shadowElevation;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
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
            decoration: BoxDecoration(
              // SỬA ĐỔI QUAN TRỌNG: Thêm borderRadius ở đây
              // để đảm bảo border được vẽ đúng hình dạng bo tròn ngay từ đầu.
              borderRadius: BorderRadius.circular(borderRadius),
              color: gradient == null ? backgroundColor : null,
              gradient: gradient,
              border: border,
            ),
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

    canvas.drawShadow(path, shadowColor, elevation, false);
  }

  @override
  bool shouldRepaint(covariant _OuterShadowPainter oldDelegate) {
    return oldDelegate.shadowColor != shadowColor ||
        oldDelegate.elevation != elevation ||
        oldDelegate.borderRadius != borderRadius;
  }
}
