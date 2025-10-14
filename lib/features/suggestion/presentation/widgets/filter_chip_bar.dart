import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Một thanh chứa các chip lọc có thể cuộn ngang.
/// Widget này hiển thị một danh sách các lựa chọn (filters) dưới dạng
/// ChoiceChip, cho phép người dùng chọn một mục tại một thời điểm.
class FilterChipBar extends StatefulWidget {
  const FilterChipBar({super.key, required this.filters, this.onSelected});

  /// Danh sách các chuỗi văn bản để hiển thị trên mỗi chip.
  final List<String> filters;

  /// Callback được gọi khi một chip được chọn, trả về index của chip đó.
  final ValueChanged<int>? onSelected;

  @override
  State<FilterChipBar> createState() => _FilterChipBarState();
}

class _FilterChipBarState extends State<FilterChipBar> {
  // Theo dõi index của chip đang được chọn. Mặc định là chip đầu tiên.
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    // Sử dụng SliverToBoxAdapter để có thể đặt widget này trong CustomScrollView.
    return SliverToBoxAdapter(
      child: SizedBox(
        // Chiều cao cố định cho thanh chip.
        height: 30.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: widget.filters.length,
          // Padding hai bên cho toàn bộ list.
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          // Xây dựng từng chip trong danh sách.
          itemBuilder: (context, index) {
            final isSelected = _selectedIndex == index;

            return ChoiceChip(
              label: Text(widget.filters[index]),
              selected: isSelected,
              // Cập nhật trạng thái khi người dùng chọn chip khác.
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    _selectedIndex = index;
                  });
                  // Gọi callback nếu có.
                  widget.onSelected?.call(index);
                }
              },
              labelStyle: textTheme.bodySmall!.copyWith(
                color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
              ),
            );
          },
          // Widget phân tách giữa các chip.
          separatorBuilder: (context, index) => SizedBox(width: 12.w),
        ),
      ),
    );
  }
}
