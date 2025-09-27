import 'dart:io';

import 'package:cookora/features/community/domain/entities/post_entity.dart';

abstract class CommunityRepository {
  // Lấy một stream chứa danh sách các bài đăng cho feed chính.
  Stream<List<PostEntity>> getCommunityFeed();

  // Lấy một stream chứa danh sách bài đăng của một người dùng cụ thể.
  Stream<List<PostEntity>> getPostsByUser(String userId);

  // Tạo một bài đăng mới
  Future<void> createPost({required File imageFile, required String caption});

  // Thích một bài đăng
  Future<void> likePost(String postId);

  // Bỏ thích một bài đăng
  Future<void> unlikePost(String postId);
}
