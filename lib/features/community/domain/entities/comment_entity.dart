import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'comment_entity.freezed.dart';
part 'comment_entity.g.dart';

// Converter để xử lý Timestamp
DateTime? _timestampToDateTime(Timestamp? timestamp) => timestamp?.toDate();
Timestamp? _dateTimeToTimestamp(DateTime? dateTime) =>
    dateTime == null ? null : Timestamp.fromDate(dateTime);

@freezed
abstract class CommentEntity with _$CommentEntity {
  const factory CommentEntity({
    String? id,
    String? parentId,
    required String content,
    required String authorId,
    @Default('') String authorUsername,
    @Default('') String authorAvatarUrl,
    @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)
    DateTime? createdAt,
  }) = _CommentEntity;

  factory CommentEntity.fromJson(Map<String, dynamic> json) =>
      _$CommentEntityFromJson(json);
}
