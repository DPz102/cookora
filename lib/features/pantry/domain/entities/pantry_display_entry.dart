// lib/features/pantry/domain/entities/pantry_display_entry.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_entry.dart';

part 'pantry_display_entry.freezed.dart';

@freezed
abstract class PantryDisplayEntry with _$PantryDisplayEntry {
  const factory PantryDisplayEntry({
    required PantryEntry entry,
    required Ingredient ingredientInfo,
  }) = _PantryDisplayEntry;
}
