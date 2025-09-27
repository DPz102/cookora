import 'package:firebase_auth/firebase_auth.dart' as firebase;

// Lớp trừu tượng định nghĩa các phương thức mà data source phải cung cấp
abstract class AuthDataSource {
  // Lấy stream user thô từ firebase
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

  Future<void> signOut();
}
