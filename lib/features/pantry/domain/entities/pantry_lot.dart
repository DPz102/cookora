// lib/features/pantry/domain/entities/pantry_lot.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pantry_lot.freezed.dart';
part 'pantry_lot.g.dart';

DateTime? _timestampToDateTime(Timestamp? timestamp) => timestamp?.toDate();
Timestamp? _dateTimeToTimestamp(DateTime? dateTime) =>
    dateTime == null ? null : Timestamp.fromDate(dateTime);

@freezed
abstract class PantryLot with _$PantryLot {
  const factory PantryLot({
    @Default('') String id,
    required String ingredientId,
    @Default(0.0) double initialQuantity,
    @Default(0.0) double currentQuantity,
    @Default('') String unit,
    @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)
    DateTime? purchaseDate,
    @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)
    DateTime? expiryDate,
  }) = _PantryLot;

  factory PantryLot.fromJson(Map<String, dynamic> json) =>
      _$PantryLotFromJson(json);
}
