import 'dart:async';
import 'package:image_picker/image_picker.dart';

import 'package:cookora/features/user/domain/entities/user_entity.dart';
import 'package:cookora/features/user/data/datasources/user_data_source.dart';
import 'package:cookora/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Stream<UserEntity> getUserProfileStream(String uid) {
    return _dataSource.getUserProfileStream(uid).map((data) {
      if (data != null) {
        //  Map dữ liệu Firestore thành UserEntity.
        return UserEntity.fromJson(data);
      } else {
        throw Exception('Không tìm thấy hồ sơ người dùng với uid: $uid');
      }
    });
  }

  @override
  Future<void> updateUserProfile({
    required String uid,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _dataSource.updateUserProfile(uid: uid, data: data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> uploadAvatar({
    required String uid,
    required XFile imageFile,
  }) async {
    return await _dataSource.uploadAvatar(uid: uid, imageFile: imageFile);
  }
}
