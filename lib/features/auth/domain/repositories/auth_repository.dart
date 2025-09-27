import 'package:firebase_auth/firebase_auth.dart' as firebase;

abstract class AuthRepository {
  // Cung cấp một Stream để lắng nghe sự thay đổi trạng thái người dùng
  Stream<firebase.User?> get authStateChanges;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  });

  Future<void> sendPasswordResetEmail({required String email});

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<void> logout();
}
