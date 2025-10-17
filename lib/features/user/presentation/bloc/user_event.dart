import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import 'package:cookora/features/user/domain/entities/user_entity.dart';
import 'package:cookora/features/community/domain/entities/post_entity.dart';

part 'user_event.freezed.dart';

@freezed
abstract class UserEvent with _$UserEvent {
  // Bắt đầu lắng nghe profile và posts của người dùng.
  const factory UserEvent.subscribeToProfile(String uid) = SubscribeToProfile;

  // Event nội bộ để cập nhật profile từ stream.
  const factory UserEvent.profileUpdated(UserEntity userProfile) =
      ProfileUpdated;

  // Event nội bộ để cập nhật danh sách bài đăng từ stream.
  const factory UserEvent.postsUpdated(List<PostEntity> posts) = PostsUpdated;

  // Event cập nhật thông tin người dùng.
  const factory UserEvent.updateProfile({
    required String uid,
    required Map<String, dynamic> data,
  }) = UpdateProfile;

  const factory UserEvent.updateAvatar(XFile imageFile) = UpdateAvatar;

  const factory UserEvent.savePost(String postId) = SavePost;

  const factory UserEvent.unsavePost(String postId) = UnsavePost;

  // Event nội bộ để cập nhật danh sách bài đã lưu
  const factory UserEvent.savedPostsUpdated(List<PostEntity> savedPosts) =
      SavedPostsUpdated;

  // Xóa dữ liệu người dùng hiện tại (khi đăng xuất)
  const factory UserEvent.clearProfile() = ClearProfile;
}
