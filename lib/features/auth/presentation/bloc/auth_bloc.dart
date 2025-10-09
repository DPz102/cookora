import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/exception_handler.dart';

import 'package:cookora/features/auth/domain/repositories/auth_repository.dart';
import 'package:cookora/features/auth/presentation/bloc/auth_event.dart';
import 'package:cookora/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  late final StreamSubscription<firebase.User?> _authSubscription;

  AuthBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(const AuthState.initial()) {
    // Lắng nghe stream user từ repository
    _authSubscription = _authRepository.authStateChanges.listen(
      (firebaseUser) => add(AuthEvent.authStatusChanged(firebaseUser)),
    );

    on<AuthStatusChanged>(_onAuthStatusChanged);
    on<EmailSignInRequested>(_onEmailSignInRequested);
    on<EmailSignUpRequested>(_onEmailSignUpRequested);
    on<PasswordResetRequested>(_onPasswordResetRequested);
    on<PasswordChanged>(_onPasswordChanged);
    on<LogoutRequested>(_onLogoutRequested);
    on<ClearAuthRequestState>(_onClearAuthRequestState);
  }

  void _onAuthStatusChanged(AuthStatusChanged event, Emitter<AuthState> emit) {
    if (event.user != null) {
      emit(AuthState.authenticated(user: event.user!));
    } else {
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _onEmailSignInRequested(
    EmailSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _handleAuthRequest(emit, () async {
      await _authRepository.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
    });
  }

  Future<void> _onEmailSignUpRequested(
    EmailSignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _handleAuthRequest(emit, () async {
      await _authRepository.signUpWithEmailAndPassword(
        email: event.email,
        password: event.password,
        username: event.username,
      );
    });
  }

  Future<void> _onPasswordResetRequested(
    PasswordResetRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(requestStatus: const AsyncLoading()));
    try {
      await _authRepository.sendPasswordResetEmail(email: event.email);
      emit(state.copyWith(successSignal: AuthSuccessSignal.passwordReset));
    } catch (e) {
      final errorMessage = ExceptionHandler.handle(e).toString();
      emit(state.copyWith(requestStatus: AsyncFailure(errorMessage)));
    }
  }

  Future<void> _onPasswordChanged(
    PasswordChanged event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(requestStatus: const AsyncLoading()));
    try {
      await _authRepository.changePassword(
        currentPassword: event.currentPassword,
        newPassword: event.newPassword,
      );
      emit(state.copyWith(successSignal: AuthSuccessSignal.passwordChange));
    } catch (e) {
      final eMessage = ExceptionHandler.handle(e).toString();
      emit(state.copyWith(requestStatus: AsyncFailure(eMessage)));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _authRepository.logout();
    } catch (e) {
      throw ExceptionHandler.handle(e);
    }
  }

  void _onClearAuthRequestState(
    ClearAuthRequestState event,
    Emitter<AuthState> emit,
  ) {
    emit(
      state.copyWith(
        requestStatus: const AsyncInitial(),
        successSignal: AuthSuccessSignal.none,
      ),
    );
  }

  // Helper function để xử lý logic try/catch/loading lặp lại.
  Future<void> _handleAuthRequest(
    Emitter<AuthState> emit,
    Future<void> Function() request,
  ) async {
    emit(state.copyWith(requestStatus: const AsyncLoading()));
    try {
      await request();
    } catch (e) {
      final eMessage = ExceptionHandler.handle(e).toString();
      emit(state.copyWith(requestStatus: AsyncFailure(eMessage)));
    }
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }
}
