import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:cloud_functions/cloud_functions.dart';

import 'package:cookora/features/auth/data/datasources/auth_data_source.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final firebase.FirebaseAuth _firebaseAuth;
  final FirebaseFunctions _functions;

  AuthDataSourceImpl({
    required firebase.FirebaseAuth firebaseAuth,
    required FirebaseFunctions functions,
  }) : _firebaseAuth = firebaseAuth,
       _functions = functions;

  @override
  Stream<firebase.User?> get authStateChanges {
    return _firebaseAuth.authStateChanges();
  }

  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final callable = _functions.httpsCallable('createUserWithProfile');
      await callable.call<void>({
        'email': email,
        'password': password,
        'username': username,
      });

      // Sau khi function chạy thành công, tự động đăng nhập để client nhận được session
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null || user.email == null) {
        throw Exception('Hành động này yêu cầu đăng nhập lại.');
      }

      await user.updatePassword(newPassword);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}
