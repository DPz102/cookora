import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';

class RecipeCard extends StatelessWidget {
  final RecipeEntity recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*
          // Hình ảnh món ăn
          Image.network(
            recipe.imageUrl,
            height: 160.h,
            width: double.infinity,
            fit: BoxFit.cover,
            // Hiển thị loading indicator khi ảnh đang tải
            loadingBuilder: (context, child, progress) {
              return progress == null
                  ? child
                  : SizedBox(
                      height: 160.h,
                      child: const Center(child: CircularProgressIndicator()),
                    );
            },
            // Hiển thị icon lỗi nếu không tải được ảnh
            errorBuilder: (context, error, stackStrace) {
              return SizedBox(
                height: 160.h,
                child: Icon(
                  Icons.broken_image_outlined,
                  size: 48.w,
                  color: colorScheme.outline,
                ),
              );
            },
          ),
*/
          // Phần nội dung text
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(recipe.name, style: textTheme.headlineSmall),
                SizedBox(height: 6.h),
                Text(
                  recipe.description,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10.h),
                // Hiển thị một vài nguyên liệu cần có
                Wrap(
                  spacing: 6.w,
                  runSpacing: 6.h,
                  children: recipe.requiredIngredients
                      .take(3)
                      .map(
                        (ingredient) => Chip(
                          label: Text(ingredient),
                          backgroundColor: colorScheme.secondaryContainer,
                          side: BorderSide.none,
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
