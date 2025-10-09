import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:cookora/core/utils/image_processor.dart';

import 'package:cookora/features/community/data/datasources/community_data_source.dart';
import 'package:cookora/features/community/domain/entities/post_entity.dart';

class CommunityDataSourceImpl implements CommunityDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  CommunityDataSourceImpl(this._firestore, this._storage);

  @override
  Stream<List<({String id, Map<String, dynamic> data})>>
  getCommunityFeedStream() {
    return _firestore
        .collection('posts')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => (id: doc.id, data: doc.data()))
              .toList(),
        );
  }

  @override
  Stream<List<({String id, Map<String, dynamic> data})>> getPostsByUserStream(
    String userId,
  ) {
    return _firestore
        .collection('posts')
        .where('authorId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => (id: doc.id, data: doc.data()))
              .toList(),
        );
  }

  @override
  Future<String> uploadPostImage({
    required File imageFile,
    required String uid,
    required String postId,
  }) async {
    // Xử lý ảnh trước khi tải lên
    final optimizedFile = await ImageProcessor.processImage(
      imageFile: imageFile,
      maxWidth: 1080,
      quality: 85,
    );

    // Tải file đã được tối ưu lên
    final ref = _storage.ref('posts/$uid/$postId.jpg');
    await ref.putFile(optimizedFile);

    // Lấy URL tải về
    final downloadURL = await ref.getDownloadURL();
    return downloadURL;
  }

  @override
  Future<void> createPost({
    required String postId,
    required PostEntity postEntity,
  }) async {
    final postJson = postEntity.toJson();
    postJson['createdAt'] = FieldValue.serverTimestamp();
    await _firestore.collection('posts').doc(postId).set(postJson);
  }

  @override
  Future<void> updateLike({
    required String postId,
    required String uid,
    required bool isLiking,
  }) async {
    final docRef = _firestore.collection('posts').doc(postId);
    final updateValue = isLiking
        ? FieldValue.arrayUnion([uid])
        : FieldValue.arrayRemove([uid]);

    await docRef.update({'likes': updateValue});
  }
}
