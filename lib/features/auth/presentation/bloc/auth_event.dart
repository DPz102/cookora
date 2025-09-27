import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  // Event nội bộ, được gọi khi stream user thay đổi
  const factory AuthEvent.authStatusChanged(firebase.User? user) =
      AuthStatusChanged;

  // Event khi nhấn nút đăng nhập
  const factory AuthEvent.emailSignInRequested({
    required String email,
    required String password,
  }) = EmailSignInRequested;

  // Event khi nhấn nút đăng ký
  const factory AuthEvent.emailSignUpRequested({
    required String email,
    required String password,
    required String username,
  }) = EmailSignUpRequested;

  // Event khi nhất nút quên mật khẩu
  const factory AuthEvent.passwordResetRequested({required String email}) =
      PasswordResetRequested;

  // Event được gọi từ UI khi người dùng nhất nút đăng xuất
  const factory AuthEvent.logoutRequested() = LogoutRequested;

  // Event đổi mật khẩu
  const factory AuthEvent.passwordChange({
    required String currentPassword,
    required String newPassword,
  }) = PasswordChanged;

  // Event để xóa trạng thái của request (loading/error) sau khi đã xử lý
  const factory AuthEvent.clearAuthRequestState() = ClearAuthRequestState;
}
