import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cookora/core/widgets/async_sliver_builder.dart';
import 'package:cookora/core/utils/async_state.dart';

import 'package:cookora/features/community/domain/entities/comment_entity.dart';
import 'package:cookora/features/community/presentation/bloc/community_bloc.dart';
import 'package:cookora/features/community/presentation/bloc/community_state.dart';
import 'package:cookora/features/community/presentation/widgets/comment/comment_tile.dart';
import 'package:cookora/features/user/presentation/bloc/user_bloc.dart';

class CommentList extends StatelessWidget {
  final Function(CommentEntity) onReply;
  final Function(CommentEntity) onEdit;
  final Function(CommentEntity) onDelete;

  const CommentList({
    super.key,
    required this.onReply,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    // ✅ Lấy UID của user hiện tại
    final currentUserId = context
        .watch<UserBloc>()
        .state
        .profileStatus
        .whenOrNull(success: (user) => user.uid);

    // Lắng nghe trạng thái commentsStatus từ CommunityBloc
    return BlocBuilder<CommunityBloc, CommunityState>(
      buildWhen: (p, c) => p.commentsStatus != c.commentsStatus,
      builder: (context, state) {
        return AsyncSliverBuilder<List<CommentEntity>>(
          asyncState: state.commentsStatus,
          // Giao diện khi thành công
          successBuilder: (context, comments) {
            if (comments.isEmpty) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Chưa có bình luận nào. Hãy là người đầu tiên!',
                    ),
                  ),
                ),
              );
            }
            // Dùng SliverList để hiển thị danh sách trong CustomScrollView
            return SliverList.separated(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CommentTile(
                    comment: comment,
                    onReply: () => onReply(comment),
                    // ✅ CHỈ CHO PHÉP SỬA NẾU LÀ CHỦ SỞ HỮU
                    onEdit: currentUserId == comment.authorId
                        ? () => onEdit(comment)
                        : null,
                    // ✅ CHỈ CHO PHÉP XÓA NẾU LÀ CHỦ SỞ HỮU
                    onDelete: currentUserId == comment.authorId
                        ? () => onDelete(comment)
                        : null,
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 8.h),
            );
          },
          // Giao diện khi đang tải
          loadingBuilder: (context) => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
          // Giao diện khi có lỗi
          errorBuilder: (context, error) => SliverToBoxAdapter(
            child: Center(child: Text('Lỗi khi tải bình luận:\n$error')),
          ),
        );
      },
    );
  }
}
