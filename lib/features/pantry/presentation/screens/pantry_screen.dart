import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/snackbar_helper.dart';
import 'package:cookora/core/widgets/async_state_builder.dart';
import 'package:cookora/core/widgets/ingredient_form_dialog.dart';

import 'package:cookora/features/pantry/domain/entities/ingredient_entity.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_bloc.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_state.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_event.dart';
import 'package:cookora/features/pantry/presentation/widgets/ingredient_card.dart';

class PantryScreen extends StatelessWidget {
  const PantryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pantryBloc = context.read<PantryBloc>();

    return Scaffold(
      appBar: AppBar(title: const Text('Tủ bếp của bạn')),
      body: BlocListener<PantryBloc, PantryState>(
        listenWhen: (p, c) => c.mutationStatus != c.mutationStatus,
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
        child: const _PantryView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newIngredient = await showDialog<IngredientEntity>(
            context: context,
            builder: (_) => const IngredientFormDialog(),
          );

          if (newIngredient != null) {
            pantryBloc.add(AddIngredient(ingredient: newIngredient));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _PantryView extends StatelessWidget {
  const _PantryView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PantryBloc, PantryState>(
      buildWhen: (p, c) => p.ingredientsStatus != c.ingredientsStatus,
      builder: (context, state) {
        return AsyncStateBuilder<List<IngredientEntity>>(
          asyncState: state.ingredientsStatus,
          successBuilder: (_, ingredients) => ingredients.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      'Tủ bếp của bạn đang trống.\nNhấn nút + để thêm nguyên liệu.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                )
              : GridView.builder(
                  padding: EdgeInsets.all(16.w),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 1.2,
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
  }
}
