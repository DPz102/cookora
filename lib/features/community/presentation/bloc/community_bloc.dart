import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/exception_handler.dart';

import 'package:cookora/features/user/presentation/bloc/user_bloc.dart';
import 'package:cookora/features/user/domain/entities/user_entity.dart';
import 'package:cookora/features/community/domain/entities/post_entity.dart';
import 'package:cookora/features/community/domain/repositories/community_repository.dart';
import 'package:cookora/features/community/presentation/bloc/community_event.dart';
import 'package:cookora/features/community/presentation/bloc/community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  final CommunityRepository _communityRepository;
  final UserBloc _userBloc;
  StreamSubscription<List<PostEntity>>? _feedSubscription;

  CommunityBloc({
    required CommunityRepository communityRepository,
    required UserBloc userBloc,
  }) : _communityRepository = communityRepository,
       _userBloc = userBloc,
       super(const CommunityState()) {
    on<SubscribeToCommunityFeed>(_onSubscribeToCommunityFeed);
    on<FeedUpdated>(_onFeedUpdated);
    on<CreatePost>(_onCreatePost);
    on<ResetCreatePostStatus>(_onResetCreatePostStatus);
    on<LikePost>(_onLikePost);
    on<UnlikePost>(_onUnlikePost);
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

  void _onFeedUpdated(FeedUpdated event, Emitter<CommunityState> emit) {
    emit(state.copyWith(feedStatus: AsyncSuccess(event.posts)));
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

  void _onClearFeed(ClearFeed event, Emitter<CommunityState> emit) {
    _feedSubscription?.cancel();
    emit(const CommunityState());
  }

  @override
  Future<void> close() {
    _feedSubscription?.cancel();
    return super.close();
  }
}
