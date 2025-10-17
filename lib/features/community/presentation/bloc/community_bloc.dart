import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/exception_handler.dart';

import 'package:cookora/features/user/presentation/bloc/user_bloc.dart';
import 'package:cookora/features/user/domain/entities/user_entity.dart';
import 'package:cookora/features/community/domain/entities/comment_entity.dart';
import 'package:cookora/features/community/domain/entities/post_entity.dart';
import 'package:cookora/features/community/domain/repositories/community_repository.dart';
import 'package:cookora/features/community/presentation/bloc/community_event.dart';
import 'package:cookora/features/community/presentation/bloc/community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  final CommunityRepository _communityRepository;
  final UserBloc _userBloc;

  StreamSubscription<List<PostEntity>>? _feedSubscription;
  StreamSubscription<List<CommentEntity>>? _commentsSubscription;

  CommunityBloc({
    required CommunityRepository communityRepository,
    required UserBloc userBloc,
  }) : _communityRepository = communityRepository,
       _userBloc = userBloc,
       super(const CommunityState()) {
    on<SubscribeToCommunityFeed>(_onSubscribeToCommunityFeed);
    on<SubscribeToComments>(_onSubscribeToComments);

    on<FeedUpdated>(_onFeedUpdated);
    on<CommentsUpdated>(_onCommentsUpdated);

    on<CreatePost>(_onCreatePost);
    on<ResetCreatePostStatus>(_onResetCreatePostStatus);

    on<LikePost>(_onLikePost);
    on<UnlikePost>(_onUnlikePost);

    on<AddComment>(_onAddComment);
    on<UpdateComment>(_onUpdateComment);
    on<DeleteComment>(_onDeleteComment);

    on<ClearComments>(_onClearComments);
    on<ClearFeed>(_onClearFeed);
  }

  String? _getCurrentUid() {
    final userState = _userBloc.state.profileStatus;
    return userState is AsyncSuccess<UserEntity> ? userState.data.uid : null;
  }

  void _onSubscribeToCommunityFeed(
    SubscribeToCommunityFeed event,
    Emitter<CommunityState> emit,
  ) {
    emit(state.copyWith(feedStatus: const AsyncLoading()));
    _feedSubscription?.cancel();

    _feedSubscription = _communityRepository
        .getCommunityFeed(uid: event.uid)
        .listen(
          (posts) => add(FeedUpdated(posts)),
          onError: (e) {
            final eMessage = ExceptionHandler.handle(e).toString();
            emit(state.copyWith(feedStatus: AsyncFailure(eMessage)));
          },
        );
  }

  void _onSubscribeToComments(
    SubscribeToComments event,
    Emitter<CommunityState> emit,
  ) {
    emit(state.copyWith(commentsStatus: const AsyncLoading()));
    _commentsSubscription?.cancel();
    _commentsSubscription = _communityRepository
        .getCommentsStream(postId: event.postId)
        .listen(
          (comments) => add(CommentsUpdated(comments)),
          onError: (e) {
            final eMessage = ExceptionHandler.handle(e).toString();
            emit(state.copyWith(commentsStatus: AsyncFailure(eMessage)));
          },
        );
  }

  void _onFeedUpdated(FeedUpdated event, Emitter<CommunityState> emit) {
    emit(state.copyWith(feedStatus: AsyncSuccess(event.posts)));
  }

  void _onCommentsUpdated(CommentsUpdated event, Emitter<CommunityState> emit) {
    emit(state.copyWith(commentsStatus: AsyncSuccess(event.comments)));
  }

  Future<void> _onCreatePost(
    CreatePost event,
    Emitter<CommunityState> emit,
  ) async {
    emit(state.copyWith(createPostStatus: const AsyncLoading()));

    final uid = _getCurrentUid();

    if (uid == null) {
      final eMessage = 'Lỗi: Không tìm thấy thông tin người dùng.';
      emit(state.copyWith(createPostStatus: AsyncFailure(eMessage)));
      return;
    }

    try {
      await _communityRepository.createPost(
        uid: uid,
        imageFile: event.imageFile,
        caption: event.caption,
      );
      emit(state.copyWith(createPostStatus: const AsyncSuccess(null)));
    } catch (e) {
      final eMessage = ExceptionHandler.handle(e).toString();
      emit(state.copyWith(createPostStatus: AsyncFailure(eMessage)));
    }
  }

  void _onResetCreatePostStatus(
    ResetCreatePostStatus event,
    Emitter<CommunityState> emit,
  ) {
    emit(state.copyWith(createPostStatus: const AsyncInitial()));
  }

  Future<void> _onLikePost(LikePost event, Emitter<CommunityState> emit) async {
    final uid = _getCurrentUid();

    if (uid == null) {
      final eMessage = 'Lỗi: Không tìm thấy thông tin người dùng.';
      emit(state.copyWith(createPostStatus: AsyncFailure(eMessage)));
      return;
    }

    try {
      await _communityRepository.likePost(uid: uid, postId: event.postId);
    } catch (e) {
      throw ExceptionHandler.handle(e);
    }
  }

  Future<void> _onUnlikePost(
    UnlikePost event,
    Emitter<CommunityState> emit,
  ) async {
    final uid = _getCurrentUid();

    if (uid == null) {
      final eMessage = 'Lỗi: Không tìm thấy thông tin người dùng.';
      emit(state.copyWith(createPostStatus: AsyncFailure(eMessage)));
      return;
    }
    try {
      await _communityRepository.unlikePost(uid: uid, postId: event.postId);
    } catch (e) {
      throw ExceptionHandler.handle(e);
    }
  }

  Future<void> _onAddComment(
    AddComment event,
    Emitter<CommunityState> emit,
  ) async {
    final uid = _getCurrentUid();

    if (uid == null) {
      final eMessage = 'Lỗi: Không tìm thấy thông tin người dùng.';
      emit(state.copyWith(createPostStatus: AsyncFailure(eMessage)));
      return;
    }

    try {
      await _communityRepository.addComment(
        uid: uid,
        postId: event.postId,
        content: event.content,
        parentId: event.parentId,
      );
    } catch (e) {
      throw ExceptionHandler.handle(e);
    }
  }

  Future<void> _onUpdateComment(
    UpdateComment event,
    Emitter<CommunityState> emit,
  ) async {
    try {
      await _communityRepository.updateComment(
        postId: event.postId,
        commentId: event.commentId,
        content: event.content,
      );
    } catch (e) {
      throw ExceptionHandler.handle(e);
    }
  }

  Future<void> _onDeleteComment(
    DeleteComment event,
    Emitter<CommunityState> emit,
  ) async {
    try {
      await _communityRepository.deleteComment(
        postId: event.postId,
        commentId: event.commentId,
      );
    } catch (e) {
      throw ExceptionHandler.handle(e);
    }
  }

  void _onClearFeed(ClearFeed event, Emitter<CommunityState> emit) {
    _feedSubscription?.cancel();
    emit(const CommunityState());
  }

  void _onClearComments(ClearComments event, Emitter<CommunityState> emit) {
    _commentsSubscription?.cancel();
    // Chỉ reset commentsStatus, không ảnh hưởng đến các state khác
    emit(state.copyWith(commentsStatus: const AsyncInitial()));
  }

  @override
  Future<void> close() {
    _feedSubscription?.cancel();
    _commentsSubscription?.cancel();
    return super.close();
  }
}
