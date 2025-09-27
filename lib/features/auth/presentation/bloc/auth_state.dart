import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:cookora/core/utils/async_state.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  // Trạng thái ban đầu
  const factory AuthState.initial({
    @Default(AsyncInitial()) AsyncState<void> authRequestState,
  }) = Initial;

  // Trạng thái đã xác thực, chứa firebase.User
  const factory AuthState.authenticated({
    required firebase.User user,
    @Default(AsyncInitial()) AsyncState<void> authRequestState,
  }) = Authenticated;

  // Trạng thái chưa xác thực
  const factory AuthState.unauthenticated({
    @Default(AsyncInitial()) AsyncState<void> authRequestState,
  }) = Unauthenticated;

  // Trạng thái của quên mật khẩu
  const factory AuthState.passwordResetSuccess({
    @Default(AsyncInitial()) AsyncState<void> authRequestState,
  }) = PasswordResetSuccess;

  // Trạng thái của đổi mật khẩu
  const factory AuthState.changePasswordSuccess({
    @Default(AsyncInitial()) AsyncState<void> authRequestState,
  }) = ChangePasswordSuccess;
}
