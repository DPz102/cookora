import 'package:firebase_auth/firebase_auth.dart' as firebase;

import 'package:cookora/features/auth/data/datasources/auth_data_source.dart';
import 'package:cookora/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Stream<firebase.User?> get authStateChanges => _dataSource.authStateChanges;

  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _dataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      await _dataSource.signUpWithEmailAndPassword(
        email: email,
        password: password,
        username: username,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await _dataSource.sendPasswordResetEmail(email: email);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) {
    try {
      return _dataSource.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _dataSource.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
