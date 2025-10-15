// lib/features/pantry/presentation/screens/add_ingredient_screen.dart
import 'package:cookora/features/pantry/presentation/bloc/pantry_bloc.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cookora/features/pantry/domain/entities/ingredient.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_lot.dart';
import 'package:cookora/features/pantry/presentation/widgets/ingredient/lot_form_dialog.dart';
import 'package:cookora/features/pantry/presentation/widgets/ingredient/ingredient_search_widget.dart';

class AddIngredientScreen extends StatelessWidget {
  const AddIngredientScreen({super.key});

  void _onIngredientSelected(
    BuildContext context,
    Ingredient ingredient,
  ) async {
    final newLot = await showDialog<PantryLot>(
      context: context,
      builder: (_) => LotFormDialog(ingredient: ingredient),
    );
    if (newLot != null && context.mounted) {
      // Gửi sự kiện trực tiếp đến BLoC
      context.read<PantryBloc>().add(AddLot(lot: newLot));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thêm nguyên liệu')),
      body: IngredientSearchWidget(
        onIngredientSelected: (ingredient) =>
            _onIngredientSelected(context, ingredient),
      ),
    );
  }
}
