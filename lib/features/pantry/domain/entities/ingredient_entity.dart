import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_entity.freezed.dart';
part 'ingredient_entity.g.dart';

@freezed
abstract class IngredientEntity with _$IngredientEntity {
  const factory IngredientEntity({
    @Default('') String uid,
    @Default('') String id,
    @Default('') String name,
    @Default(0.0) double quantity,
    @Default('') String unit,
  }) = _IngredientEntity;

  // parse JSON (Firestore) thành IngredientEntity
  factory IngredientEntity.fromJson(Map<String, dynamic> json) =>
      _$IngredientEntityFromJson(json);
}
