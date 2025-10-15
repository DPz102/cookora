// lib/features/scan/presentation/widgets/ingredient_result_dialog.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cookora/core/utils/snackbar_helper.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_lot.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_bloc.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_event.dart';
import 'package:cookora/features/pantry/presentation/widgets/ingredient/lot_form_dialog.dart';

class IngredientResultDialog extends StatefulWidget {
  final List<Ingredient> results;

  const IngredientResultDialog({super.key, required this.results});

  @override
  State<IngredientResultDialog> createState() => _IngredientResultDialogState();
}

class _IngredientResultDialogState extends State<IngredientResultDialog> {
  late List<Ingredient> _editableIngredients;

  @override
  void initState() {
    super.initState();
    _editableIngredients = List<Ingredient>.from(widget.results);
  }

  void _addAllIngredients() {
    if (_editableIngredients.isEmpty) {
      Navigator.of(context).pop();
      return;
    }

    final pantryBloc = context.read<PantryBloc>();
    for (final ingredient in _editableIngredients) {
      // Chuyển đổi từ Ingredient (kết quả scan) thành PantryLot để thêm vào kho
      final newLot = PantryLot(
        ingredientId: ingredient.ingredientId, // Giả định AI trả về ID đúng
        currentQuantity: 1, // Mặc định số lượng là 1, người dùng có thể sửa sau
        unit: ingredient.validUnits.isNotEmpty
            ? ingredient.validUnits.first
            : 'cái',
        purchaseDate: DateTime.now(),
      );
      pantryBloc.add(AddLot(lot: newLot));
    }
    context.showSnackBar(
      'Đã thêm ${_editableIngredients.length} nguyên liệu vào tủ bếp',
      type: SnackBarType.success,
    );

    Navigator.of(context).pop();
  }

  void _deleteIngredient(int index) {
    setState(() {
      _editableIngredients.removeAt(index);
    });
  }

  void _editIngredientDetails(int index) async {
    final ingredient = _editableIngredients[index];

    // Tạo lot tạm thời để mở form
    final tempLot = PantryLot(
      ingredientId: ingredient.ingredientId,
      currentQuantity: 1,
      unit: ingredient.validUnits.isNotEmpty
          ? ingredient.validUnits.first
          : 'cái',
      purchaseDate: DateTime.now(),
    );

    final result = await showDialog<PantryLot>(
      context: context,
      builder: (_) =>
          LotFormDialog(ingredient: ingredient, initialLot: tempLot),
    );

    if (result != null && mounted) {
      // Thêm ngay vào pantry với thông tin chi tiết đã chỉnh sửa
      context.read<PantryBloc>().add(AddLot(lot: result));

      // Xóa khỏi danh sách để tránh thêm lần nữa
      setState(() {
        _editableIngredients.removeAt(index);
      });

      if (mounted) {
        context.showSnackBar(
          'Đã thêm ${ingredient.name} vào tủ bếp với chi tiết tùy chỉnh',
          type: SnackBarType.success,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nguyên liệu nhận diện được'),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _editableIngredients.length,
          itemBuilder: (context, index) {
            final ingredient = _editableIngredients[index];
            return ListTile(
              title: Text(ingredient.name),
              subtitle: const Text(
                'Nhấn để chỉnh sửa chi tiết số lượng, đơn vị',
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                onPressed: () => _deleteIngredient(index),
              ),
              onTap: () => _editIngredientDetails(index),
            );
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Bỏ qua'),
        ),
        FilledButton(
          onPressed: _addAllIngredients,
          child: const Text('Thêm tất cả'),
        ),
      ],
    );
  }
}
