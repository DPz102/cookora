// lib/features/pantry/domain/entities/pantry_entry.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_lot.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pantry_entry.freezed.dart';
part 'pantry_entry.g.dart';

DateTime? _timestampToDateTime(Timestamp? timestamp) => timestamp?.toDate();
Timestamp? _dateTimeToTimestamp(DateTime? dateTime) =>
    dateTime == null ? null : Timestamp.fromDate(dateTime);

// Custom serializers for PantryLot list
List<PantryLot> _lotsFromJson(List<dynamic>? json) {
  return json
          ?.map((e) => PantryLot.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [];
}

List<Map<String, dynamic>> _lotsToJson(List<PantryLot> lots) {
  return lots.map((lot) => lot.toJson()).toList();
}

@freezed
abstract class PantryEntry with _$PantryEntry {
  const factory PantryEntry({
    @Default('') String ingredientId,
    @Default(0.0) double totalQuantity,
    @Default('') String unit,
    @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)
    DateTime? earliestExpiryDate,
    @JsonKey(fromJson: _lotsFromJson, toJson: _lotsToJson)
    @Default([])
    List<PantryLot> lots,
  }) = _PantryEntry;

  factory PantryEntry.fromJson(Map<String, dynamic> json) =>
      _$PantryEntryFromJson(json);
}
