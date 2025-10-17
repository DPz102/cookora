import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:cookora/core/utils/async_state.dart';

import 'package:cookora/features/user/domain/entities/user_entity.dart';
import 'package:cookora/features/community/domain/entities/post_entity.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  const factory UserState({
    // Trạng thái của thông tin profile (UserEntity).
    @Default(AsyncInitial()) AsyncState<UserEntity> profileStatus,

    // Trạng thái của danh sách bài đăng.
    @Default(AsyncInitial()) AsyncState<List<PostEntity>> postsStatus,

    @Default(AsyncInitial()) AsyncState<List<PostEntity>> savedPostsStatus,

    // Trạng thái của hành động cập nhật profile.
    @Default(AsyncInitial()) AsyncState<void> updateProfileStatus,

    // Theo dõi quá trình tải avatar.
    @Default(false) bool isUploadingAvatar,
  }) = _UserState;
}
