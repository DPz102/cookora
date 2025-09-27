import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/widgets/async_sliver_builder.dart';

import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';
import 'package:cookora/features/kitchen_log/presentation/bloc/kitchen_log_bloc.dart';
import 'package:cookora/features/kitchen_log/presentation/bloc/kitchen_log_state.dart';
import 'package:cookora/features/suggestion/presentation/bloc/suggestion_bloc.dart';
import 'package:cookora/features/suggestion/presentation/bloc/suggestion_state.dart';
import 'package:cookora/features/suggestion/presentation/widgets/recipe_card.dart';

class SuggestionScreen extends StatelessWidget {
  const SuggestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Món ngon cho hôm nay')),
      body: const _SuggestionView(),
    );
  }
}

class _SuggestionView extends StatelessWidget {
  const _SuggestionView();

  @override
  Widget build(BuildContext context) {
    // Dùng CustomScrollView để dễ dàng kết hợp nhiều loại list/widget
    return CustomScrollView(
      slivers: [
        // --- SECTION 1: GỢI Ý TỪ TỦ BẾP ---
        _buildSectionTitle(context, 'Gợi ý từ Tủ bếp của bạn'),
        _buildPantrySuggestions(),

        // --- SECTION 2: TỪ NHẬT KÝ BẾP ---
        _buildSectionTitle(context, 'Món ăn đã lưu'),
        _buildKitchenLog(),
      ],
    );
  }

  // Widget helper để tạo tiêu đề cho mỗi khu vực
  Widget _buildSectionTitle(BuildContext context, String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 16.h),
        child: Text(title, style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }

  // Widget helper để xây dựng khu vực "Gợi ý từ Tủ bếp"
  Widget _buildPantrySuggestions() {
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
              : _buildRecipeList(recipes),
        );
      },
    );
  }

  // Widget helper để xây dựng khu vực "Nhật ký Bếp"
  Widget _buildKitchenLog() {
    return BlocBuilder<KitchenLogBloc, KitchenLogState>(
      builder: (context, state) {
        return switch (state.logStatus) {
          AsyncLoading() || AsyncInitial() => const SliverToBoxAdapter(
            child: SizedBox.shrink(), // Không cần show loading cho list thứ 2
          ),
          AsyncFailure(error: final error) => SliverToBoxAdapter(
            child: Center(child: Text('Lỗi: $error')),
          ),
          AsyncSuccess(data: final recipes) =>
            recipes.isEmpty
                ? _buildEmptyState(
                    'Các món ăn bạn quét và lưu sẽ xuất hiện ở đây.',
                  )
                : _buildRecipeList(recipes),
          _ => const SliverToBoxAdapter(child: SizedBox.shrink()),
        };
      },
    );
  }

  // Widget helper để hiển thị danh sách công thức
  Widget _buildRecipeList(List<RecipeEntity> recipes) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: RecipeCard(recipe: recipes[index]),
        );
      }, childCount: recipes.length),
    );
  }

  // Widget helper cho các trạng thái rỗng
  Widget _buildEmptyState(String message) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15.sp, color: Colors.grey[600]),
        ),
      ),
    );
  }
}
