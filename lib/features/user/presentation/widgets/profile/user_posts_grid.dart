import 'package:cookora/core/widgets/async_state_builder.dart';
import 'package:cookora/core/widgets/custom_network_image.dart';
import 'package:cookora/features/community/domain/entities/post_entity.dart';
import 'package:cookora/features/user/presentation/bloc/user_bloc.dart';
import 'package:cookora/features/user/presentation/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class UserPostsGrid extends StatelessWidget {
  const UserPostsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (p, c) => p.postsStatus != c.postsStatus,
      builder: (context, state) {
        return AsyncStateBuilder<List<PostEntity>>(
          asyncState: state.postsStatus,
          successBuilder: (_, posts) {
            if (posts.isEmpty) {
              return const Center(child: Text('Bạn chưa có bài đăng nào.'));
            }
            return GridView.builder(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 20.h),
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
        );
      },
    );
  }
}
