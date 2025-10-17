// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommentEntity _$CommentEntityFromJson(Map<String, dynamic> json) =>
    _CommentEntity(
      id: json['id'] as String?,
      parentId: json['parentId'] as String?,
      content: json['content'] as String,
      authorId: json['authorId'] as String,
      authorUsername: json['authorUsername'] as String? ?? '',
      authorAvatarUrl: json['authorAvatarUrl'] as String? ?? '',
      createdAt: _timestampToDateTime(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$CommentEntityToJson(_CommentEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'content': instance.content,
      'authorId': instance.authorId,
      'authorUsername': instance.authorUsername,
      'authorAvatarUrl': instance.authorAvatarUrl,
      'createdAt': _dateTimeToTimestamp(instance.createdAt),
    };
