import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'post_entity.freezed.dart';
part 'post_entity.g.dart';

// Converter để xử lý Timestamp
DateTime? _timestampToDateTime(Timestamp? timestamp) => timestamp?.toDate();
Timestamp? _dateTimeToTimestamp(DateTime? dateTime) =>
    dateTime == null ? null : Timestamp.fromDate(dateTime);

@freezed
abstract class PostEntity with _$PostEntity {
  const factory PostEntity({
    String? id,
    required String imageUrl,
    required String caption,

    required String authorId,
    @Default('') String authorUsername,
    @Default('') String authorAvatarUrl,

    required List<String> likes,

    @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)
    DateTime? createdAt,
  }) = _PostEntity;

  factory PostEntity.fromJson(Map<String, dynamic> json) =>
      _$PostEntityFromJson(json);
}
