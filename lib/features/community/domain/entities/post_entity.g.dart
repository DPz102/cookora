// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostEntity _$PostEntityFromJson(Map<String, dynamic> json) => _PostEntity(
  id: json['id'] as String?,
  imageUrl: json['imageUrl'] as String,
  caption: json['caption'] as String,
  authorId: json['authorId'] as String,
  authorUsername: json['authorUsername'] as String? ?? '',
  authorAvatarUrl: json['authorAvatarUrl'] as String? ?? '',
  likes: (json['likes'] as List<dynamic>).map((e) => e as String).toList(),
  createdAt: _timestampToDateTime(json['createdAt'] as Timestamp?),
);

Map<String, dynamic> _$PostEntityToJson(_PostEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'caption': instance.caption,
      'authorId': instance.authorId,
      'authorUsername': instance.authorUsername,
      'authorAvatarUrl': instance.authorAvatarUrl,
      'likes': instance.likes,
      'createdAt': _dateTimeToTimestamp(instance.createdAt),
    };
