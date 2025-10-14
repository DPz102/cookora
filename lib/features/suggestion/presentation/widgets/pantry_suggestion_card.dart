import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PantrySuggestionCard extends StatelessWidget {
  final RecipeEntity recipe;
  const PantrySuggestionCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          // Sử dụng ảnh từ entity hoặc ảnh placeholder nếu có
          image: NetworkImage(
            'https://picsum.photos/200/300?random=${recipe.id}',
          ),
          fit: BoxFit.cover,
        ),
      ),
      // Lớp phủ gradient để văn bản dễ đọc hơn
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recipe.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Unbounded',
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Nấu ngay',
                style: TextStyle(
                  color: const Color(0xFFDAFF01),
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Unbounded',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
