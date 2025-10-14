import 'package:cookora/core/widgets/glassmorphic_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      pinned: true,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: GlassmorphicContainer(
          height: 45.h,
          borderRadius: 27.r,
          blurSigma: 10.0,
          gradient: LinearGradient(
            colors: [Colors.white.withAlpha(51), Colors.white.withAlpha(26)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: Colors.white.withAlpha(77), width: 0.8),
          shadowColor: Colors.black.withAlpha(38),
          shadowElevation: 4.0,
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.primary,
              fontSize: 12.sp,
            ),
            decoration: InputDecoration(
              isCollapsed: true,
              filled: false,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: 'Tìm kiếm công thức, món ăn...',
              // Dùng prefixIcon cho icon tìm kiếm
              prefixIcon: Padding(
                // Thêm padding để vòng tròn không bị dính sát cạnh
                padding: EdgeInsets.only(right: 9.w),
                child: Container(
                  width: 43.r,
                  height: 43.r,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      width: 29.51.r,
                      height: 29.51.r,
                      colorFilter: ColorFilter.mode(
                        colorScheme.onPrimary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
              // Dùng suffixIcon cho icon micro
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.w),
                child: SvgPicture.asset(
                  'assets/icons/mic.svg',
                  width: 24.r,
                  height: 24.r,
                  colorFilter: ColorFilter.mode(
                    colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              hintStyle: textTheme.titleMedium?.copyWith(
                color: colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
