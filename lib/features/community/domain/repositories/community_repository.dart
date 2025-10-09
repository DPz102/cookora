import 'dart:io';

import 'package:cookora/features/community/domain/entities/post_entity.dart';

abstract class CommunityRepository {
  // Lấy một stream chứa danh sách các bài đăng cho feed chính.
  Stream<List<PostEntity>> getCommunityFeed({required String uid});

  // Lấy một stream chứa danh sách bài đăng của một người dùng cụ thể.
  Stream<List<PostEntity>> getPostsByUser({required String uid});

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
}
