// lib/features/pantry/presentation/widgets/summary/pantry_summary_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cookora/features/pantry/domain/entities/pantry_display_entry.dart';
import 'package:cookora/features/pantry/presentation/widgets/summary/pantry_stats_row.dart';
import 'package:cookora/features/pantry/presentation/widgets/summary/pantry_search_field.dart';

class PantrySummaryCard extends StatelessWidget {
  final List<PantryDisplayEntry> entries;
  final TextEditingController? searchController;
  final ValueChanged<String>? onSearchChanged;

  const PantrySummaryCard({
    super.key,
    required this.entries,
    this.searchController,
    this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Trích xuất List<PantryEntry> từ List<PantryDisplayEntry>
    final pantryEntries = entries.map((display) => display.entry).toList();

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
                  PantryStatsRow(
                    entries: pantryEntries,
                  ), // Truyền vào list đã trích xuất
                  // Thanh tìm kiếm
                  PantrySearchField(
                    controller: searchController,
                    onChanged: onSearchChanged,
                    hintText: 'Tìm trong kho...',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
