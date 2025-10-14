import 'package:cookora/core/widgets/async_sliver_builder.dart';
import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';
import 'package:cookora/features/suggestion/presentation/bloc/suggestion_bloc.dart';
import 'package:cookora/features/suggestion/presentation/bloc/suggestion_state.dart';
import 'package:cookora/features/suggestion/presentation/widgets/pantry_suggestion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PantrySuggestionsSection extends StatelessWidget {
  const PantrySuggestionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuggestionBloc, SuggestionState>(
      buildWhen: (p, c) => p.suggestionsStatus != c.suggestionsStatus,
      builder: (context, state) {
        return AsyncSliverBuilder<List<RecipeEntity>>(
          asyncState: state.suggestionsStatus,
          loadingBuilder: (context) => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
          errorBuilder: (context, error) =>
              SliverToBoxAdapter(child: Center(child: Text('Lỗi: $error'))),
          successBuilder: (_, recipes) => recipes.isEmpty
              ? _buildEmptyState(
                  'Không tìm thấy món nào phù hợp.\nHãy thử thêm nguyên liệu vào Tủ bếp nhé!',
                )
              : _buildRecipeGrid(recipes),
        );
      },
    );
  }

  // Chuyển các phương thức helper vào đây
  Widget _buildRecipeGrid(List<RecipeEntity> recipes) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 0.7,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          return PantrySuggestionCard(recipe: recipes[index]);
        }, childCount: recipes.length),
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15.sp, color: Colors.grey[600]),
        ),
      ),
    );
  }
}
