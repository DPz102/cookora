import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cookora/features/kitchen_log/presentation/bloc/kitchen_log_bloc.dart';
import 'package:cookora/features/kitchen_log/presentation/bloc/kitchen_log_event.dart';
import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';

class DishResultDialog extends StatelessWidget {
  final RecipeEntity recipe;

  const DishResultDialog({super.key, required this.recipe});

  void _addToKitchenLog(BuildContext context) {
    context.read<KitchenLogBloc>().add(AddRecipeToLog(recipe: recipe));
    Navigator.of(context).pop();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Đã lưu công thức vào Nhật ký Bếp!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(recipe.name),
      content: SingleChildScrollView(
        child: Text(
          recipe.description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Để sau'),
        ),
        FilledButton(
          onPressed: () => _addToKitchenLog(context),
          child: const Text('Lưu vào Nhật ký'),
        ),
      ],
    );
  }
}
