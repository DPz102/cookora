import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/exception_handler.dart';

import 'package:cookora/features/community/domain/entities/post_entity.dart';
import 'package:cookora/features/community/domain/repositories/community_repository.dart';
import 'package:cookora/features/community/presentation/bloc/community_event.dart';
import 'package:cookora/features/community/presentation/bloc/community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  final CommunityRepository _communityRepository;
  StreamSubscription<List<PostEntity>>? _feedSubscription;

  CommunityBloc(this._communityRepository) : super(const CommunityState()) {
    on<SubscribeToCommunityFeed>(_onSubscribeToCommunityFeed);
    on<FeedUpdated>(_onFeedUpdated);
    on<CreatePost>(_onCreatePost);
    on<ResetCreatePostStatus>(_onResetCreatePostStatus);
    on<LikePost>(_onLikePost);
    on<UnlikePost>(_onUnlikePost);
  }

  void _onSubscribeToCommunityFeed(
    SubscribeToCommunityFeed event,
    Emitter<CommunityState> emit,
  ) {
    emit(state.copyWith(feedStatus: const AsyncLoading()));
    _feedSubscription?.cancel();

    _feedSubscription = _communityRepository.getCommunityFeed().listen(
      (posts) => add(FeedUpdated(posts)),
      onError: (e) => emit(
        state.copyWith(
          feedStatus: AsyncFailure(ExceptionHandler.handle(e).toString()),
        ),
      ),
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

    try {
      await _communityRepository.createPost(
        imageFile: event.imageFile,
        caption: event.caption,
      );
      emit(state.copyWith(createPostStatus: const AsyncSuccess(null)));
    } catch (e) {
      emit(
        state.copyWith(
          createPostStatus: AsyncFailure(ExceptionHandler.handle(e).toString()),
        ),
      );
    }
  }

  void _onResetCreatePostStatus(
    ResetCreatePostStatus event,
    Emitter<CommunityState> emit,
  ) {
    emit(state.copyWith(createPostStatus: const AsyncInitial()));
  }

  Future<void> _onLikePost(LikePost event, Emitter<CommunityState> emit) async {
    try {
      await _communityRepository.likePost(event.postId);
    } catch (e) {
      throw ExceptionHandler.handle(e);
    }
  }

  Future<void> _onUnlikePost(
    UnlikePost event,
    Emitter<CommunityState> emit,
  ) async {
    try {
      await _communityRepository.unlikePost(event.postId);
    } catch (e) {
      throw ExceptionHandler.handle(e);
    }
  }

  @override
  Future<void> close() {
    _feedSubscription?.cancel();
    return super.close();
  }
}
