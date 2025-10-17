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
    // SỬA LẠI HÀM NÀY
    return _dataSource
        .getUserProfileStream(uid)
        // 1. Thêm toán tử `where` của RxDart (hoặc Stream API)
        // Nó sẽ lọc và chỉ cho phép các sự kiện `data` không phải là null đi qua.
        // Nếu `snapshots()` trả về null lúc đầu, nó sẽ bị bỏ qua.
        .where((data) => data != null)
        .map((data) {
          // 2. Khi đến đây, `data` được đảm bảo không phải là null nữa.
          // Ta có thể loại bỏ `if (data != null)` và dấu `!`.
          return UserEntity.fromJson(data!); // Có thể để dấu ! cho null safety
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

  @override
  Future<void> savePost({required String uid, required String postId}) {
    return _dataSource.savePost(uid: uid, postId: postId);
  }

  @override
  Future<void> unsavePost({required String uid, required String postId}) {
    return _dataSource.unsavePost(uid: uid, postId: postId);
  }
}
