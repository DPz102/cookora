// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pantry_lot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PantryLot _$PantryLotFromJson(Map<String, dynamic> json) => _PantryLot(
  id: json['id'] as String? ?? '',
  ingredientId: json['ingredientId'] as String,
  initialQuantity: (json['initialQuantity'] as num?)?.toDouble() ?? 0.0,
  currentQuantity: (json['currentQuantity'] as num?)?.toDouble() ?? 0.0,
  unit: json['unit'] as String? ?? '',
  purchaseDate: _timestampToDateTime(json['purchaseDate'] as Timestamp?),
  expiryDate: _timestampToDateTime(json['expiryDate'] as Timestamp?),
);

Map<String, dynamic> _$PantryLotToJson(_PantryLot instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ingredientId': instance.ingredientId,
      'initialQuantity': instance.initialQuantity,
      'currentQuantity': instance.currentQuantity,
      'unit': instance.unit,
      'purchaseDate': _dateTimeToTimestamp(instance.purchaseDate),
      'expiryDate': _dateTimeToTimestamp(instance.expiryDate),
    };
