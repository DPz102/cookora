// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Ingredient _$IngredientFromJson(Map<String, dynamic> json) => _Ingredient(
  ingredientId: json['ingredientId'] as String? ?? '',
  name: json['name'] as String? ?? '',
  description: json['description'] as String? ?? '',
  category: json['category'] as String? ?? '',
  searchKeywords:
      (json['searchKeywords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  validUnits:
      (json['validUnits'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  defaultShelfLifeInDays:
      (json['defaultShelfLifeInDays'] as num?)?.toInt() ?? 3,
  imageUrl: json['imageUrl'] as String? ?? '',
);

Map<String, dynamic> _$IngredientToJson(_Ingredient instance) =>
    <String, dynamic>{
      'ingredientId': instance.ingredientId,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'searchKeywords': instance.searchKeywords,
      'validUnits': instance.validUnits,
      'defaultShelfLifeInDays': instance.defaultShelfLifeInDays,
      'imageUrl': instance.imageUrl,
    };
