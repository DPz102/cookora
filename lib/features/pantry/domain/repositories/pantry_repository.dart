// lib/features/pantry/domain/repositories/pantry_repository.dart
import 'package:cookora/features/pantry/domain/entities/pantry_entry.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_lot.dart';

abstract class PantryRepository {
  Stream<List<PantryEntry>> getPantryEntries(String uid);

  Future<void> addLot({required String uid, required PantryLot lot});

  Future<void> updateLot({required String uid, required PantryLot lot});

  Future<void> deleteLot({
    required String uid,
    required String ingredientId,
    required String lotId,
  });

  Future<void> deletePantryEntry({
    required String uid,
    required String ingredientId,
  });
}
