import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/snackbar_helper.dart';
import 'package:cookora/core/widgets/async_sliver_builder.dart';
import 'package:cookora/core/widgets/ingredient_form_dialog.dart';

import 'package:cookora/features/pantry/domain/entities/ingredient_entity.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_bloc.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_event.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_state.dart';
import 'package:cookora/features/pantry/presentation/widgets/ingredient_card.dart';
import 'package:cookora/features/pantry/presentation/widgets/pantry_filter_bar.dart';
import 'package:cookora/features/pantry/presentation/widgets/pantry_summary_card.dart';

class PantryScreen extends StatelessWidget {
  const PantryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pantryBloc = context.read<PantryBloc>();

    return Scaffold(
      backgroundColor: Colors.transparent,

      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 50.h),
        child: FloatingActionButton(
          onPressed: () async {
            final newIngredient = await showDialog<IngredientEntity>(
              context: context,
              builder: (_) => const IngredientFormDialog(),
            );

            if (newIngredient != null) {
              pantryBloc.add(AddIngredient(ingredient: newIngredient));
            }
          },
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          shape: const CircleBorder(),
          elevation: 1,
          child: const Icon(Icons.add),
        ),
      ),

      body: BlocListener<PantryBloc, PantryState>(
        // Listener không đổi, dùng để hiển thị SnackBar
        listenWhen: (p, c) => p.mutationStatus != c.mutationStatus,
        listener: (context, state) {
          final status = state.mutationStatus;
          switch (status) {
            case AsyncSuccess():
              context.showSnackBar(
                'Thao tác thành công!',
                type: SnackBarType.success,
              );
              context.read<PantryBloc>().add(
                const PantryEvent.resetMutationStatus(),
              );
            case AsyncFailure(error: final error):
              context.showSnackBar(error, type: SnackBarType.error);
              context.read<PantryBloc>().add(
                const PantryEvent.resetMutationStatus(),
              );
            default:
              break;
          }
        },
        // _PantryView sẽ chứa toàn bộ UI mới
        child: const _PantryView(),
      ),
    );
  }
}

class _PantryView extends StatelessWidget {
  const _PantryView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Stack(
      children: [
        // Lớp 1: Nội dung chính có thể cuộn
        SafeArea(
          child: CustomScrollView(
            slivers: [
              // AppBar tùy chỉnh
              SliverAppBar(
                title: Text(
                  'Kho nguyên liệu',
                  style: textTheme.headlineSmall?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
                centerTitle: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),

              // Thẻ tóm tắt thông tin tủ bếp
              const SliverToBoxAdapter(child: PantrySummaryCard()),

              SliverPadding(padding: EdgeInsets.only(top: 15.h)),

              const PantryFilterBar(),

              // Danh sách nguyên liệu dạng lưới
              _buildIngredientsGrid(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIngredientsGrid() {
    return BlocBuilder<PantryBloc, PantryState>(
      buildWhen: (p, c) => p.ingredientsStatus != c.ingredientsStatus,
      builder: (context, state) {
        return AsyncSliverBuilder<List<IngredientEntity>>(
          asyncState: state.ingredientsStatus,
          successBuilder: (_, ingredients) {
            if (ingredients.isEmpty) {
              return SliverFillRemaining(
                child: Center(
                  child: Text(
                    'Tủ bếp của bạn đang trống.\nNhấn nút + để thêm nguyên liệu.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              );
            }
            return SliverPadding(
              padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 130.h),
              sliver: SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.w,
                  mainAxisSpacing: 17.h,
                  childAspectRatio: 0.8, // Tỉ lệ cho card mới
                ),
                itemCount: ingredients.length,
                itemBuilder: (context, index) {
                  final ingredient = ingredients[index];
                  return IngredientCard(
                    ingredient: ingredient,
                    onEdit: () => showDialog<void>(
                      context: context,
                      builder: (_) => BlocProvider.value(
                        value: context.read<PantryBloc>(),
                        child: IngredientFormDialog(
                          initialIngredient: ingredient,
                        ),
                      ),
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
}
