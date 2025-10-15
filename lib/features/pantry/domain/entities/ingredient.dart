// lib/features/pantry/domain/entities/ingredient.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@freezed
abstract class Ingredient with _$Ingredient {
  const factory Ingredient({
    @Default('') String ingredientId,
    @Default('') String name,
    @Default('') String description,
    @Default('') String category,
    @Default([]) List<String> searchKeywords,
    @Default([]) List<String> validUnits,
    @Default(3) int defaultShelfLifeInDays,
    @Default('') String imageUrl,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}
