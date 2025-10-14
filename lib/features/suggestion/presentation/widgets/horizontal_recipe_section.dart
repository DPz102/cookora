import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HorizontalRecipeSection extends StatefulWidget {
  const HorizontalRecipeSection({super.key});

  @override
  State<HorizontalRecipeSection> createState() =>
      _HorizontalRecipeSectionState();
}

class _HorizontalRecipeSectionState extends State<HorizontalRecipeSection> {
  final _pageController = PageController(viewportFraction: 0.9);

  final List<Map<String, dynamic>> _recipes = [
    {
      'imageUrl': 'https://picsum.photos/400/600?random=3',
      'title': 'Gà nướng mật ong tỏi',
      'duration': '50 min',
      'difficulty': 'Medium',
      'author': 'Cooky Master',
      'likes': 876,
    },
    {
      'imageUrl': 'https://picsum.photos/400/600?random=4',
      'title': 'Salad cá hồi áp chảo',
      'duration': '15 min',
      'difficulty': 'Easy',
      'author': 'Healthy Life',
      'likes': 2300,
    },
    {
      'imageUrl': 'https://picsum.photos/400/600?random=5',
      'title': 'Bún bò Huế đậm đà',
      'duration': '2 hours',
      'difficulty': 'Hard',
      'author': 'Bếp Việt',
      'likes': 5400,
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageViewHeight =
        _RecipeCard.imageHeight + (_RecipeCard.infoHeight / 2);

    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: pageViewHeight.h,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _recipes.length,
              clipBehavior: Clip.none,
              itemBuilder: (context, index) {
                final recipe = _recipes[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: _RecipeCard(
                    imageUrl: recipe['imageUrl'],
                    title: recipe['title'],
                    duration: recipe['duration'],
                    difficulty: recipe['difficulty'],
                    author: recipe['author'],
                    likes: recipe['likes'],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 15.h),
          SmoothPageIndicator(
            controller: _pageController,
            count: _recipes.length,
            effect: WormEffect(
              dotHeight: 8.h,
              dotWidth: 8.w,
              activeDotColor: Theme.of(context).colorScheme.primary,
              dotColor: Theme.of(context).colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }
}

class _RecipeCard extends StatelessWidget {
  static const double imageHeight = 157.0;
  static const double infoHeight = 48.0;

  final String imageUrl;
  final String title;
  final String duration;
  final String difficulty;
  final String author;
  final int likes;

  const _RecipeCard({
    required this.imageUrl,
    required this.title,
    required this.duration,
    required this.difficulty,
    required this.author,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final cardHeight = imageHeight + (infoHeight / 2);

    return SizedBox(
      height: cardHeight.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _buildImageSection(colorScheme, textTheme),
          _buildInfoSection(colorScheme, textTheme),
        ],
      ),
    );
  }

  // Phần 1: Ảnh với tim
  Widget _buildImageSection(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      height: imageHeight.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19.r),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(19.r),
        child: Stack(
          children: [
            Positioned(
              top: 10.h,
              left: 16.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(19.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.favorite, color: colorScheme.error, size: 15.sp),
                    SizedBox(width: 4.w),
                    Text(
                      likes > 999
                          ? '${(likes / 1000).toStringAsFixed(1)}k'
                          : likes.toString(),
                      style: textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Phần 2: Thông tin món ăn
  Widget _buildInfoSection(ColorScheme colorScheme, TextTheme textTheme) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: infoHeight.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow,
              blurRadius: 12.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.h),
                  _buildMetaInfo(colorScheme, textTheme),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget hiển thị thông tin phụ (thời gian và độ khó)
  Widget _buildMetaInfo(ColorScheme colorScheme, TextTheme textTheme) {
    return Row(
      children: [
        Icon(
          Icons.timer_outlined,
          color: colorScheme.inversePrimary,
          size: 10.sp,
        ),
        SizedBox(width: 2.w),
        Text(
          duration,
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.inversePrimary,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Icon(Icons.circle, size: 3.sp, color: colorScheme.outline),
        ),
        Icon(
          Icons.leaderboard_outlined,
          color: colorScheme.inversePrimary,
          size: 10.sp,
        ),
        SizedBox(width: 2.w),
        Text(
          difficulty,
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.inversePrimary,
            fontSize: 10.sp,
          ),
        ),
        SizedBox(width: 2.w),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Icon(Icons.circle, size: 3.sp, color: colorScheme.outline),
        ),
        Text(
          'by $author',
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.inversePrimary,
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }
}
