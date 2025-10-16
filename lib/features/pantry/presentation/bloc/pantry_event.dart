// lib/features/pantry/presentation/bloc/pantry_event.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_entry.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient.dart';

part 'pantry_event.freezed.dart';

@freezed
abstract class PantryEvent with _$PantryEvent {
  const factory PantryEvent.subscribeToPantry({required String uid}) =
      SubscribeToPantry;

  const factory PantryEvent.pantryUpdated(List<PantryEntry> entries) =
      PantryUpdated;

  /// Thêm 1 lot.
  const factory PantryEvent.addLot({
    required Ingredient ingredient,
    required Map<String, dynamic> lotData,
  }) = AddLot;

  /// Thêm nhiều lots.
  const factory PantryEvent.addMultipleLots({
    required List<({Ingredient ingredient, Map<String, dynamic> lotData})>
    items,
  }) = AddMultipleLots;

  /// Cập nhật lot.
  const factory PantryEvent.updateLot({
    required String ingredientId,
    required String lotId,
    required Map<String, dynamic> lotData,
  }) = UpdateLot;

  const factory PantryEvent.deleteLot({
    required String ingredientId,
    required String lotId,
  }) = DeleteLot;

  const factory PantryEvent.deleteEntry({required String ingredientId}) =
      DeleteEntry;

  const factory PantryEvent.resetMutationStatus() = ResetMutationStatus;

  const factory PantryEvent.clearPantry() = ClearPantry;
}
