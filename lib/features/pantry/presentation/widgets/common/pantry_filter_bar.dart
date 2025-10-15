// lib/features/pantry/presentation/widgets/common/pantry_filter_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PantryFilterBar extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onSelected;

  PantryFilterBar({
    super.key,
    required this.selectedCategory,
    required this.onSelected,
  });

  // Danh sách các category, thêm 'Tất cả' vào đầu
  final List<String> _filters = [
    'Tất cả',
    'Rau củ',
    'Trái cây',
    'Thịt tươi sống',
    'Hải sản tươi sống',
    'Trứng & Sữa',
    'Thực phẩm chế biến',
    'Đồ khô',
    'Gia vị khô',
    'Gia vị tươi',
    'Rau thơm',
    'Nấm',
    'Đậu & chế phẩm',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: _filters.length,
        itemBuilder: (context, index) {
          final category = _filters[index];
          final isSelected = selectedCategory == category;

          return GestureDetector(
            onTap: () => onSelected(category),
            child: Container(
              color: Colors.transparent, // Để GestureDetector nhận sự kiện
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Tên danh mục
                  Text(
                    category,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: isSelected
                          ? Theme.of(context).colorScheme.onSurface
                          : Theme.of(
                              context,
                            ).colorScheme.onSurface.withAlpha(128),
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  // Gạch chân
                  if (isSelected)
                    Container(
                      height: 2.h,
                      width: 30.w, // Độ rộng gạch chân
                      color: Theme.of(context).colorScheme.primary,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
