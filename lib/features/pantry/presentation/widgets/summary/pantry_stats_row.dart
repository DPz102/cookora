// lib/features/pantry/presentation/widgets/summary/pantry_stats_row.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_entry.dart';

class PantryStatsRow extends StatelessWidget {
  final List<PantryEntry> entries;

  const PantryStatsRow({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Tính toán số liệu
    final totalCount = entries.length;
    int expiringSoonCount = 0;
    int expiredCount = 0;

    final now = DateTime.now();
    // Chuẩn hóa `now` về 0h:0m:0s để so sánh chính xác theo ngày
    final today = DateTime(now.year, now.month, now.day);
    final threeDaysFromNow = today.add(const Duration(days: 3));

    for (final entry in entries) {
      final expiryDate = entry.earliestExpiryDate;
      if (expiryDate != null) {
        if (expiryDate.isBefore(today)) {
          expiredCount++;
        } else if (expiryDate.isBefore(threeDaysFromNow)) {
          expiringSoonCount++;
        }
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatColumn(
          context,
          label: 'Tổng số',
          value: totalCount.toString(),
          valueColor: colorScheme.onPrimary,
        ),
        _buildStatColumn(
          context,
          label: 'Sắp hết hạn',
          value: expiringSoonCount.toString(),
          valueColor: colorScheme.tertiary,
        ),
        _buildStatColumn(
          context,
          label: 'Đã hết hạn',
          value: expiredCount.toString(),
          valueColor: colorScheme.secondary,
        ),
      ],
    );
  }

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
