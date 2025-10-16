// lib/features/pantry/presentation/screens/add_ingredient_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cookora/features/pantry/presentation/bloc/pantry_bloc.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_event.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient.dart';
import 'package:cookora/features/pantry/presentation/widgets/ingredient/lot_form_dialog.dart';
import 'package:cookora/features/pantry/presentation/widgets/ingredient/ingredient_search_widget.dart';

class AddIngredientScreen extends StatefulWidget {
  const AddIngredientScreen({super.key});

  @override
  State<AddIngredientScreen> createState() => _AddIngredientScreenState();
}

class _AddIngredientScreenState extends State<AddIngredientScreen> {
  // >> THÊM: GlobalKey để có thể gọi method của widget con <<
  final _searchWidgetKey = GlobalKey<IngredientSearchWidgetState>();

  void _onIngredientSelected(
    BuildContext context,
    Ingredient ingredient,
  ) async {
    final newLotData = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (_) => LotFormDialog(ingredient: ingredient),
    );

    if (newLotData != null && context.mounted) {
      context.read<PantryBloc>().add(
        AddLot(ingredient: ingredient, lotData: newLotData),
      );
      // >> THÊM: Gọi method để xóa text trong search widget <<
      _searchWidgetKey.currentState?.clearSearch();
    }
  }

  @override
  Widget build(BuildContext context) {
    // >> THAY ĐỔI: Thay Scaffold bằng một layout phù hợp với BottomSheet <<
    return Container(
      height: 0.9.sh, // Chiều cao 90% màn hình
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        children: [
          // Thêm một handle để người dùng biết có thể kéo xuống
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0.h),
            child: Container(
              width: 40.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.outline,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          Text(
            'Thêm nguyên liệu',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          // Widget tìm kiếm chiếm phần còn lại
          Expanded(
            child: IngredientSearchWidget(
              key: _searchWidgetKey, // Gán key
              onIngredientSelected: (ingredient) =>
                  _onIngredientSelected(context, ingredient),
            ),
          ),
        ],
      ),
    );
  }
}
