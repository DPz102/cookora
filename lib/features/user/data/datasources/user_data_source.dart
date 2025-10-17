import 'dart:async';
import 'package:image_picker/image_picker.dart';

abstract class UserDataSource {
  // Lấy stream chứa dữ liệu thô (dạng Map) của một document user.
  Stream<Map<String, dynamic>?> getUserProfileStream(String uid);

  // Cập nhật một document user.
  Future<void> updateUserProfile({
    required String uid,
    required Map<String, dynamic> data,
  });

  Future<String> uploadAvatar({required String uid, required XFile imageFile});
  Future<void> savePost({required String uid, required String postId});
  Future<void> unsavePost({required String uid, required String postId});
}
