// lib/features/pantry/data/datasources/pantry_data_source_impl.dart
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import 'package:cookora/features/pantry/domain/entities/pantry_entry.dart';
import 'package:cookora/features/pantry/data/datasources/pantry_data_source.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_lot.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient.dart';

class PantryDataSourceImpl implements PantryDataSource {
  final FirebaseFirestore _firestore;
  final Uuid _uuid = const Uuid();

  PantryDataSourceImpl(this._firestore);

  String _generateLotId() => _uuid.v4();

  double _calculateTotalQuantity(List<PantryLot> lots) {
    if (lots.isEmpty) return 0.0;
    return lots.fold(0.0, (total, lot) => total + lot.quantity);
  }

  DateTime? _calculateEarliestExpiry(List<PantryLot> lots) {
    final expiryDates = lots
        .where((lot) => lot.expiryDate != null)
        .map((lot) => lot.expiryDate!)
        .toList();

    if (expiryDates.isEmpty) return null;

    expiryDates.sort();
    return expiryDates.first;
  }

  // >> THAY ĐỔI LỚN: Helper để lấy reference đến collection pantry của user <<
  CollectionReference _pantryCollectionRef(String uid) {
    return _firestore.collection('users').doc(uid).collection('pantry');
  }

  @override
  Stream<List<PantryEntry>> getPantryEntries(String uid) {
    return _pantryCollectionRef(uid).snapshots().map((snapshot) {
      if (snapshot.docs.isEmpty) return [];
      return snapshot.docs
          .map(
            (doc) => PantryEntry.fromJson(doc.data() as Map<String, dynamic>),
          )
          .toList();
    });
  }

  @override
  Future<void> addLot({
    required String uid,
    required Ingredient ingredient,
    required PantryLot lot,
  }) async {
    // >> SỬA ĐƯỜNG DẪN <<
    final entryRef = _pantryCollectionRef(uid).doc(ingredient.ingredientId);
    final entryDoc = await entryRef.get();
    final newLot = lot.id.isEmpty ? lot.copyWith(id: _generateLotId()) : lot;

    if (entryDoc.exists) {
      final currentEntry = PantryEntry.fromJson(
        entryDoc.data() as Map<String, dynamic>,
      );
      final updatedLots = [...currentEntry.lots, newLot];
      final updatedEntry = currentEntry.copyWith(
        lots: updatedLots,
        totalQuantity: _calculateTotalQuantity(updatedLots),
        earliestExpiryDate: _calculateEarliestExpiry(updatedLots),
      );
      await entryRef.set(updatedEntry.toJson());
    } else {
      final newEntry = PantryEntry(
        ingredient: ingredient,
        lots: [newLot],
        totalQuantity: newLot.quantity,
        unit: newLot.unit,
        earliestExpiryDate: newLot.expiryDate,
      );
      await entryRef.set(newEntry.toJson());
    }
  }

  @override
  Future<void> addMultipleLots({
    required String uid,
    required List<({Ingredient ingredient, PantryLot lot})> items,
  }) async {
    final batch = _firestore.batch();
    // >> SỬA ĐƯỜNG DẪN <<
    final entriesRef = _pantryCollectionRef(uid);

    final Map<String, List<({Ingredient ingredient, PantryLot lot})>>
    itemsByIngredient = {};
    for (final item in items) {
      (itemsByIngredient[item.ingredient.ingredientId] ??= []).add(item);
    }

    for (final entry in itemsByIngredient.entries) {
      final ingredientId = entry.key;
      final ingredientItems = entry.value;
      final ingredient = ingredientItems.first.ingredient;
      final newLots = ingredientItems
          .map(
            (item) => item.lot.id.isEmpty
                ? item.lot.copyWith(id: _generateLotId())
                : item.lot,
          )
          .toList();

      final entryRef = entriesRef.doc(ingredientId);
      final entryDoc = await entryRef.get(); // Phải get trong batch loop

      if (entryDoc.exists) {
        final currentEntry = PantryEntry.fromJson(
          entryDoc.data() as Map<String, dynamic>,
        );
        final updatedLots = [...currentEntry.lots, ...newLots];

        final updatedEntry = currentEntry.copyWith(
          lots: updatedLots,
          totalQuantity: _calculateTotalQuantity(updatedLots),
          earliestExpiryDate: _calculateEarliestExpiry(updatedLots),
        );
        batch.set(entryRef, updatedEntry.toJson());
      } else {
        final newEntry = PantryEntry(
          ingredient: ingredient,
          lots: newLots,
          totalQuantity: _calculateTotalQuantity(newLots),
          unit: newLots.first.unit,
          earliestExpiryDate: _calculateEarliestExpiry(newLots),
        );
        batch.set(entryRef, newEntry.toJson());
      }
    }

    await batch.commit();
  }

  @override
  Future<void> updateLot({
    required String uid,
    required String ingredientId,
    required PantryLot lot,
  }) async {
    // >> SỬA ĐƯỜNG DẪN <<
    final entryRef = _pantryCollectionRef(uid).doc(ingredientId);
    final entryDoc = await entryRef.get();
    if (!entryDoc.exists) {
      throw Exception('Không tìm thấy nguyên liệu để cập nhật.');
    }

    final currentEntry = PantryEntry.fromJson(
      entryDoc.data() as Map<String, dynamic>,
    );
    final updatedLots = currentEntry.lots
        .map((l) => l.id == lot.id ? lot : l)
        .toList();
    final updatedEntry = currentEntry.copyWith(
      lots: updatedLots,
      totalQuantity: _calculateTotalQuantity(updatedLots),
      earliestExpiryDate: _calculateEarliestExpiry(updatedLots),
    );
    await entryRef.set(updatedEntry.toJson());
  }

  @override
  Future<void> deleteLot({
    required String uid,
    required String ingredientId,
    required String lotId,
  }) async {
    // >> SỬA ĐƯỜNG DẪN <<
    final entryRef = _pantryCollectionRef(uid).doc(ingredientId);
    final entryDoc = await entryRef.get();
    if (!entryDoc.exists) return;

    final currentEntry = PantryEntry.fromJson(
      entryDoc.data() as Map<String, dynamic>,
    );
    final updatedLots = currentEntry.lots
        .where((lot) => lot.id != lotId)
        .toList();

    if (updatedLots.isEmpty) {
      await entryRef.delete();
    } else {
      final updatedEntry = currentEntry.copyWith(
        lots: updatedLots,
        totalQuantity: _calculateTotalQuantity(updatedLots),
        earliestExpiryDate: _calculateEarliestExpiry(updatedLots),
      );
      await entryRef.set(updatedEntry.toJson());
    }
  }

  @override
  Future<void> deleteEntry({
    required String uid,
    required String ingredientId,
  }) async {
    // >> SỬA ĐƯỜNG DẪN <<
    await _pantryCollectionRef(uid).doc(ingredientId).delete();
  }
}
