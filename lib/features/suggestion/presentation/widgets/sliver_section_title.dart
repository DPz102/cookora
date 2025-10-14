import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliverSectionTitle extends StatelessWidget {
  final String title;

  const SliverSectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Text(
          title,
          style: textTheme.headlineSmall?.copyWith(color: colorScheme.primary),
        ),
      ),
    );
  }
}
