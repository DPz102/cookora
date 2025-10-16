import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cookora/features/pantry/domain/entities/ingredient.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_lot.dart';

part 'pantry_entry.freezed.dart';
part 'pantry_entry.g.dart';

// Timestamp converters
DateTime? _timestampToDateTime(dynamic timestamp) {
  if (timestamp == null) return null;
  if (timestamp is Timestamp) return timestamp.toDate();
  if (timestamp is int) return DateTime.fromMillisecondsSinceEpoch(timestamp);
  return null;
}

dynamic _dateTimeToTimestamp(DateTime? dateTime) {
  if (dateTime == null) return null;
  return Timestamp.fromDate(dateTime);
}

@freezed
abstract class PantryEntry with _$PantryEntry {
  @JsonSerializable(explicitToJson: true)
  const factory PantryEntry({
    // Ingredient Entity
    required Ingredient ingredient,

    // Pantry Entry Entity
    @Default(0.0) double totalQuantity,
    @Default('') String unit,
    @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)
    DateTime? earliestExpiryDate,

    // Pantry Lot Entity - Freezed tự động handle nested serialization
    @Default([]) List<PantryLot> lots,
  }) = _PantryEntry;

  factory PantryEntry.fromJson(Map<String, dynamic> json) =>
      _$PantryEntryFromJson(json);
}
