// lib/features/pantry/presentation/bloc/ingredient_management/ingredient_event.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'ingredient_event.freezed.dart';

@freezed
abstract class IngredientEvent with _$IngredientEvent {
  const factory IngredientEvent.fetchAll() = FetchAllIngredients;
}
