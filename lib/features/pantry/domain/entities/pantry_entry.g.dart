// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pantry_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PantryEntry _$PantryEntryFromJson(Map<String, dynamic> json) => _PantryEntry(
  ingredientId: json['ingredientId'] as String? ?? '',
  totalQuantity: (json['totalQuantity'] as num?)?.toDouble() ?? 0.0,
  unit: json['unit'] as String? ?? '',
  earliestExpiryDate: _timestampToDateTime(
    json['earliestExpiryDate'] as Timestamp?,
  ),
  lots: json['lots'] == null ? const [] : _lotsFromJson(json['lots'] as List?),
);

Map<String, dynamic> _$PantryEntryToJson(_PantryEntry instance) =>
    <String, dynamic>{
      'ingredientId': instance.ingredientId,
      'totalQuantity': instance.totalQuantity,
      'unit': instance.unit,
      'earliestExpiryDate': _dateTimeToTimestamp(instance.earliestExpiryDate),
      'lots': _lotsToJson(instance.lots),
    };
