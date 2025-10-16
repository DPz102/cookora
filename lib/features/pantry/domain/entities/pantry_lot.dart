// lib/features/pantry/domain/entities/pantry_lot.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pantry_lot.freezed.dart';
part 'pantry_lot.g.dart';

DateTime? _timestampToDateTime(dynamic timestamp) {
  if (timestamp == null) return null;
  if (timestamp is Timestamp) return timestamp.toDate();
  if (timestamp is DateTime) return timestamp;
  if (timestamp is int) return DateTime.fromMillisecondsSinceEpoch(timestamp);
  return null;
}

dynamic _dateTimeToTimestamp(DateTime? dateTime) {
  if (dateTime == null) return null;
  return Timestamp.fromDate(dateTime);
}

@freezed
abstract class PantryLot with _$PantryLot {
  const factory PantryLot({
    @Default('') String id,
    @Default(0.0) double quantity,
    @Default('') String unit,
    @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)
    DateTime? purchaseDate,
    @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)
    DateTime? expiryDate,
  }) = _PantryLot;

  factory PantryLot.fromJson(Map<String, dynamic> json) =>
      _$PantryLotFromJson(json);
}
