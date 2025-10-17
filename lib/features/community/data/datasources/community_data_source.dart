import 'dart:io';

import 'package:cookora/features/community/domain/entities/post_entity.dart';
import 'package:cookora/features/community/domain/entities/comment_entity.dart';

abstract class CommunityDataSource {
  Stream<List<({String id, Map<String, dynamic> data})>>
  getCommunityFeedStream();

  Stream<List<({String id, Map<String, dynamic> data})>> getPostsByUserStream(
    String userId,
  );

  Stream<List<({String id, Map<String, dynamic> data})>> getCommentsStream(
    String postId,
  );

  Stream<List<({String id, Map<String, dynamic> data})>> getPostsByIdsStream(
    List<String> postIds,
  );

  // Tải ảnh lên Storage và trả về URL
  Future<String> uploadPostImage({
    required File imageFile,
    required String uid,
    required String postId,
  });

  // Tạo document post trên Firestore
  Future<void> createPost({
    required String postId,
    required PostEntity postEntity,
  });

  // Cập nhật lượt thích (thích hoặc bỏ thích)
  Future<void> updateLike({
    required String postId,
    required String uid,
    required bool isLiking,
  });

  /// Tạo document comment mới trên Firestore.
  Future<void> addComment({
    required String postId,
    required CommentEntity comment,
  });

  /// Cập nhật document comment trên Firestore.
  Future<void> updateComment({
    required String postId,
    required String commentId,
    required String content,
  });

  /// Xóa document comment trên Firestore.
  Future<void> deleteComment({
    required String postId,
    required String commentId,
  });
}
