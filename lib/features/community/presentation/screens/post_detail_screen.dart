import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:collection/collection.dart';

import 'package:cookora/core/utils/async_state.dart';

import 'package:cookora/features/community/domain/entities/post_entity.dart';
import 'package:cookora/features/community/domain/entities/comment_entity.dart';
import 'package:cookora/features/community/presentation/bloc/community_bloc.dart';
import 'package:cookora/features/community/presentation/bloc/community_event.dart';
import 'package:cookora/features/community/presentation/bloc/community_state.dart';
import 'package:cookora/features/community/presentation/widgets/post_card.dart';
import 'package:cookora/features/community/presentation/widgets/comment/comment_list.dart';
import 'package:cookora/features/community/presentation/widgets/comment/comment_input_field.dart';

class PostDetailScreen extends StatefulWidget {
  final PostEntity post;

  const PostDetailScreen({super.key, required this.post});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final _commentController = TextEditingController();
  final _commentFocusNode = FocusNode();

  late final CommunityBloc _communityBloc;
  CommentEntity? _replyingToComment;

  @override
  void initState() {
    super.initState();
    // Lấy BLoC và lưu vào biến _communityBloc
    _communityBloc = context.read<CommunityBloc>();

    // Ngay khi màn hình được tạo, yêu cầu BLoC bắt đầu lắng nghe comment
    if (widget.post.id != null) {
      _communityBloc.add(SubscribeToComments(postId: widget.post.id!));
    }
  }

  @override
  void dispose() {
    _commentController.dispose();
    _commentFocusNode.dispose();
    // Dọn dẹp stream khi rời khỏi màn hình
    _communityBloc.add(const ClearComments());
    super.dispose();
  }

  void _onSendComment() {
    final content = _commentController.text.trim();
    if (content.isNotEmpty && widget.post.id != null) {
      _communityBloc.add(
        AddComment(
          postId: widget.post.id!,
          content: content,
          parentId: _replyingToComment?.id,
        ),
      );
      // Xóa text và unfocus sau khi gửi
      _commentController.clear();
      _commentFocusNode.unfocus();
      setState(() {
        _replyingToComment = null; // Reset trạng thái reply
      });
    }
  }

  void _onReply(CommentEntity comment) {
    setState(() {
      _replyingToComment = comment;
    });
    _commentFocusNode.requestFocus();
  }

  void _onCancelReply() {
    setState(() {
      _replyingToComment = null;
    });
    _commentFocusNode.unfocus();
  }

  void _onEdit(CommentEntity comment) {
    final editController = TextEditingController(text: comment.content);
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Sửa bình luận'),
        content: TextField(
          controller: editController,
          autofocus: true,
          maxLines: null,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Hủy'),
          ),
          FilledButton(
            onPressed: () {
              final newContent = editController.text.trim();
              if (newContent.isNotEmpty &&
                  widget.post.id != null &&
                  comment.id != null) {
                context.read<CommunityBloc>().add(
                  UpdateComment(
                    postId: widget.post.id!,
                    commentId: comment.id!,
                    content: newContent,
                  ),
                );
              }
              Navigator.of(dialogContext).pop();
            },
            child: const Text('Lưu'),
          ),
        ],
      ),
    );
  }

  void _onDelete(CommentEntity comment) {
    // Hiển thị dialog xác nhận
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Xác nhận xóa'),
        content: const Text('Bạn có chắc muốn xóa bình luận này không?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Hủy'),
          ),
          FilledButton(
            onPressed: () {
              if (widget.post.id != null && comment.id != null) {
                context.read<CommunityBloc>().add(
                  DeleteComment(
                    postId: widget.post.id!,
                    commentId: comment.id!,
                  ),
                );
              }
              Navigator.of(dialogContext).pop();
            },
            child: const Text('Xóa'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: Colors.transparent, // Nền gradient sẽ hiển thị qua
      body: Column(
        children: [
          SafeArea(
            bottom: true,
            child: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.pop(),
              ),
              title: Text(
                'Bài viết',
                style: textTheme.headlineSmall?.copyWith(
                  color: colorScheme.primary,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
            ),
          ),
          // Phần nội dung chính (Post và Comment) sẽ có thể cuộn
          Expanded(
            child: CustomScrollView(
              slivers: [
                // Hiển thị lại PostCard ở trên cùng
                SliverToBoxAdapter(
                  child: BlocSelector<CommunityBloc, CommunityState, PostEntity?>(
                    selector: (state) {
                      // Tìm bài post hiện tại trong danh sách feed của BLoC
                      return state.feedStatus.whenOrNull(
                        success: (posts) => posts.firstWhereOrNull(
                          (p) => p.id == widget.post.id,
                        ),
                      );
                    },
                    builder: (context, updatedPost) {
                      // Nếu tìm thấy post mới thì dùng nó, không thì tạm dùng post cũ
                      final postToShow = updatedPost ?? widget.post;
                      // Vô hiệu hóa nút comment bằng isDetailView
                      return PostCard(post: postToShow, isDetailView: true);
                    },
                  ),
                ),
                SliverPadding(padding: EdgeInsets.only(top: 16.h)),

                CommentList(
                  onReply: _onReply,
                  onEdit: _onEdit,
                  onDelete: _onDelete,
                ),
              ],
            ),
          ),

          CommentInputField(
            controller: _commentController,
            focusNode: _commentFocusNode, // Truyền focus node
            onSend: _onSendComment,
            replyingTo: _replyingToComment,
            onCancelReply: _onCancelReply,
          ),
        ],
      ),
    );
  }
}
