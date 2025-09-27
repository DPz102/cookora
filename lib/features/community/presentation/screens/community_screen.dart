import 'package:cookora/features/community/domain/entities/post_entity.dart';
import 'package:cookora/features/community/presentation/bloc/community_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/snackbar_helper.dart';
import 'package:cookora/core/widgets/async_state_builder.dart';

import 'package:cookora/features/community/presentation/bloc/community_bloc.dart';
import 'package:cookora/features/community/presentation/bloc/community_state.dart';
import 'package:cookora/features/community/presentation/widgets/create_post_overlay.dart';
import 'package:cookora/features/community/presentation/widgets/post_card.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cooktalk cộng đồng')),
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
        child: const _CommunityFeedView(),
      ),
      floatingActionButton: const _CreatePostButton(),
    );
  }
}

class _CommunityFeedView extends StatelessWidget {
  const _CommunityFeedView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityBloc, CommunityState>(
      buildWhen: (p, c) => p.feedStatus != c.feedStatus,
      builder: (context, state) {
        return AsyncStateBuilder<List<PostEntity>>(
          asyncState: state.feedStatus,
          successBuilder: (_, posts) => posts.isEmpty
              ? const Center(
                  child: Text('Chưa có bài đăng nào. Hãy là người đầu tiên!'),
                )
              : MasonryGridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  itemCount: posts.length,
                  itemBuilder: (context, index) => PostCard(post: posts[index]),
                ),
        );
      },
    );
  }
}

class _CreatePostButton extends StatelessWidget {
  const _CreatePostButton();

  @override
  Widget build(BuildContext context) {
    // Lấy instance CommunityBloc từ màn hình cha.
    final communityBloc = context.read<CommunityBloc>();

    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => BlocProvider.value(
            // Cung cấp chính xác instance BLoC đó cho bottom sheet.
            value: communityBloc,
            child: const CreatePostOverlay(),
          ),
        );
      },
      child: const Icon(Icons.add_a_photo),
    );
  }
}
