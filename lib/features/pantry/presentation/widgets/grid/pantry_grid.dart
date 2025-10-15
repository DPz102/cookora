// lib/features/pantry/presentation/widgets/grid/pantry_grid.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/widgets/async_sliver_builder.dart';
import 'package:cookora/core/widgets/empty_state_widget.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_entry.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_bloc.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_state.dart';
import 'package:cookora/features/pantry/presentation/bloc/ingredient_management/ingredient_bloc.dart';
import 'package:cookora/features/pantry/presentation/bloc/ingredient_management/ingredient_state.dart'
    as mgmt;
import 'pantry_entry_card.dart';
import '../entry/pantry_entry_details_dialog.dart';

class PantryGrid extends StatelessWidget {
  final String selectedCategory;

  const PantryGrid({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PantryBloc, PantryState>(
      builder: (context, pantryState) {
        return BlocBuilder<IngredientBloc, mgmt.IngredientState>(
          builder: (context, ingredientState) {
            final combinedState = pantryState.entriesStatus
                .when<
                  AsyncState<
                    ({
                      List<PantryEntry> entries,
                      Map<String, Ingredient> ingredientsMap,
                    })
                  >
                >(
                  initial: () =>
                      const AsyncInitial<
                        ({
                          List<PantryEntry> entries,
                          Map<String, Ingredient> ingredientsMap,
                        })
                      >(),
                  loading: () =>
                      const AsyncLoading<
                        ({
                          List<PantryEntry> entries,
                          Map<String, Ingredient> ingredientsMap,
                        })
                      >(),
                  failure: (error) =>
                      AsyncFailure<
                        ({
                          List<PantryEntry> entries,
                          Map<String, Ingredient> ingredientsMap,
                        })
                      >(error),
                  success: (entries) =>
                      ingredientState.ingredientsMap.when<
                        AsyncState<
                          ({
                            List<PantryEntry> entries,
                            Map<String, Ingredient> ingredientsMap,
                          })
                        >
                      >(
                        initial: () =>
                            const AsyncLoading<
                              ({
                                List<PantryEntry> entries,
                                Map<String, Ingredient> ingredientsMap,
                              })
                            >(),
                        loading: () =>
                            const AsyncLoading<
                              ({
                                List<PantryEntry> entries,
                                Map<String, Ingredient> ingredientsMap,
                              })
                            >(),
                        failure: (error) =>
                            AsyncFailure<
                              ({
                                List<PantryEntry> entries,
                                Map<String, Ingredient> ingredientsMap,
                              })
                            >(error),
                        success: (ingredientsMap) =>
                            AsyncSuccess<
                              ({
                                List<PantryEntry> entries,
                                Map<String, Ingredient> ingredientsMap,
                              })
                            >((
                              entries: entries,
                              ingredientsMap: ingredientsMap,
                            )),
                      ),
                );

            return AsyncSliverBuilder<
              ({
                List<PantryEntry> entries,
                Map<String, Ingredient> ingredientsMap,
              })
            >(
              asyncState: combinedState,
              successBuilder: (_, data) {
                final entries = data.entries;
                final ingredientsMap = data.ingredientsMap;

                // Logic lọc dữ liệu
                final filteredEntries = _filterEntries(
                  entries,
                  ingredientsMap,
                  selectedCategory,
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
                      final entry = filteredEntries[index];
                      final ingredientInfo =
                          ingredientsMap[entry.ingredientId] ??
                          Ingredient(
                            ingredientId: entry.ingredientId,
                            name: 'Không rõ',
                          );

                      return PantryEntryCard(
                        entry: entry,
                        ingredientInfo: ingredientInfo,
                        onTap: () =>
                            _showEntryDetails(context, entry, ingredientInfo),
                      );
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  List<PantryEntry> _filterEntries(
    List<PantryEntry> entries,
    Map<String, Ingredient> ingredientsMap,
    String selectedCategory,
  ) {
    if (selectedCategory == 'Tất cả') return entries;

    return entries.where((entry) {
      final ingredientInfo = ingredientsMap[entry.ingredientId];
      return ingredientInfo?.category == selectedCategory;
    }).toList();
  }

  Widget _buildEmptyState(BuildContext context) {
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
