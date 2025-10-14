import 'package:flutter/material.dart';

import 'package:cookora/core/themes/extensions/app_gradient.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Lấy AppGradients extension từ theme hiện tại của app
    final AppGradients? gradients = Theme.of(context).extension<AppGradients>();

    // 2. Trả về một Container để vẽ gradient
    return Container(
      // Kích thước của Container sẽ lấp đầy màn hình vì nó là con đầu tiên của Stack
      decoration: BoxDecoration(
        // 3. Sử dụng gradient đã được định nghĩa trong theme
        gradient: gradients?.background,
      ),
    );
  }
}
