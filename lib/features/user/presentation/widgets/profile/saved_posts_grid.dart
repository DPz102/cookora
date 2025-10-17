import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:cookora/core/widgets/async_state_builder.dart';
import 'package:cookora/core/widgets/custom_network_image.dart';
import 'package:cookora/features/community/domain/entities/post_entity.dart';
import 'package:cookora/features/user/presentation/bloc/user_bloc.dart';
import 'package:cookora/features/user/presentation/bloc/user_state.dart';

class SavedPostsGrid extends StatelessWidget {
  const SavedPostsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (p, c) => p.savedPostsStatus != c.savedPostsStatus,
      builder: (context, state) {
        return AsyncStateBuilder<List<PostEntity>>(
          asyncState: state.savedPostsStatus,
          successBuilder: (_, posts) {
            if (posts.isEmpty) {
              return const Center(
                child: Text('Chưa có bài đăng nào được lưu.'),
              );
            }
            return GridView.builder(
              key: const PageStorageKey<String>('saved_posts_grid'),
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 130.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 8.h,
              ),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => context.push(
                    '/community/post/${posts[index].id}',
                    extra: posts[index],
                  ),
                  child: CustomNetworkImage(
                    imageUrl: posts[index].imageUrl,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                );
              },
            );
          },
          loadingBuilder: (context) =>
              const Center(child: CircularProgressIndicator()),
          errorBuilder: (context, error) => Center(child: Text('Lỗi: $error')),
        );
      },
    );
  }
}
