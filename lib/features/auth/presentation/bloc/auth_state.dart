import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:cookora/core/utils/async_state.dart';

part 'auth_state.freezed.dart';

enum AuthSuccessSignal { none, passwordReset, passwordChange }

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial({
    @Default(AsyncInitial()) AsyncState<void> requestStatus,
    @Default(AuthSuccessSignal.none) AuthSuccessSignal successSignal,
  }) = Initial;

  const factory AuthState.authenticated({
    required firebase.User user,
    // Một thuộc tính duy nhất để quản lý trạng thái của các request
    @Default(AsyncInitial()) AsyncState<void> requestStatus,
    // Thuộc tính để gửi tín hiệu thành công cho UI
    @Default(AuthSuccessSignal.none) AuthSuccessSignal successSignal,
  }) = Authenticated;

  const factory AuthState.unauthenticated({
    @Default(AsyncInitial()) AsyncState<void> requestStatus,
    @Default(AuthSuccessSignal.none) AuthSuccessSignal successSignal,
  }) = Unauthenticated;
}
