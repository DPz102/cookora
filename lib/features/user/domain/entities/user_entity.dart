import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

// Converter để xử lý Timestamp
// Đọc Timestamp từ Firestore và chuyển thành DateTime?
DateTime? _timestampToDateTime(Timestamp? timestamp) => timestamp?.toDate();
// Ghi DateTime? vào Firestore (sẽ được ghi đè bởi server Timestamp khi tạo mới )
Timestamp? _dateTimeToTimestamp(DateTime? dateTime) =>
    dateTime == null ? null : Timestamp.fromDate(dateTime);

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    @Default('') String uid,
    @Default('') String email,
    @Default('') String username,
    @Default('') String photoURL,
    @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)
    DateTime? createdAt,
    @Default([]) List<String> savedPosts,
  }) = _UserEntity;

  // Factory để parse dữ liệu từ Firestore
  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
