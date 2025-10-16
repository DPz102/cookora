// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pantry_lot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PantryLot _$PantryLotFromJson(Map<String, dynamic> json) => _PantryLot(
  id: json['id'] as String? ?? '',
  quantity: (json['quantity'] as num?)?.toDouble() ?? 0.0,
  unit: json['unit'] as String? ?? '',
  purchaseDate: _timestampToDateTime(json['purchaseDate']),
  expiryDate: _timestampToDateTime(json['expiryDate']),
);

Map<String, dynamic> _$PantryLotToJson(_PantryLot instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'purchaseDate': _dateTimeToTimestamp(instance.purchaseDate),
      'expiryDate': _dateTimeToTimestamp(instance.expiryDate),
    };
