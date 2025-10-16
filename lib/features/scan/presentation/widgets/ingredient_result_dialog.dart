// lib/features/scan/presentation/widgets/ingredient_result_dialog.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:cookora/core/utils/snackbar_helper.dart';

import 'package:cookora/features/pantry/domain/entities/ingredient.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_lot.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_bloc.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_event.dart';

import 'package:cookora/features/pantry/presentation/widgets/ingredient/lot_form_dialog.dart';
import 'package:cookora/features/pantry/presentation/widgets/ingredient/ingredient_search_widget.dart';

// Sử dụng record type của Dart để quản lý cặp dữ liệu một cách gọn gàng.
typedef IngredientLot = ({Ingredient ingredient, Map<String, dynamic> lotData});

class IngredientResultDialog extends StatefulWidget {
  final List<Ingredient> results;

  const IngredientResultDialog({super.key, required this.results});

  @override
  State<IngredientResultDialog> createState() => _IngredientResultDialogState();
}

class _IngredientResultDialogState extends State<IngredientResultDialog> {
  // State của dialog bây giờ là một danh sách các IngredientLot
  late List<IngredientLot> _editableItems;

  @override
  void initState() {
    super.initState();
    // Chuyển đổi List<Ingredient> ban đầu thành List<IngredientLot> với lotData mặc định
    _editableItems = widget.results.map((ingredient) {
      final Map<String, dynamic> lotData = {
        'quantity': 1.0,
        'unit': ingredient.validUnits.isNotEmpty
            ? ingredient.validUnits.first
            : 'đơn vị',
        'purchaseDate': DateTime.now(),
        'expiryDate': DateTime.now().add(
          Duration(days: ingredient.defaultShelfLifeInDays),
        ),
      };
      return (ingredient: ingredient, lotData: lotData);
    }).toList();
  }

  // Gửi toàn bộ danh sách hiện tại đến BLoC
  void _addAllIngredients() {
    if (_editableItems.isEmpty) {
      Navigator.of(context).pop();
      return;
    }

    // GỌI EVENT addMultipleLots
    context.read<PantryBloc>().add(AddMultipleLots(items: _editableItems));

    context.showSnackBar(
      'Đã thêm ${_editableItems.length} nguyên liệu vào tủ bếp',
      type: SnackBarType.success,
    );

    Navigator.of(context).pop();
  }

  // Xóa một item khỏi danh sách (chỉ cập nhật UI của dialog)
  void _deleteIngredient(int index) {
    setState(() {
      _editableItems.removeAt(index);
    });
  }

  // Chỉnh sửa một item trong danh sách
  void _editIngredientDetails(int index) async {
    final currentItem = _editableItems[index];

    // Mở LotFormDialog, truyền vào dữ liệu hiện có của item
    final resultData = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (_) => LotFormDialog(
        ingredient: currentItem.ingredient,
        // Chuyển đổi Map thành PantryLot để tương thích với LotFormDialog
        initialLot: PantryLot.fromJson(currentItem.lotData),
      ),
    );

    // Nếu có kết quả trả về, cập nhật lại item trong danh sách và rebuild UI
    if (resultData != null) {
      setState(() {
        _editableItems[index] = (
          ingredient: currentItem.ingredient,
          lotData: resultData,
        );
      });
    }
  }

  // Mở bottom sheet để tìm và thêm nguyên liệu mới <<
  void _addIngredient() async {
    // 1. Mở bottom sheet chứa widget tìm kiếm
    final selectedIngredient = await showModalBottomSheet<Ingredient>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const _AddIngredientSheet(),
    );

    if (selectedIngredient == null) return;

    // 2. Mở LotFormDialog để nhập chi tiết cho nguyên liệu vừa chọn

    if (mounted) {
      final resultData = await showDialog<Map<String, dynamic>>(
        context: context,
        builder: (_) => LotFormDialog(ingredient: selectedIngredient),
      );

      // 3. Nếu người dùng xác nhận, thêm nguyên liệu mới vào danh sách và rebuild UI
      if (resultData != null) {
        setState(() {
          _editableItems.add((
            ingredient: selectedIngredient,
            lotData: resultData,
          ));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Nguyên liệu'),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: _addIngredient,
            tooltip: 'Thêm nguyên liệu khác',
          ),
        ],
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: _editableItems.isEmpty
            ? const Center(child: Text('Không còn nguyên liệu nào để thêm.'))
            : ListView.builder(
                shrinkWrap: true,
                itemCount: _editableItems.length,
                itemBuilder: (context, index) {
                  final item = _editableItems[index];
                  final lotData = item.lotData;
                  /*
                  final shelfLife = item.ingredient.defaultShelfLifeInDays;
                  final subtitleText =
                      'SL: ${lotData['quantity']} ${lotData['unit']} - HSD: ~${shelfLife} ngày';
                  */
                  final expiryDate = lotData['expiryDate'] as DateTime?;

                  // Cải thiện hiển thị thông tin chi tiết
                  final subtitleText =
                      'SL: ${lotData['quantity']} ${lotData['unit']} - HSD: ${expiryDate != null ? DateFormat('dd/MM/yyyy').format(expiryDate) : 'N/A'}';

                  return ListTile(
                    title: Text(item.ingredient.name),
                    subtitle: Text(subtitleText),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete_outline,
                        color: Theme.of(context).colorScheme.error,
                      ),
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
          child: Text(_editableItems.isNotEmpty ? 'Thêm tất cả' : 'Xong'),
        ),
      ],
    );
  }
}

// Widget private cho bottom sheet tìm kiếm, giúp đóng gói logic
class _AddIngredientSheet extends StatelessWidget {
  const _AddIngredientSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Text(
            'Tìm & Thêm Nguyên Liệu',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Expanded(
            child: IngredientSearchWidget(
              onIngredientSelected: (ingredient) {
                // Khi chọn một nguyên liệu, đóng bottom sheet và trả về ingredient đã chọn
                Navigator.of(context).pop(ingredient);
              },
            ),
          ),
        ],
      ),
    );
  }
}
