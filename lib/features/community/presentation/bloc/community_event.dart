import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:cookora/features/community/domain/entities/post_entity.dart';

part 'community_event.freezed.dart';

@freezed
abstract class CommunityEvent with _$CommunityEvent {
  // Bắt đầu lắng nghe feed cộng đồng.
  const factory CommunityEvent.subscribeToCommunityFeed({required String uid}) =
      SubscribeToCommunityFeed;

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

  const factory CommunityEvent.clearFeed() = ClearFeed;
}
