// lib/features/pantry/presentation/widgets/grid/pantry_grid.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cookora/core/widgets/async_sliver_builder.dart';
import 'package:cookora/core/widgets/empty_state_widget.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_entry.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_display_entry.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_bloc.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_state.dart';
import 'pantry_entry_card.dart';
import '../entry/pantry_entry_details_dialog.dart';

class PantryGrid extends StatelessWidget {
  final String selectedCategory;
  final String searchQuery;

  const PantryGrid({
    super.key,
    required this.selectedCategory,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    // Chỉ cần build dựa trên một Bloc duy nhất
    return BlocBuilder<PantryBloc, PantryState>(
      buildWhen: (p, c) => p.displayEntriesStatus != c.displayEntriesStatus,
      builder: (context, state) {
        return AsyncSliverBuilder<List<PantryDisplayEntry>>(
          asyncState: state.displayEntriesStatus,
          successBuilder: (_, displayEntries) {
            // Logic lọc dữ liệu giờ đơn giản hơn nhiều
            final filteredEntries = _filterEntries(
              displayEntries,
              selectedCategory,
              searchQuery,
            );

            if (filteredEntries.isEmpty) {
              return SliverFillRemaining(
                child: Center(child: _buildEmptyState(context)),
              );
            }

            return SliverPadding(
              padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 130.h),
              sliver: SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.w,
                  mainAxisSpacing: 17.h,
                  childAspectRatio: 0.8,
                ),
                itemCount: filteredEntries.length,
                itemBuilder: (context, index) {
                  final displayEntry = filteredEntries[index];

                  return PantryEntryCard(
                    entry: displayEntry.entry,
                    ingredientInfo: displayEntry.ingredientInfo,
                    onTap: () => _showEntryDetails(
                      context,
                      displayEntry.entry,
                      displayEntry.ingredientInfo,
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  List<PantryDisplayEntry> _filterEntries(
    List<PantryDisplayEntry> displayEntries,
    String selectedCategory,
    String searchQuery,
  ) {
    // 1. Lọc theo category
    final categoryFiltered = selectedCategory == 'Tất cả'
        ? displayEntries
        : displayEntries
              .where((d) => d.ingredientInfo.category == selectedCategory)
              .toList();

    // 2. Lọc theo search query
    if (searchQuery.trim().isEmpty) {
      return categoryFiltered;
    }

    final lowerCaseQuery = searchQuery.toLowerCase();
    return categoryFiltered.where((d) {
      final info = d.ingredientInfo;
      final nameMatch = info.name.toLowerCase().contains(lowerCaseQuery);
      final keywordMatch = info.searchKeywords.any(
        (kw) => kw.toLowerCase().contains(lowerCaseQuery),
      );
      return nameMatch || keywordMatch;
    }).toList();
  }

  Widget _buildEmptyState(BuildContext context) {
    // ... (logic không thay đổi)
    if (searchQuery.isNotEmpty) {
      return EmptyStateWidget(
        icon: Icons.search_off_rounded,
        title: 'Không tìm thấy',
        subtitle:
            'Không có nguyên liệu nào khớp với "$searchQuery" trong danh mục này.',
      );
    }
    return EmptyStateWidget(
      icon: Icons.kitchen_outlined,
      title: selectedCategory == 'Tất cả'
          ? 'Tủ bếp của bạn đang trống'
          : 'Không có nguyên liệu nào',
      subtitle: selectedCategory == 'Tất cả'
          ? 'Nhấn nút + để thêm nguyên liệu đầu tiên của bạn.'
          : 'Không có nguyên liệu nào trong danh mục này.',
    );
  }

  void _showEntryDetails(
    BuildContext context,
    PantryEntry entry,
    Ingredient ingredientInfo,
  ) {
    showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<PantryBloc>(),
        child: PantryEntryDetailsDialog(
          entry: entry,
          ingredientInfo: ingredientInfo,
        ),
      ),
    );
  }
}
