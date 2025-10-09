// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeEntity _$RecipeEntityFromJson(Map<String, dynamic> json) =>
    _RecipeEntity(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      requiredIngredients:
          (json['requiredIngredients'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      optionalIngredients:
          (json['optionalIngredients'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      instructions:
          (json['instructions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      source:
          $enumDecodeNullable(_$RecipeSourceEnumMap, json['source']) ??
          RecipeSource.unknown,
      createdAt: _timestampToDateTime(json['createdAt'] as Timestamp?),
      isUserFavorite: json['isUserFavorite'] as bool? ?? false,
      servingSize: (json['servingSize'] as num?)?.toInt() ?? 2,
      cookTimeInMinutes: (json['cookTimeInMinutes'] as num?)?.toInt() ?? 20,
      difficulty: json['difficulty'] as String? ?? 'Dễ',
    );

Map<String, dynamic> _$RecipeEntityToJson(_RecipeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'requiredIngredients': instance.requiredIngredients,
      'optionalIngredients': instance.optionalIngredients,
      'instructions': instance.instructions,
      'source': _$RecipeSourceEnumMap[instance.source]!,
      'createdAt': _dateTimeToTimestamp(instance.createdAt),
      'isUserFavorite': instance.isUserFavorite,
      'servingSize': instance.servingSize,
      'cookTimeInMinutes': instance.cookTimeInMinutes,
      'difficulty': instance.difficulty,
    };

const _$RecipeSourceEnumMap = {
  RecipeSource.cookoraDb: 'cookora_db',
  RecipeSource.scanned: 'scanned',
  RecipeSource.userSaved: 'user_saved',
  RecipeSource.unknown: 'unknown',
};
