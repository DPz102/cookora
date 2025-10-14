import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:cookora/core/widgets/glassmorphic_container.dart';

class PantrySummaryCard extends StatelessWidget {
  const PantrySummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        height: 270.h,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.r),
          color: colorScheme.primary,
        ),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Positioned(
              bottom: -78.h,
              left: 0,
              right: 0,
              height: 308.h,
              child: Center(
                child: Image.asset(
                  'assets/images/vegetable_basket.png',
                  width: 308.w,
                  height: 308.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Hàng chứa các thông số
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatColumn(
                        context,
                        label: 'Tổng số',
                        value: '12',
                        valueColor: colorScheme.onPrimary,
                      ),
                      _buildStatColumn(
                        context,
                        label: 'Sắp hết hạn',
                        value: '5',
                        valueColor: colorScheme.tertiary,
                      ),
                      _buildStatColumn(
                        context,
                        label: 'Đã hết hạn',
                        value: '3',
                        valueColor: colorScheme.secondary,
                      ),
                    ],
                  ),

                  // Thanh tìm kiếm
                  GlassmorphicContainer(
                    height: 35.h,
                    borderRadius: 75.r,
                    blurSigma: 10.0,
                    shadowElevation: 0, // Tắt bóng đổ nếu không cần
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withAlpha(51),
                        Colors.white.withAlpha(26),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(
                      color: Colors.white.withAlpha(77),
                      width: 0.8,
                    ),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onPrimary,
                      ),
                      decoration: InputDecoration(
                        filled: false,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: 'Nhập nguyên liệu...',
                        suffixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.w),
                          child: SvgPicture.asset(
                            'assets/icons/mic.svg',
                            colorFilter: ColorFilter.mode(
                              colorScheme.onPrimary,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        hintStyle: textTheme.titleMedium?.copyWith(
                          color: colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget helper để tạo một cột thông số (không thay đổi)
  Widget _buildStatColumn(
    BuildContext context, {
    required String label,
    required String value,
    required Color valueColor,
  }) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: textTheme.bodyLarge?.copyWith(color: colorScheme.onPrimary),
        ),
        SizedBox(height: 8.h),
        Text(
          value,
          style: textTheme.titleSmall?.copyWith(
            fontFamily: 'SpaceGrotesk',
            color: valueColor,
            height: 1.0,
          ),
        ),
      ],
    );
  }
}
