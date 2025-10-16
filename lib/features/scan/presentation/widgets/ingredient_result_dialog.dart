// lib/features/scan/presentation/widgets/ingredient_result_dialog.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cookora/core/utils/snackbar_helper.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient.dart';
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
    // Tạo một bản sao để có thể xóa item khỏi danh sách
    _editableIngredients = List<Ingredient>.from(widget.results);
  }

  void _addAllIngredients() {
    if (_editableIngredients.isEmpty) {
      Navigator.of(context).pop();
      return;
    }

    // >> THAY ĐỔI: Tạo danh sách item với lotData là Map <<
    final itemsToAdd = _editableIngredients.map((ingredient) {
      final lotData = {
        'quantity': 1.0, // Mặc định số lượng là 1
        'unit': ingredient.validUnits.isNotEmpty
            ? ingredient.validUnits.first
            : 'cái',
        'purchaseDate': DateTime.now(),
        // expiryDate sẽ được BLoC hoặc DataSource tính toán nếu cần
      };
      return (ingredient: ingredient, lotData: lotData);
    }).toList();

    // >> THAY ĐỔI: Gọi event addMultipleLots mới <<
    context.read<PantryBloc>().add(AddMultipleLots(items: itemsToAdd));

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

    // Mở LotFormDialog, nó sẽ trả về một Map<String, dynamic>
    final resultData = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (_) => LotFormDialog(ingredient: ingredient),
    );

    if (resultData != null && mounted) {
      // >> THAY ĐỔI: Gọi event AddLot với resultData <<
      context.read<PantryBloc>().add(
        AddLot(ingredient: ingredient, lotData: resultData),
      );

      // Xóa khỏi danh sách hiện tại để không bị thêm lần nữa khi nhấn "Thêm tất cả"
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
    // UI không có gì thay đổi
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
              subtitle: const Text('Nhấn để chỉnh sửa chi tiết'),
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
          child: Text(_editableIngredients.isNotEmpty ? 'Thêm tất cả' : 'Xong'),
        ),
      ],
    );
  }
}
