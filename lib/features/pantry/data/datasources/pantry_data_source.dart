// lib/features/pantry/data/datasources/pantry_data_source.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_lot.dart';

abstract class PantryDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getPantryStream(String uid);

  Future<void> addLot({required String uid, required PantryLot newLot});

  Future<void> updateLot({required String uid, required PantryLot updatedLot});

  Future<void> deleteLot({
    required String uid,
    required String ingredientId,
    required String lotId,
  });

  // Xóa toàn bộ một entry (tất cả các lô của một nguyên liệu)
  Future<void> deletePantryEntry({
    required String uid,
    required String ingredientId,
  });
}
