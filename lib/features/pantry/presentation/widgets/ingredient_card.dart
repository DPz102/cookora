import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cookora/features/pantry/domain/entities/ingredient_entity.dart';

import 'package:cookora/features/pantry/presentation/bloc/pantry_event.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_bloc.dart';

class IngredientCard extends StatelessWidget {
  final IngredientEntity ingredient;
  final VoidCallback onEdit;

  const IngredientCard({
    super.key,
    required this.ingredient,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onEdit,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nút xóa ở góc trên bên phải
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(
                    Icons.close,
                    size: 18.sp,
                    color: colorScheme.inverseSurface,
                  ),
                  onPressed: () => _showDeleteConfirmation(context),
                ),
              ),

              // Tên nguyên liệu
              Text(
                ingredient.name,
                style: textTheme.titleMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              // Số lượng và đơn vị
              Text(
                '${ingredient.quantity} ${ingredient.unit}',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.inverseSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Hiển thị dialog xác nhận trước khi xóa
  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Xác nhận xóa'),
        content: Text('Bạn có chắc chắn muốn xóa "${ingredient.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              context.read<PantryBloc>().add(DeleteIngredient(ingredient.id));

              Navigator.of(dialogContext).pop();
            },
            child: const Text('Xóa'),
          ),
        ],
      ),
    );
  }
}
