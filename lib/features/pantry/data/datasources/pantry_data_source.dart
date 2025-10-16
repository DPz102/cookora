// lib/features/pantry/data/datasources/pantry_data_source.dart
import 'package:cookora/features/pantry/domain/entities/pantry_entry.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_lot.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient.dart';

abstract class PantryDataSource {
  Stream<List<PantryEntry>> getPantryEntries(String uid);

  Future<void> addLot({
    required String uid,
    required Ingredient ingredient,
    required PantryLot lot,
  });

  Future<void> addMultipleLots({
    required String uid,
    required List<({Ingredient ingredient, PantryLot lot})> items,
  });

  Future<void> updateLot({
    required String uid,
    required String ingredientId,
    required PantryLot lot,
  });

  Future<void> deleteLot({
    required String uid,
    required String ingredientId,
    required String lotId,
  });

  Future<void> deleteEntry({required String uid, required String ingredientId});
}
