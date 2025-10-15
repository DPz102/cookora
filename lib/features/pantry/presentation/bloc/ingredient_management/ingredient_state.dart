// lib/features/pantry/presentation/bloc/ingredient_management/ingredient_state.dart
import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'ingredient_state.freezed.dart';

@freezed
abstract class IngredientState with _$IngredientState {
  const factory IngredientState({
    @Default(AsyncInitial()) AsyncState<Map<String, Ingredient>> ingredientsMap,
  }) = _IngredientState;
}
