import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cookora/core/utils/snackbar_helper.dart';
import 'package:cookora/core/widgets/ingredient_form_dialog.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient_entity.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_bloc.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_event.dart';

class IngredientResultDialog extends StatefulWidget {
  final List<IngredientEntity> results;

  const IngredientResultDialog({super.key, required this.results});

  @override
  State<IngredientResultDialog> createState() => _IngredientResultDialogState();
}

class _IngredientResultDialogState extends State<IngredientResultDialog> {
  late List<IngredientEntity> _editableIngredients;

  @override
  void initState() {
    super.initState();
    // Tạo một bản sao của danh sách để có thể chỉnh sửa
    _editableIngredients = List<IngredientEntity>.from(widget.results);
  }

  // Hàm xử lý khi người dùng nhấn "Thêm tất cả"
  void _addAllIngredients() {
    if (_editableIngredients.isEmpty) {
      Navigator.of(context).pop();
      return;
    }

    final pantryBloc = context.read<PantryBloc>();
    // Gửi một loạt sự kiện AddIngredient cho tất cả nguyên liệu trong danh sách
    for (final ingredient in _editableIngredients) {
      pantryBloc.add(AddIngredient(ingredient: ingredient));
    }
    context.showSnackBar(
      'Đã thêm ${_editableIngredients.length} nguyên liệu vào tủ bếp',
      type: SnackBarType.success,
    );

    Navigator.of(context).pop(); // Đóng dialog sau khi thêm
  }

  // Hàm để mở dialog chỉnh sửa và cập nhật lại danh sách
  void _editIngredient(int index) async {
    final ingredientToEdit = _editableIngredients[index];

    final updatedIngredient = await showDialog<IngredientEntity>(
      context: context,
      builder: (_) => IngredientFormDialog(initialIngredient: ingredientToEdit),
    );

    // Nếu người dùng lưu và có kết quả trả về, cập nhật lại state
    if (updatedIngredient != null) {
      setState(() {
        _editableIngredients[index] = updatedIngredient;
      });
    }
  }

  // Hàm xóa nguyên liệu
  void _deleteIngredient(int index) {
    setState(() {
      _editableIngredients.removeAt(index);
    });
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
              subtitle: (ingredient.quantity > 0 && ingredient.unit.isNotEmpty)
                  ? Text('Gợi ý: ${ingredient.quantity} ${ingredient.unit}')
                  : const Text('Nhấn để thêm chi tiết'),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                tooltip: 'Xóa',
                onPressed: () => _deleteIngredient(index),
              ),
              onTap: () => _editIngredient(index),
            );
          },
        ),
      ),
      actions: <Widget>[
        // Nút "Bỏ qua"
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Bỏ qua'),
        ),
        // Nút "Thêm tất cả"
        FilledButton(
          onPressed: _addAllIngredients,
          child: const Text('Thêm tất cả'),
        ),
      ],
    );
  }
}
