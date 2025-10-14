import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreenTemplate extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> formFields;
  final Widget? belowForm;
  final Widget primaryButton;
  final List<Widget> socialButtons;
  final Widget footer;

  const AuthScreenTemplate({
    super.key,
    required this.title,
    required this.subtitle,
    required this.formFields,
    this.belowForm,
    required this.primaryButton,
    required this.socialButtons,
    required this.footer,
  });

  static const double verticalGap = 18.5;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Logo
            Image.asset(
              'assets/images/logo.png',
              width: 309.26.w,
              height: 167.h,
            ),

            // Phần panel trắng
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary,
                      offset: Offset(0, -24),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Tiêu đề & Phụ đề
                      Text(
                        title,
                        style: textTheme.headlineMedium?.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),

                      SizedBox(height: verticalGap.h),

                      Text(
                        subtitle,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.inversePrimary,
                        ),
                      ),

                      SizedBox(height: verticalGap.h),

                      // Form điền thông tin
                      ...formFields,

                      SizedBox(height: verticalGap.h),

                      if (belowForm != null) ...[
                        belowForm!,
                        SizedBox(height: verticalGap.h),
                      ],

                      // Nút hành động chính
                      SizedBox(width: double.infinity, child: primaryButton),

                      SizedBox(height: verticalGap.h),

                      // Đường kẻ phân cách
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              'hoặc',
                              style: textTheme.titleMedium?.copyWith(
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),

                      SizedBox(height: verticalGap.h),

                      // Các nút đăng nhập mạng xã hội
                      ...socialButtons,

                      if (socialButtons.isNotEmpty)
                        SizedBox(height: verticalGap.h),

                      // Footer
                      footer,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
