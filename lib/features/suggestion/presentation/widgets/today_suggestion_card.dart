import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodaySuggestionCard extends StatelessWidget {
  const TodaySuggestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        height: 162.h,
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(19.r),
        ),
        clipBehavior: Clip.hardEdge,
        child: Row(
          children: [
            // Cột 1: Chứa nội dung văn bản và nút
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.w, 20.w, 0, 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Nhóm văn bản
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hôm nay ăn gì?',
                          style: textTheme.labelLarge?.copyWith(
                            color: colorScheme.onPrimary,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Khám phá công thức nấu ăn từ thực phẩm trong tủ lạnh của bạn ngay',
                          style: textTheme.titleSmall?.copyWith(
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),

                    // Nút hình tròn
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        color: colorScheme.tertiary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: colorScheme.primary,
                        size: 15.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Cột 2: Chứa hình ảnh
            Expanded(
              flex: 3,
              child: Transform.rotate(
                angle: -math.pi / 12,
                child: Transform.scale(
                  scale: 1.7,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/hamburger.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
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
