import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:cookora/core/utils/image_processor.dart';
import 'package:cookora/features/user/data/datasources/user_data_source.dart';

class UserDataSourceImpl implements UserDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  UserDataSourceImpl(this._firestore, this._storage);

  @override
  Stream<Map<String, dynamic>?> getUserProfileStream(String uid) {
    final docRef = _firestore.collection('users').doc(uid);
    return docRef.snapshots().map((snapshot) => snapshot.data());
  }

  @override
  Future<void> updateUserProfile({
    required String uid,
    required Map<String, dynamic> data,
  }) {
    return _firestore.collection('users').doc(uid).update(data);
  }

  @override
  Future<String> uploadAvatar({
    required String uid,
    required XFile imageFile,
  }) async {
    try {
      // Xử lý ảnh avatar
      final optimizedFile = await ImageProcessor.processImage(
        imageFile: File(imageFile.path),
        maxWidth: 400,
        quality: 80,
      );

      // Tạo một tham chiếu đến vị trí lưu file trên Storage
      final ref = _storage.ref('user_avatars/$uid/$uid.jpg');
      await ref.putFile(optimizedFile);

      // Lấy URL để có thể truy cập file
      final downloadURL = await ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> savePost({required String uid, required String postId}) async {
    final batch = _firestore.batch();

    // 1. Cập nhật document của user
    final userRef = _firestore.collection('users').doc(uid);
    batch.update(userRef, {
      'savedPosts': FieldValue.arrayUnion([postId]),
    });

    // 2. Cập nhật document của post
    final postRef = _firestore.collection('posts').doc(postId);
    batch.update(postRef, {'bookmarkCount': FieldValue.increment(1)});

    await batch.commit();
  }

  @override
  Future<void> unsavePost({required String uid, required String postId}) async {
    final batch = _firestore.batch();

    // 1. Cập nhật document của user
    final userRef = _firestore.collection('users').doc(uid);
    batch.update(userRef, {
      'savedPosts': FieldValue.arrayRemove([postId]),
    });

    // 2. Cập nhật document của post
    final postRef = _firestore.collection('posts').doc(postId);
    batch.update(postRef, {'bookmarkCount': FieldValue.increment(-1)});

    await batch.commit();
  }
}
