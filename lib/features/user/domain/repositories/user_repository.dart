import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:cookora/features/user/domain/entities/user_entity.dart';

abstract class UserRepository {
  Stream<UserEntity> getUserProfileStream(String uid);

  Future<void> updateUserProfile({
    required String uid,
    required Map<String, dynamic> data,
  });

  Future<String> uploadAvatar({required String uid, required XFile imageFile});
}
