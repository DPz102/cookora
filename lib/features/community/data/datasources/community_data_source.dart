import 'dart:io';

import 'package:cookora/features/community/domain/entities/post_entity.dart';

abstract class CommunityDataSource {
  Stream<List<({String id, Map<String, dynamic> data})>>
  getCommunityFeedStream();

  Stream<List<({String id, Map<String, dynamic> data})>> getPostsByUserStream(
    String userId,
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
}
