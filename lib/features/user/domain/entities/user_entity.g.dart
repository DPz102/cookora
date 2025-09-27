// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => _UserEntity(
  uid: json['uid'] as String? ?? '',
  email: json['email'] as String? ?? '',
  username: json['username'] as String? ?? '',
  photoURL: json['photoURL'] as String? ?? '',
  createdAt: _timestampToDateTime(json['createdAt'] as Timestamp?),
);

Map<String, dynamic> _$UserEntityToJson(_UserEntity instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'username': instance.username,
      'photoURL': instance.photoURL,
      'createdAt': _dateTimeToTimestamp(instance.createdAt),
    };
