import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cookora/features/suggestion/presentation/widgets/custom_search_bar.dart';
import 'package:cookora/features/suggestion/presentation/widgets/filter_chip_bar.dart';
import 'package:cookora/features/suggestion/presentation/widgets/horizontal_blog_section.dart';
import 'package:cookora/features/suggestion/presentation/widgets/horizontal_recipe_section.dart';
import 'package:cookora/features/suggestion/presentation/widgets/pantry_suggestions_section.dart';
import 'package:cookora/features/suggestion/presentation/widgets/sliver_section_title.dart';
import 'package:cookora/features/suggestion/presentation/widgets/today_suggestion_card.dart';

class SuggestionScreen extends StatelessWidget {
  const SuggestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: _SuggestionView(),
    );
  }
}

// suggestion_screen.dart

class _SuggestionView extends StatelessWidget {
  const _SuggestionView();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Lớp 1: Ảnh nền
        _buildBackgroundImage(),

        // Lớp 2: Toàn bộ nội dung có thể cuộn
        SafeArea(
          child: CustomScrollView(
            slivers: [
              const CustomSearchBar(),

              SliverPadding(padding: EdgeInsets.only(top: 15.h)),

              const FilterChipBar(
                filters: [
                  'Bài đăng gần đây',
                  'Công thức phổ biến',
                  'CookBlog',
                  'Khác',
                ],
              ),

              SliverPadding(padding: EdgeInsets.only(top: 15.h)),

              const SliverToBoxAdapter(child: TodaySuggestionCard()),

              SliverPadding(padding: EdgeInsets.only(top: 15.h)),

              const SliverSectionTitle('Công thức phổ biến'),

              SliverPadding(padding: EdgeInsets.only(top: 10.h)),

              const HorizontalRecipeSection(),

              SliverPadding(padding: EdgeInsets.only(top: 15.h)),

              const SliverSectionTitle('Món ăn từ tủ của bạn'),

              const PantrySuggestionsSection(),

              const SliverSectionTitle('CookBlog'),

              SliverPadding(padding: EdgeInsets.only(top: 10.h)),

              const HorizontalBlogSection(),

              SliverPadding(padding: EdgeInsets.only(bottom: 130.h)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned(
      left: -31.w,
      top: 408.h,
      child: Opacity(
        opacity: 0.55,
        child: Image.asset(
          'assets/images/noodle_box.png',
          width: 642.67.w,
          height: 482.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
