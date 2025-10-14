import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/snackbar_helper.dart';
import 'package:cookora/core/widgets/async_sliver_builder.dart';
import 'package:cookora/core/widgets/gradient_background.dart';

import 'package:cookora/features/community/domain/entities/post_entity.dart';
import 'package:cookora/features/community/presentation/bloc/community_bloc.dart';
import 'package:cookora/features/community/presentation/bloc/community_event.dart';
import 'package:cookora/features/community/presentation/bloc/community_state.dart';
import 'package:cookora/features/community/presentation/widgets/create_post_overlay.dart';
import 'package:cookora/features/community/presentation/widgets/post_card.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocListener<CommunityBloc, CommunityState>(
        listenWhen: (p, c) => p.createPostStatus != c.createPostStatus,
        listener: (context, state) {
          final status = state.createPostStatus;
          switch (status) {
            case AsyncSuccess():
              context.showSnackBar(
                'Đăng bài thành công!',
                type: SnackBarType.success,
              );
              context.read<CommunityBloc>().add(
                const CommunityEvent.resetCreatePostStatus(),
              );
            case AsyncFailure(error: final error):
              context.showSnackBar(error, type: SnackBarType.error);
              context.read<CommunityBloc>().add(
                const CommunityEvent.resetCreatePostStatus(),
              );
            default:
              break;
          }
        },
        child: const _CommunityView(),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 50.h),
        child: const _CreatePostButton(),
      ),
    );
  }
}

class _CommunityView extends StatelessWidget {
  const _CommunityView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Stack(
      children: [
        SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(
                  'Cooktalk',
                  style: textTheme.headlineSmall?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: false,
                floating: false,
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.notifications_outlined,
                      size: 28.sp,
                      color: colorScheme.onSurface,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.message_outlined,
                      size: 28.sp,
                      color: colorScheme.onSurface,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(width: 8.w),
                ],
              ),
              const _CommunityFeedSliver(),

              SliverPadding(padding: EdgeInsets.only(bottom: 130.h)),
            ],
          ),
        ),
      ],
    );
  }
}

class _CommunityFeedSliver extends StatelessWidget {
  const _CommunityFeedSliver();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityBloc, CommunityState>(
      buildWhen: (p, c) => p.feedStatus != c.feedStatus,
      builder: (context, state) {
        return AsyncSliverBuilder<List<PostEntity>>(
          asyncState: state.feedStatus,
          successBuilder: (_, posts) {
            if (posts.isEmpty) {
              return const SliverFillRemaining(
                child: Center(
                  child: Text('Chưa có bài đăng nào. Hãy là người đầu tiên!'),
                ),
              );
            }
            return SliverList.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostCard(post: posts[index]);
              },
            );
          },
        );
      },
    );
  }
}

class _CreatePostButton extends StatelessWidget {
  const _CreatePostButton();

  @override
  Widget build(BuildContext context) {
    final communityBloc = context.read<CommunityBloc>();

    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => BlocProvider.value(
            value: communityBloc,
            child: const CreatePostOverlay(),
          ),
        );
      },
      // Style lại nút FAB cho giống Pantry
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      shape: const CircleBorder(),
      elevation: 1,
      child: const Icon(Icons.add_a_photo),
    );
  }
}
