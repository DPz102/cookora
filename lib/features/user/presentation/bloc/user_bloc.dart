import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/exception_handler.dart';

import 'package:cookora/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cookora/features/auth/presentation/bloc/auth_state.dart';
import 'package:cookora/features/community/domain/entities/post_entity.dart';
import 'package:cookora/features/community/domain/repositories/community_repository.dart';
import 'package:cookora/features/user/domain/entities/user_entity.dart';
import 'package:cookora/features/user/domain/repositories/user_repository.dart';
import 'package:cookora/features/user/presentation/bloc/user_event.dart';
import 'package:cookora/features/user/presentation/bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  final CommunityRepository _communityRepository;
  final AuthBloc _authBloc;

  StreamSubscription<AuthState>? _authSubscription;
  StreamSubscription<UserEntity>? _profileSubscription;
  StreamSubscription<List<PostEntity>>? _postsSubscription;
  StreamSubscription<List<PostEntity>>? _savedPostsSubscription;

  UserBloc({
    required UserRepository userRepository,
    required CommunityRepository communityRepository,
    required AuthBloc authBloc,
  }) : _userRepository = userRepository,
       _communityRepository = communityRepository,
       _authBloc = authBloc,
       super(const UserState()) {
    on<SubscribeToProfile>(_onSubscribeToProfile);
    on<ProfileUpdated>(_onProfileUpdated);
    on<PostsUpdated>(_onPostsUpdated);
    on<UpdateProfile>(_onUpdateProfile);
    on<ClearProfile>(_onClearProfile);
    on<UpdateAvatar>(_onUpdateAvatar);
    on<SavePost>(_onSavePost);
    on<UnsavePost>(_onUnsavePost);
    on<SavedPostsUpdated>(_onSavedPostsUpdated);

    // Ngay khi UserBloc được tạo, nó sẽ bắt đầu lắng nghe AuthBloc
    _authSubscription = _authBloc.stream.listen((authState) {
      authState.whenOrNull(
        authenticated: (user, _, _) {
          // Khi AuthBloc báo đã đăng nhập, UserBloc tự động kích hoạt
          add(SubscribeToProfile(user.uid));
        },
        unauthenticated: (_, _) {
          // Khi AuthBloc báo đã đăng xuất, UserBloc tự động dọn dẹp
          add(const ClearProfile());
        },
      );
    });
  }

  String? _getCurrentUid() {
    final authState = _authBloc.state;
    if (authState is Authenticated) {
      return authState.user.uid;
    }
    return null;
  }

  void _onSubscribeToProfile(
    SubscribeToProfile event,
    Emitter<UserState> emit,
  ) {
    emit(
      state.copyWith(
        profileStatus: const AsyncLoading(),
        postsStatus: const AsyncLoading(),
        savedPostsStatus: const AsyncLoading(),
      ),
    );

    _profileSubscription?.cancel();
    _postsSubscription?.cancel();

    _profileSubscription = _userRepository
        .getUserProfileStream(event.uid)
        .listen(
          (userProfile) => add(ProfileUpdated(userProfile)),
          onError: (e) {
            final eMessage = ExceptionHandler.handle(e).toString();
            emit(state.copyWith(profileStatus: AsyncFailure(eMessage)));
          },
        );

    _postsSubscription = _communityRepository
        .getPostsByUser(uid: event.uid)
        .listen(
          (posts) => add(PostsUpdated(posts)),
          onError: (e) {
            final eMessage = ExceptionHandler.handle(e).toString();
            emit(state.copyWith(postsStatus: AsyncFailure(eMessage)));
          },
        );
  }

  void _onProfileUpdated(ProfileUpdated event, Emitter<UserState> emit) {
    emit(state.copyWith(profileStatus: AsyncSuccess(event.userProfile)));

    // Lắng nghe sự thay đổi của user profile để fetch lại danh sách bài đã lưu
    final savedPostIds = event.userProfile.savedPosts;
    _savedPostsSubscription?.cancel();
    _savedPostsSubscription = _communityRepository
        .getPostsByIds(savedPostIds)
        .listen(
          (posts) => add(SavedPostsUpdated(posts)),
          onError: (e) {
            final eMessage = ExceptionHandler.handle(e).toString();
            emit(state.copyWith(savedPostsStatus: AsyncFailure(eMessage)));
          },
        );
  }

  void _onPostsUpdated(PostsUpdated event, Emitter<UserState> emit) {
    emit(state.copyWith(postsStatus: AsyncSuccess(event.posts)));
  }

  void _onSavedPostsUpdated(SavedPostsUpdated event, Emitter<UserState> emit) {
    emit(state.copyWith(savedPostsStatus: AsyncSuccess(event.savedPosts)));
  }

  Future<void> _onSavePost(SavePost event, Emitter<UserState> emit) async {
    final uid = _getCurrentUid();
    if (uid != null) {
      try {
        await _userRepository.savePost(uid: uid, postId: event.postId);
      } catch (e) {
        throw Exception(e);
      }
    }
  }

  Future<void> _onUnsavePost(UnsavePost event, Emitter<UserState> emit) async {
    final uid = _getCurrentUid();
    if (uid != null) {
      try {
        await _userRepository.unsavePost(uid: uid, postId: event.postId);
      } catch (e) {
        throw Exception(e);
      }
    }
  }

  Future<void> _onUpdateProfile(
    UpdateProfile event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(updateProfileStatus: const AsyncLoading()));
    try {
      await _userRepository.updateUserProfile(uid: event.uid, data: event.data);
      emit(state.copyWith(updateProfileStatus: const AsyncSuccess(null)));
    } catch (e) {
      final eMessage = ExceptionHandler.handle(e).toString();
      emit(state.copyWith(updateProfileStatus: AsyncFailure(eMessage)));
    } finally {
      // Reset lại trạng thái để sẵn sàng cho lần cập nhật tiếp theo.
      await Future.delayed(const Duration(milliseconds: 50));
      emit(state.copyWith(updateProfileStatus: const AsyncInitial()));
    }
  }

  Future<void> _onUpdateAvatar(
    UpdateAvatar event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(isUploadingAvatar: true));
    // Lấy user từ state hiện tại của UserBloc
    final user = state.profileStatus.whenOrNull(success: (data) => data);
    if (user == null) {
      final eMessage = 'Vui lòng đăng nhập lại để thực hiện tác vụ này.';
      emit(
        state.copyWith(
          isUploadingAvatar: false,
          updateProfileStatus: AsyncFailure(eMessage),
        ),
      );
      return;
    }

    try {
      final newPhotoURL = await _userRepository.uploadAvatar(
        uid: user.uid,
        imageFile: event.imageFile,
      );

      await _userRepository.updateUserProfile(
        uid: user.uid,
        data: {'photoURL': newPhotoURL},
      );
    } catch (e) {
      final eMessage = ExceptionHandler.handle(e).toString();
      emit(state.copyWith(updateProfileStatus: AsyncFailure(eMessage)));
    } finally {
      emit(state.copyWith(isUploadingAvatar: false));
    }
  }

  void _onClearProfile(ClearProfile event, Emitter<UserState> emit) {
    _profileSubscription?.cancel();
    _postsSubscription?.cancel();
    _savedPostsSubscription?.cancel();
    emit(const UserState());
  }

  @override
  Future<void> close() {
    _profileSubscription?.cancel();
    _postsSubscription?.cancel();
    _authSubscription?.cancel();
    _savedPostsSubscription?.cancel();
    return super.close();
  }
}
