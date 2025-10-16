// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pantry_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PantryEntry _$PantryEntryFromJson(Map<String, dynamic> json) => _PantryEntry(
  ingredient: Ingredient.fromJson(json['ingredient'] as Map<String, dynamic>),
  totalQuantity: (json['totalQuantity'] as num?)?.toDouble() ?? 0.0,
  unit: json['unit'] as String? ?? '',
  earliestExpiryDate: _timestampToDateTime(json['earliestExpiryDate']),
  lots:
      (json['lots'] as List<dynamic>?)
          ?.map((e) => PantryLot.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$PantryEntryToJson(_PantryEntry instance) =>
    <String, dynamic>{
      'ingredient': instance.ingredient.toJson(),
      'totalQuantity': instance.totalQuantity,
      'unit': instance.unit,
      'earliestExpiryDate': _dateTimeToTimestamp(instance.earliestExpiryDate),
      'lots': instance.lots.map((e) => e.toJson()).toList(),
    };
