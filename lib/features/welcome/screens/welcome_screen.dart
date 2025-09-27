import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:cookora/core/widgets/highlighted_text.dart';
import 'package:cookora/core/widgets/show_markdown_bottom_sheet.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: SafeArea(
        child: Stack(
          children: [
            _buildBackgroundGraphics(),

            _buildContent(context, textTheme, colorScheme),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundGraphics() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Hình ảnh trang trí
        Positioned(
          top: 210.h,
          left: -43.h,
          width: 302.w,
          height: 302.h,
          child: Image.asset('assets/images/scan_illustration.png'),
        ),
        Positioned(
          top: 210.h,
          left: -14.h,
          width: 524.w,
          height: 524.h,
          child: Image.asset('assets/images/noodle_bow.png'),
        ),
      ],
    );
  }

  Widget _buildContent(
    BuildContext context,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    const double verticalGap = 50.0;
    return // Nội dung chính
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ).copyWith(top: verticalGap.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tiêu đề
          HighlightedText(
            text: "CHỌN\n**COOKORA**\nCHỌN\n**TỐT HƠN**",
            style: textTheme.displaySmall!.copyWith(
              color: colorScheme.tertiary,
            ),
            highlightStyle: textTheme.displaySmall!.copyWith(
              color: colorScheme.secondary,
            ),
          ),

          const Spacer(),

          // Nút hành động chính
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => context.push('/signin'),
              child: const Text('BẮT ĐẦU NGAY!'),
            ),
          ),

          SizedBox(height: verticalGap.h),

          // Chú thích chính sách
          Center(
            child: HighlightedText(
              text: 'Khi bắt đầu, bạn đồng ý với **Chính sách quyền riêng tư**',
              style: textTheme.bodySmall!.copyWith(
                color: colorScheme.onPrimary,
              ),
              highlightStyle: textTheme.bodySmall!.copyWith(
                color: colorScheme.onPrimary,
                decoration: TextDecoration.underline,
                decorationColor: colorScheme.onPrimary,
              ),
              onHighlightTap: () {
                showMarkdownBottomSheet(
                  context,
                  filePath: 'assets/markdown/privacy_policy.md',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
