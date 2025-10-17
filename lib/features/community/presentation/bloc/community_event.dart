import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:cookora/features/community/domain/entities/post_entity.dart';
import 'package:cookora/features/community/domain/entities/comment_entity.dart';

part 'community_event.freezed.dart';

@freezed
abstract class CommunityEvent with _$CommunityEvent {
  // Bắt đầu lắng nghe feed cộng đồng.
  const factory CommunityEvent.subscribeToCommunityFeed({required String uid}) =
      SubscribeToCommunityFeed;

  /// Bắt đầu lắng nghe stream comment của một bài post.
  const factory CommunityEvent.subscribeToComments({required String postId}) =
      SubscribeToComments;

  // Tạo một bài đăng mới.
  const factory CommunityEvent.createPost({
    required File imageFile,
    required String caption,
  }) = CreatePost;

  // Reset trạng thái tạo bài đăng
  const factory CommunityEvent.resetCreatePostStatus() = ResetCreatePostStatus;

  // Thích một bài đăng
  const factory CommunityEvent.likePost(String postId) = LikePost;

  // Bỏ thích một bài đăng
  const factory CommunityEvent.unlikePost(String postId) = UnlikePost;

  // Event nội bộ để cập nhật danh sách bài đăng từ stream.
  const factory CommunityEvent.feedUpdated(List<PostEntity> posts) =
      FeedUpdated;

  /// Event nội bộ để cập nhật danh sách comment từ stream.
  const factory CommunityEvent.commentsUpdated(List<CommentEntity> comments) =
      CommentsUpdated;

  /// Thêm một comment mới.
  const factory CommunityEvent.addComment({
    required String postId,
    required String content,
    String? parentId,
  }) = AddComment;

  /// Cập nhật một comment.
  const factory CommunityEvent.updateComment({
    required String postId,
    required String commentId,
    required String content,
  }) = UpdateComment;

  /// Xóa một comment.
  const factory CommunityEvent.deleteComment({
    required String postId,
    required String commentId,
  }) = DeleteComment;

  /// Dọn dẹp stream comment khi rời màn hình chi tiết.
  const factory CommunityEvent.clearComments() = ClearComments;

  const factory CommunityEvent.clearFeed() = ClearFeed;
}
