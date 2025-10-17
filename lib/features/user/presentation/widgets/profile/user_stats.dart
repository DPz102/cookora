import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserStats extends StatelessWidget {
  const UserStats({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _StatItem(count: '12', label: 'bài viết'),
        _StatItem(count: '8', label: 'người theo dõi'),
        _StatItem(count: '23', label: 'đang theo dõi'),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.count, required this.label});
  final String count;
  final String label;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          count,
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 4.h),
        Text(label, style: textTheme.bodyMedium),
      ],
    );
  }
}
