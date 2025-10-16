// lib/features/pantry/presentation/widgets/grid/pantry_entry_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cookora/core/widgets/custom_network_image.dart';

import 'package:cookora/features/pantry/domain/entities/pantry_entry.dart';

class PantryEntryCard extends StatelessWidget {
  // Card này nhận vào PantryEntry đã chứa sẵn thông tin ingredient
  final PantryEntry entry;
  final VoidCallback onTap;

  const PantryEntryCard({super.key, required this.entry, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    // Sử dụng ảnh thật nếu có, fallback về ảnh placeholder
    final imageUrl = entry.ingredient.imageUrl.isNotEmpty
        ? entry.ingredient.imageUrl
        : 'https://picsum.photos/seed/${entry.ingredient.name}/200';

    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: colorScheme.tertiary),
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- PHẦN ẢNH ---
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CustomNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
                      // Lớp phủ cảnh báo HSD
                      _buildExpiryStatusOverlay(colorScheme),
                    ],
                  ),
                ),
              ),
            ),

            // --- PHẦN THÔNG TIN ---
            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 0, 8.w, 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Tên nguyên liệu
                  Text(
                    entry.ingredient.name, // Tên ingredient đã được nhúng
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.primary,
                      fontFamily: 'Unbounded',
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  // Tổng số lượng
                  _QuantityDisplay(
                    quantity: entry.totalQuantity,
                    unit: entry.unit,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget con hiển thị lớp phủ cảnh báo HSD
  Widget _buildExpiryStatusOverlay(ColorScheme colorScheme) {
    final now = DateTime.now();
    final expiryDate = entry.earliestExpiryDate;
    if (expiryDate == null) return const SizedBox.shrink();

    final difference = expiryDate.difference(now).inDays;

    Color overlayColor;
    IconData? icon;

    if (difference < 0) {
      overlayColor = colorScheme.error;
      icon = Icons.error_outline_rounded;
    } else if (difference <= 3) {
      overlayColor = Colors.orangeAccent; // Hoặc một màu warning
      icon = Icons.warning_amber_rounded;
    } else {
      return const SizedBox.shrink(); // Không hiển thị nếu HSD còn xa
    }

    return Container(
      decoration: BoxDecoration(
        // Dùng withAlpha thay cho withOpacity
        color: overlayColor.withAlpha((255 * 0.4).round()),
      ),
      child: Center(
        child: Icon(icon, color: Colors.white, size: 40.sp),
      ),
    );
  }
}

// Widget con để hiển thị số lượng
class _QuantityDisplay extends StatelessWidget {
  final double quantity;
  final String unit;
  const _QuantityDisplay({required this.quantity, required this.unit});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: 18.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: ShapeDecoration(
        color: colorScheme.tertiary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min, // Co lại theo nội dung
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            // Format số để trông đẹp hơn (bỏ .0 nếu là số nguyên)
            quantity.toStringAsFixed(
              quantity.truncateToDouble() == quantity ? 0 : 1,
            ),
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.inverseSurface,
              fontFamily: 'SpaceGrotesk',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(width: 4.w),
          Text(
            unit,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.inverseSurface,
              fontFamily: 'SpaceGrotesk',
              fontWeight: FontWeight.w400,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}
