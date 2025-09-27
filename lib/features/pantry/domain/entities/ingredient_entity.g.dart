// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IngredientEntity _$IngredientEntityFromJson(Map<String, dynamic> json) =>
    _IngredientEntity(
      uid: json['uid'] as String? ?? '',
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0.0,
      unit: json['unit'] as String? ?? '',
    );

Map<String, dynamic> _$IngredientEntityToJson(_IngredientEntity instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'unit': instance.unit,
    };
