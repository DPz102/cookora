import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient_entity.dart';

class IngredientFormDialog extends StatefulWidget {
  final IngredientEntity? initialIngredient;

  const IngredientFormDialog({super.key, this.initialIngredient});

  @override
  State<IngredientFormDialog> createState() => _IngredientFormDialogState();
}

class _IngredientFormDialogState extends State<IngredientFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _quantityController;
  late final TextEditingController _unitController;

  bool get _isEditing => widget.initialIngredient?.id.isNotEmpty ?? false;

  @override
  void initState() {
    super.initState();
    final ingredient = widget.initialIngredient;
    _nameController = TextEditingController(text: ingredient?.name ?? '');
    _quantityController = TextEditingController(
      text: (ingredient?.quantity != null && ingredient!.quantity > 0)
          ? ingredient.quantity.toString()
          : '',
    );
    _unitController = TextEditingController(text: ingredient?.unit ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    _unitController.dispose();
    super.dispose();
  }

  void _submitForm() {
    // Kiểm tra form có hợp lệ không
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final resultEntity = (widget.initialIngredient ?? const IngredientEntity())
        .copyWith(
          name: _nameController.text.trim(),
          quantity: double.tryParse(_quantityController.text.trim()) ?? 0.0,
          unit: _unitController.text.trim(),
        );

    // Đóng dialog sau khi gửi event
    Navigator.of(context).pop(resultEntity);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_isEditing ? 'Sửa nguyên liệu' : 'Thêm nguyên liệu'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: 'Tên nguyên liệu *',
                ),
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? 'Vui lòng nhập tên'
                    : null,
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: _quantityController,
                decoration: const InputDecoration(labelText: 'Số lượng *'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Vui lòng nhập số lượng';
                  }
                  if (double.tryParse(value) == null) return 'Số không hợp lệ';
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: _unitController,
                decoration: const InputDecoration(
                  labelText: 'Đơn vị *',
                  hintText: 'cái, gram, kg, ml...',
                ),
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? 'Vui lòng nhập đơn vị'
                    : null,
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Hủy'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        FilledButton(
          onPressed: _submitForm,
          child: Text(_isEditing ? 'Lưu' : 'Thêm'),
        ),
      ],
    );
  }
}
