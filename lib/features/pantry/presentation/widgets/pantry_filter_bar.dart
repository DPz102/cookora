import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PantryFilterBar extends StatefulWidget {
  const PantryFilterBar({super.key});

  @override
  State<PantryFilterBar> createState() => _PantryFilterBarState();
}

class _PantryFilterBarState extends State<PantryFilterBar> {
  int _selectedIndex = 0;
  final List<String> _filters = const [
    'Rau củ',
    'Trái cây',
    'Đồ tươi sống',
    'Chế biến sẵn',
    'Đồ khô',
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 40.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          itemCount: _filters.length,
          itemBuilder: (context, index) {
            final isSelected = _selectedIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
                // TODO: Gọi BLoC event
              },
              child: Container(
                color: Colors.transparent, // Để GestureDetector nhận sự kiện
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Tên danh mục
                    Text(
                      _filters[index],
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
      ),
    );
  }
}
