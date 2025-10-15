// lib/features/pantry/data/datasources/pantry_data_source_impl.dart
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_entry.dart';
import 'package:uuid/uuid.dart';
import 'package:cookora/features/pantry/data/datasources/pantry_data_source.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_lot.dart';

class PantryDataSourceImpl implements PantryDataSource {
  final FirebaseFirestore _firestore;
  final Uuid _uuid = const Uuid();

  PantryDataSourceImpl(this._firestore);

  CollectionReference<Map<String, dynamic>> _getUserPantryCollection(
    String uid,
  ) {
    return _firestore.collection('users').doc(uid).collection('pantry');
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getPantryStream(String uid) {
    return _getUserPantryCollection(
      uid,
    ).orderBy('earliestExpiryDate').snapshots();
  }

  @override
  Future<void> addLot({required String uid, required PantryLot newLot}) {
    final docRef = _getUserPantryCollection(uid).doc(newLot.ingredientId);

    return _firestore.runTransaction((transaction) async {
      final docSnapshot = await transaction.get(docRef);
      final lotWithId = newLot.copyWith(id: _uuid.v4());

      if (!docSnapshot.exists) {
        final newPantryEntry = PantryEntry(
          ingredientId: newLot.ingredientId,
          totalQuantity: newLot.currentQuantity,
          unit: newLot.unit,
          earliestExpiryDate: newLot.expiryDate,
          lots: [lotWithId],
        );
        transaction.set(docRef, newPantryEntry.toJson());
      } else {
        final existingEntry = PantryEntry.fromJson(docSnapshot.data()!);
        final updatedLots = [...existingEntry.lots, lotWithId];
        final newTotalQuantity =
            existingEntry.totalQuantity + newLot.currentQuantity;
        final newEarliestExpiryDate = _calculateEarliestExpiry(updatedLots);

        transaction.update(docRef, {
          'lots': updatedLots.map((l) => l.toJson()).toList(),
          'totalQuantity': newTotalQuantity,
          'earliestExpiryDate': newEarliestExpiryDate,
        });
      }
    });
  }

  @override
  Future<void> updateLot({required String uid, required PantryLot updatedLot}) {
    final docRef = _getUserPantryCollection(uid).doc(updatedLot.ingredientId);

    return _firestore.runTransaction((transaction) async {
      final docSnapshot = await transaction.get(docRef);
      if (!docSnapshot.exists) throw Exception("Document không tồn tại!");

      final existingEntry = PantryEntry.fromJson(docSnapshot.data()!);
      final lotIndex = existingEntry.lots.indexWhere(
        (l) => l.id == updatedLot.id,
      );
      if (lotIndex == -1) throw Exception("Lô hàng không tồn tại!");

      final updatedLots = List<PantryLot>.from(existingEntry.lots);
      updatedLots[lotIndex] = updatedLot;

      final newTotalQuantity = updatedLots.fold<double>(
        0,
        (total, lot) => total + lot.currentQuantity,
      );
      final newEarliestExpiryDate = _calculateEarliestExpiry(updatedLots);

      transaction.update(docRef, {
        'lots': updatedLots.map((l) => l.toJson()).toList(),
        'totalQuantity': newTotalQuantity,
        'earliestExpiryDate': newEarliestExpiryDate,
      });
    });
  }

  @override
  Future<void> deleteLot({
    required String uid,
    required String ingredientId,
    required String lotId,
  }) {
    final docRef = _getUserPantryCollection(uid).doc(ingredientId);

    return _firestore.runTransaction((transaction) async {
      final docSnapshot = await transaction.get(docRef);
      if (!docSnapshot.exists) return;

      final existingEntry = PantryEntry.fromJson(docSnapshot.data()!);
      final updatedLots = existingEntry.lots
          .where((l) => l.id != lotId)
          .toList();

      if (updatedLots.isEmpty) {
        transaction.delete(docRef);
      } else {
        final newTotalQuantity = updatedLots.fold<double>(
          0,
          (total, lot) => total + lot.currentQuantity,
        );
        final newEarliestExpiryDate = _calculateEarliestExpiry(updatedLots);

        transaction.update(docRef, {
          'lots': updatedLots.map((l) => l.toJson()).toList(),
          'totalQuantity': newTotalQuantity,
          'earliestExpiryDate': newEarliestExpiryDate,
        });
      }
    });
  }

  @override
  Future<void> deletePantryEntry({
    required String uid,
    required String ingredientId,
  }) {
    // Đơn giản là xóa toàn bộ document
    return _getUserPantryCollection(uid).doc(ingredientId).delete();
  }

  DateTime? _calculateEarliestExpiry(List<PantryLot> lots) {
    DateTime? earliest;
    for (final lot in lots) {
      if (lot.expiryDate != null) {
        if (earliest == null || lot.expiryDate!.isBefore(earliest)) {
          earliest = lot.expiryDate;
        }
      }
    }
    return earliest;
  }
}
