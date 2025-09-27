import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/features/community/domain/entities/post_entity.dart';

part 'community_state.freezed.dart';

@freezed
abstract class CommunityState with _$CommunityState {
  const factory CommunityState({
    // Trạng thái của danh sách bài đăng.
    @Default(AsyncInitial()) AsyncState<List<PostEntity>> feedStatus,

    // Trạng thái của hành động tạo bài đăng.
    @Default(AsyncInitial()) AsyncState<void> createPostStatus,
  }) = _CommunityState;
}
