import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookora/features/user/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'package:cookora/features/community/data/datasources/community_data_source.dart';
import 'package:cookora/features/community/domain/entities/post_entity.dart';
import 'package:cookora/features/community/domain/repositories/community_repository.dart';

class CommunityRepositoryImpl implements CommunityRepository {
  final CommunityDataSource _dataSource;
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  CommunityRepositoryImpl(this._dataSource, this._firestore, this._auth);

  @override
  Stream<List<PostEntity>> getCommunityFeed() {
    return _dataSource.getCommunityFeedStream().switchMap((postsData) {
      if (postsData.isEmpty) {
        return Stream.value([]);
      }

      // Lấy danh sách các authorId duy nhất
      final authorIds = postsData
          .map((post) => post.data['authorId'] as String)
          .toSet()
          .toList();

      // Lấy thông tin của tất cả các tác giả cần thiết trong 1 query
      final usersStream = _firestore
          .collection('users')
          .where(FieldPath.documentId, whereIn: authorIds)
          .snapshots()
          .map((snapshot) {
            final usersMap = <String, UserEntity>{};
            for (var doc in snapshot.docs) {
              usersMap[doc.id] = UserEntity.fromJson(doc.data());
            }
            return usersMap;
          });

      // Kết hợp stream posts và stream users
      return usersStream.map((usersMap) {
        return postsData.map((postData) {
          final author = usersMap[postData.data['authorId']];
          return PostEntity.fromJson(postData.data).copyWith(
            id: postData.id,
            authorUsername: author?.username ?? 'Người dùng ẩn',
            authorAvatarUrl: author?.photoURL ?? '',
          );
        }).toList();
      });
    });
  }

  @override
  Stream<List<PostEntity>> getPostsByUser(String userId) {
    return _dataSource.getPostsByUserStream(userId).map((list) {
      return list
          .map((item) => PostEntity.fromJson(item.data).copyWith(id: item.id))
          .toList();
    });
  }

  @override
  Future<void> createPost({
    required File imageFile,
    required String caption,
  }) async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception('Người dùng chưa đăng nhập để thực hiện hành động này.');
    }

    //  Tạo một ID cho document mới trước
    final newPostId = FirebaseFirestore.instance.collection('posts').doc().id;

    // Tải ảnh lên Storage với ID vừa tạo
    final imageUrl = await _dataSource.uploadPostImage(
      imageFile: imageFile,
      userId: user.uid,
      postId: newPostId,
    );

    // Tạo model với đầy đủ thông tin
    final postEntity = PostEntity(
      imageUrl: imageUrl,
      caption: caption,
      authorId: user.uid,
      likes: [],
      createdAt: null,
    );

    // Ghi document vào Firestore
    await _dataSource.createPost(postId: newPostId, postEntity: postEntity);
  }

  @override
  Future<void> likePost(String postId) async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception('Người dùng chưa đăng nhập để thực hiện hành động này.');
    }
    await _dataSource.updateLike(
      postId: postId,
      userId: user.uid,
      isLiking: true,
    );
  }

  @override
  Future<void> unlikePost(String postId) async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception('Người dùng chưa đăng nhập để thực hiện hành động này.');
    }
    await _dataSource.updateLike(
      postId: postId,
      userId: user.uid,
      isLiking: false,
    );
  }
}
