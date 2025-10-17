import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:cookora/core/utils/image_processor.dart';

import 'package:cookora/features/community/data/datasources/community_data_source.dart';
import 'package:cookora/features/community/domain/entities/post_entity.dart';
import 'package:cookora/features/community/domain/entities/comment_entity.dart';

class CommunityDataSourceImpl implements CommunityDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  CommunityDataSourceImpl(this._firestore, this._storage);

  // Helper để lấy reference đến collection comments của một bài post
  CollectionReference _commentsRef(String postId) {
    return _firestore.collection('posts').doc(postId).collection('comments');
  }

  @override
  Stream<List<({String id, Map<String, dynamic> data})>>
  getCommunityFeedStream({DocumentSnapshot? lastDocument, int limit = 20}) {
    var query = _firestore
        .collection('posts')
        .orderBy('createdAt', descending: true)
        .limit(limit);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }

    return query.snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => (id: doc.id, data: doc.data())).toList(),
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
  Stream<List<({String id, Map<String, dynamic> data})>> getCommentsStream(
    String postId,
  ) {
    return _commentsRef(postId)
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => (id: doc.id, data: doc.data() as Map<String, dynamic>),
              )
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

  @override
  Future<void> addComment({
    required String postId,
    required CommentEntity comment,
  }) async {
    // Lấy reference đến post và comment mới
    final postRef = _firestore.collection('posts').doc(postId);
    final commentRef = _commentsRef(postId).doc(); // Tạo ref cho comment mới

    final commentJson = comment.toJson();
    commentJson['createdAt'] = FieldValue.serverTimestamp();

    // Dùng batch để ghi comment và cập nhật counter
    final batch = _firestore.batch();

    // 1. Thêm comment mới vào subcollection
    batch.set(commentRef, commentJson);
    // 2. Tăng giá trị của trường commentCount lên 1
    batch.update(postRef, {'commentCount': FieldValue.increment(1)});

    // Thực thi cả 2 hành động
    await batch.commit();
  }

  @override
  Future<void> updateComment({
    required String postId,
    required String commentId,
    required String content,
  }) async {
    await _commentsRef(postId).doc(commentId).update({'content': content});
  }

  @override
  Future<void> deleteComment({
    required String postId,
    required String commentId,
  }) async {
    // Lấy reference đến post và comment cần xóa
    final postRef = _firestore.collection('posts').doc(postId);
    final commentRef = _commentsRef(postId).doc(commentId);

    // Dùng batch để xóa comment và cập nhật counter
    final batch = _firestore.batch();

    // 1. Xóa comment khỏi subcollection
    batch.delete(commentRef);
    // 2. Giảm giá trị của trường commentCount đi 1
    batch.update(postRef, {'commentCount': FieldValue.increment(-1)});

    // Thực thi cả 2 hành động
    await batch.commit();
  }

  @override
  Stream<List<({String id, Map<String, dynamic> data})>> getPostsByIdsStream(
    List<String> postIds,
  ) {
    // Firestore `whereIn` chỉ hỗ trợ tối đa 30 item mỗi query
    // Nếu cần hỗ trợ nhiều hơn, bạn sẽ phải chia `postIds` thành nhiều batch
    return _firestore
        .collection('posts')
        .where(FieldPath.documentId, whereIn: postIds)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => (id: doc.id, data: doc.data()))
              .toList(),
        );
  }
}
