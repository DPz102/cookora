import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cookora/core/utils/async_state.dart';

import 'package:cookora/features/community/domain/entities/post_entity.dart';
import 'package:cookora/features/community/domain/entities/comment_entity.dart';

part 'community_state.freezed.dart';

@freezed
abstract class CommunityState with _$CommunityState {
  const factory CommunityState({
    // Trạng thái của danh sách bài đăng.
    @Default(AsyncInitial()) AsyncState<List<PostEntity>> feedStatus,

    // Trạng thái của hành động tạo bài đăng.
    @Default(AsyncInitial()) AsyncState<void> createPostStatus,

    /// Quản lý trạng thái tải danh sách comment của một bài viết.
    @Default(AsyncInitial()) AsyncState<List<CommentEntity>> commentsStatus,
  }) = _CommunityState;
}
