// lib/features/pantry/presentation/widgets/ingredient/lot_form_dialog.dart
import 'package:cookora/features/pantry/domain/entities/ingredient.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_lot.dart';
import 'package:cookora/core/widgets/custom_text_field.dart';
import 'package:cookora/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class LotFormDialog extends StatefulWidget {
  // Dữ liệu từ Master Data để lấy các thông tin ràng buộc
  final Ingredient ingredient;
  // Lô hàng ban đầu (nếu là chế độ sửa)
  final PantryLot? initialLot;

  const LotFormDialog({super.key, required this.ingredient, this.initialLot});

  @override
  State<LotFormDialog> createState() => _LotFormDialogState();
}

class _LotFormDialogState extends State<LotFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _quantityController;
  late String _selectedUnit;
  late DateTime _purchaseDate;
  DateTime? _expiryDate;

  bool get _isEditing => widget.initialLot != null;

  @override
  void initState() {
    super.initState();
    final lot = widget.initialLot;
    final now = DateTime.now();

    _quantityController = TextEditingController(
      text: lot?.currentQuantity.toString() ?? '',
    );
    _selectedUnit =
        lot?.unit ?? widget.ingredient.validUnits.firstOrNull ?? 'đơn vị';
    _purchaseDate = lot?.purchaseDate ?? now;

    // Thiết lập ngày hết hạn mặc định
    if (lot?.expiryDate != null) {
      _expiryDate = lot!.expiryDate;
    } else {
      _expiryDate = _purchaseDate.add(
        Duration(days: widget.ingredient.defaultShelfLifeInDays),
      );
    }
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(
    BuildContext context, {
    required DateTime initialDate,
    required ValueChanged<DateTime> onDateSelected,
  }) async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: now.subtract(const Duration(days: 365 * 5)),
      lastDate: now.add(const Duration(days: 365 * 10)),
    );
    if (pickedDate != null) {
      onDateSelected(pickedDate);
    }
  }

  void _submitForm() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final resultLot =
        (widget.initialLot ??
                PantryLot(ingredientId: widget.ingredient.ingredientId))
            .copyWith(
              currentQuantity:
                  double.tryParse(_quantityController.text.trim()) ?? 0.0,
              unit: _selectedUnit,
              purchaseDate: _purchaseDate,
              expiryDate: _expiryDate,
              initialQuantity: _isEditing
                  ? widget.initialLot!.initialQuantity
                  : double.tryParse(_quantityController.text.trim()) ?? 0.0,
            );

    Navigator.of(context).pop(resultLot);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      title: Text(
        '${_isEditing ? 'Sửa' : 'Thêm'} lô: ${widget.ingredient.name}',
        style: theme.textTheme.titleLarge,
        maxLines: 2,
      ),
      // Sửa lỗi overflow bằng cách set width cho content và dùng SingleChildScrollView
      content: SizedBox(
        width: double.maxFinite,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // --- SỐ LƯỢNG & ĐƠN VỊ ---
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomTextField(
                        label: 'Số lượng *',
                        hintText: 'Nhập số lượng',
                        controller: _quantityController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Nhập số lượng';
                          }
                          if (double.tryParse(value) == null ||
                              double.parse(value) <= 0) {
                            return 'Số không hợp lệ';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      flex: 2, // Tăng độ rộng cho đơn vị

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Đơn vị', style: theme.textTheme.bodyLarge),
                          DropdownButtonFormField<String>(
                            initialValue: _selectedUnit,
                            items: widget.ingredient.validUnits
                                .map(
                                  (unit) => DropdownMenuItem(
                                    value: unit,
                                    child: Text(unit),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              if (value != null) {
                                setState(() => _selectedUnit = value);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                // --- NGÀY MUA ---
                _DatePickerField(
                  label: 'Ngày mua',
                  selectedDate: _purchaseDate,
                  onTap: () => _selectDate(
                    context,
                    initialDate: _purchaseDate,
                    onDateSelected: (date) =>
                        setState(() => _purchaseDate = date),
                  ),
                ),
                SizedBox(height: 20.h),

                // --- HẠN SỬ DỤNG ---
                _DatePickerField(
                  label: 'Ngày hết hạn',
                  selectedDate: _expiryDate,
                  onTap: () => _selectDate(
                    context,
                    initialDate: _expiryDate ?? DateTime.now(),
                    onDateSelected: (date) =>
                        setState(() => _expiryDate = date),
                  ),
                  validator: (date) {
                    if (date != null && date.isBefore(_purchaseDate)) {
                      return 'Ngày hết hạn phải sau ngày mua';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Hủy'),
        ),
        CustomElevatedButton(
          onPressed: _submitForm,
          text: _isEditing ? 'Lưu' : 'Thêm',
        ),
      ],
    );
  }
}

// Widget helper cho trường chọn ngày để tránh lặp code
class _DatePickerField extends StatelessWidget {
  final String label;
  final DateTime? selectedDate;
  final VoidCallback onTap;
  final FormFieldValidator<DateTime?>? validator;

  const _DatePickerField({
    required this.label,
    this.selectedDate,
    required this.onTap,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FormField<DateTime?>(
      initialValue: selectedDate,
      validator: validator,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: theme.textTheme.bodyMedium),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: onTap,
              child: InputDecorator(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  errorText: field.errorText,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedDate == null
                          ? 'Chọn ngày'
                          : DateFormat('dd/MM/yyyy').format(selectedDate!),
                    ),
                    const Icon(Icons.calendar_today_outlined),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
