import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookora/features/user/domain/entities/user_entity.dart';
import 'package:rxdart/rxdart.dart';

import 'package:cookora/features/community/data/datasources/community_data_source.dart';
import 'package:cookora/features/community/domain/repositories/community_repository.dart';
import 'package:cookora/features/community/domain/entities/post_entity.dart';
import 'package:cookora/features/community/domain/entities/comment_entity.dart';

class CommunityRepositoryImpl implements CommunityRepository {
  final CommunityDataSource _dataSource;
  final FirebaseFirestore _firestore;

  CommunityRepositoryImpl(this._dataSource, this._firestore);

  @override
  Stream<List<PostEntity>> getCommunityFeed({required String uid}) {
    return _dataSource.getCommunityFeedStream().switchMap((postsData) async* {
      if (postsData.isEmpty) {
        yield [];
        return;
      }

      final authorIds = postsData
          .map((post) => post.data['authorId'] as String)
          .toSet()
          .toList();

      // Cache để tránh query lại các author đã fetch
      final Map<String, UserEntity> authorCache = {};

      // Chia nhỏ thành batches 10 items (giới hạn của whereIn)
      final batches = <Future<List<UserEntity>>>[];
      for (var i = 0; i < authorIds.length; i += 10) {
        final batch = authorIds.skip(i).take(10).toList();
        batches.add(
          _firestore
              .collection('users')
              .where(FieldPath.documentId, whereIn: batch)
              .get()
              .then(
                (snap) => snap.docs
                    .map((doc) => UserEntity.fromJson(doc.data()))
                    .toList(),
              ),
        );
      }

      // Chờ tất cả batches hoàn thành
      final allUsers = (await Future.wait(batches)).expand((x) => x);
      for (final user in allUsers) {
        authorCache[user.uid] = user;
      }

      // Map posts với thông tin author
      final posts = postsData.map((postData) {
        final authorId = postData.data['authorId'] as String;
        final author = authorCache[authorId];

        return PostEntity.fromJson(postData.data).copyWith(
          id: postData.id,
          authorUsername: author?.username ?? 'Unknown User',
          authorAvatarUrl: author?.photoURL ?? '',
        );
      }).toList();

      yield posts;
    });
  }

  @override
  Stream<List<PostEntity>> getPostsByUser({required String uid}) {
    return _dataSource.getPostsByUserStream(uid).map((list) {
      return list
          .map((item) => PostEntity.fromJson(item.data).copyWith(id: item.id))
          .toList();
    });
  }

  @override
  Stream<List<CommentEntity>> getCommentsStream({required String postId}) {
    return _dataSource.getCommentsStream(postId).switchMap((commentsData) {
      if (commentsData.isEmpty) {
        return Stream.value([]);
      }

      final authorIds = commentsData
          .map((comment) => comment.data['authorId'] as String)
          .toSet()
          .toList();

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

      return usersStream.map((usersMap) {
        return commentsData.map((commentData) {
          final author = usersMap[commentData.data['authorId']];
          return CommentEntity.fromJson(commentData.data).copyWith(
            id: commentData.id,
            authorUsername: author?.username ?? 'Người dùng ẩn',
            authorAvatarUrl: author?.photoURL ?? '',
          );
        }).toList();
      });
    });
  }

  @override
  Future<void> createPost({
    required String uid,
    required File imageFile,
    required String caption,
  }) async {
    //  Tạo một ID cho document mới trước
    final newPostId = FirebaseFirestore.instance.collection('posts').doc().id;

    // Lấy thông tin user TRƯỚC để đảm bảo có đủ dữ liệu
    final userDoc = await _firestore.collection('users').doc(uid).get();
    if (!userDoc.exists) {
      throw Exception('Không tìm thấy thông tin người dùng');
    }

    final userData = userDoc.data()!;

    // Tải ảnh lên Storage với ID vừa tạo
    final imageUrl = await _dataSource.uploadPostImage(
      imageFile: imageFile,
      uid: uid,
      postId: newPostId,
    );

    // Tạo PostEntity với đầy đủ thông tin
    final postEntity = PostEntity(
      imageUrl: imageUrl,
      caption: caption,
      authorId: uid,
      authorUsername: userData['username'] ?? 'Unknown',
      authorAvatarUrl: userData['photoURL'] ?? '',
      likes: [],
      createdAt: null, // Firestore sẽ set timestamp
    );

    // Ghi document vào Firestore
    await _dataSource.createPost(postId: newPostId, postEntity: postEntity);
  }

  @override
  Future<void> likePost({required String uid, required String postId}) async {
    await _dataSource.updateLike(postId: postId, uid: uid, isLiking: true);
  }

  @override
  Future<void> unlikePost({required String uid, required String postId}) async {
    await _dataSource.updateLike(postId: postId, uid: uid, isLiking: false);
  }

  @override
  Future<void> addComment({
    required String uid,
    required String postId,
    required String content,
    String? parentId,
  }) async {
    final comment = CommentEntity(
      content: content,
      authorId: uid,
      parentId: parentId,
    );
    await _dataSource.addComment(postId: postId, comment: comment);
  }

  @override
  Future<void> updateComment({
    required String postId,
    required String commentId,
    required String content,
  }) async {
    await _dataSource.updateComment(
      postId: postId,
      commentId: commentId,
      content: content,
    );
  }

  @override
  Future<void> deleteComment({
    required String postId,
    required String commentId,
  }) async {
    await _dataSource.deleteComment(postId: postId, commentId: commentId);
  }
}
