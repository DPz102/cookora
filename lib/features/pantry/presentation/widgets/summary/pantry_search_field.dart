// lib/features/pantry/presentation/widgets/summary/pantry_search_field.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:cookora/core/widgets/glassmorphic_container.dart';

class PantrySearchField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool enabled;
  final bool showMicIcon;

  const PantrySearchField({
    super.key,
    this.controller,
    this.hintText = 'Nhập nguyên liệu...',
    this.onChanged,
    this.onTap,
    this.enabled = true,
    this.showMicIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return GlassmorphicContainer(
      height: 35.h,
      borderRadius: 75.r,
      blurSigma: 10.0,
      shadowElevation: 0,
      gradient: LinearGradient(
        colors: [Colors.white.withAlpha(51), Colors.white.withAlpha(26)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      border: Border.all(color: Colors.white.withAlpha(77), width: 0.8),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        enabled: enabled,
        textAlignVertical: TextAlignVertical.center,
        style: textTheme.bodyLarge?.copyWith(color: colorScheme.onPrimary),
        decoration: InputDecoration(
          filled: false,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: hintText,
          suffixIcon: showMicIcon
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: SvgPicture.asset(
                    'assets/icons/mic.svg',
                    colorFilter: ColorFilter.mode(
                      colorScheme.onPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                )
              : null,
          hintStyle: textTheme.titleMedium?.copyWith(
            color: colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
