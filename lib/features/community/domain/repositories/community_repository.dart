import 'dart:io';

import 'package:cookora/features/community/domain/entities/post_entity.dart';
import 'package:cookora/features/community/domain/entities/comment_entity.dart';

abstract class CommunityRepository {
  // Lấy một stream chứa danh sách các bài đăng cho feed chính.
  Stream<List<PostEntity>> getCommunityFeed({required String uid});

  // Lấy một stream chứa danh sách bài đăng của một người dùng cụ thể.
  Stream<List<PostEntity>> getPostsByUser({required String uid});

  /// Lấy stream danh sách comment của một bài đăng.
  Stream<List<CommentEntity>> getCommentsStream({required String postId});

  // Lấy chi tiết các bài viết dựa trên danh sách ID
  Stream<List<PostEntity>> getPostsByIds(List<String> postIds);

  // Tạo một bài đăng mới
  Future<void> createPost({
    required String uid,
    required File imageFile,
    required String caption,
  });

  // Thích một bài đăng
  Future<void> likePost({required String uid, required String postId});

  // Bỏ thích một bài đăng
  Future<void> unlikePost({required String uid, required String postId});

  /// Thêm một comment mới vào bài đăng.
  Future<void> addComment({
    required String uid,
    required String postId,
    required String content,
    String? parentId,
  });

  /// Cập nhật nội dung một comment.
  Future<void> updateComment({
    required String postId,
    required String commentId,
    required String content,
  });

  /// Xóa một comment.
  Future<void> deleteComment({
    required String postId,
    required String commentId,
  });
}
