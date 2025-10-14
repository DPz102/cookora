import 'package:cookora/core/widgets/custom_network_image.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient_entity.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_bloc.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final imageUrl = 'https://picsum.photos/seed/${ingredient.name}/200';

    return GestureDetector(
      onTap: onEdit,
      onLongPress: () => _showDeleteConfirmation(context),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: colorScheme.tertiary),
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.h),
                child: CustomNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  // Bo tròn ảnh để trông mềm mại hơn
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 0, 8.w, 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          ingredient.name,
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.primary,
                            fontFamily: 'Unbounded',
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          '(${ingredient.unit})',
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontSize: 8.sp,
                            fontFamily: 'Unbounded',
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Thêm khoảng cách nhỏ
                  SizedBox(width: 10.w),
                  // Bộ đếm số lượng
                  _QuantityCounter(quantity: ingredient.quantity.toInt()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

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
          FilledButton(
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

class _QuantityCounter extends StatelessWidget {
  final int quantity;
  const _QuantityCounter({required this.quantity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: 53.w,
      height: 18.h,
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: ShapeDecoration(
        color: colorScheme.tertiary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildCounterButton(context, icon: Icons.remove),
          Text(
            quantity.toString(),
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.inverseSurface, // Màu đen
              fontFamily: 'SpaceGrotesk',
              fontWeight: FontWeight.w400,
            ),
          ),
          _buildCounterButton(context, icon: Icons.add),
        ],
      ),
    );
  }

  Widget _buildCounterButton(BuildContext context, {required IconData icon}) {
    return Container(
      width: 12.w,
      height: 12.h,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: CircleBorder(),
      ),
      child: Icon(
        icon,
        size: 10.sp,
        color: Theme.of(context).colorScheme.inverseSurface, // Màu đen
      ),
    );
  }
}
