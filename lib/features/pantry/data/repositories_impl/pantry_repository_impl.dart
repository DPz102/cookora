// lib/features/pantry/data/repositories_impl/pantry_repository_impl.dart
import 'package:cookora/features/pantry/data/datasources/pantry_data_source.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_entry.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_lot.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient.dart';
import 'package:cookora/features/pantry/domain/repositories/pantry_repository.dart';

class PantryRepositoryImpl implements PantryRepository {
  final PantryDataSource _dataSource;

  PantryRepositoryImpl(this._dataSource);

  @override
  Stream<List<PantryEntry>> getPantryEntries(String uid) {
    return _dataSource.getPantryEntries(uid);
  }

  @override
  Future<void> addLot({
    required String uid,
    required Ingredient ingredient,
    required PantryLot lot,
  }) {
    return _dataSource.addLot(uid: uid, ingredient: ingredient, lot: lot);
  }

  @override
  Future<void> addMultipleLots({
    required String uid,
    required List<({Ingredient ingredient, PantryLot lot})> items,
  }) {
    return _dataSource.addMultipleLots(uid: uid, items: items);
  }

  @override
  Future<void> updateLot({
    required String uid,
    required String ingredientId,
    required PantryLot lot,
  }) {
    return _dataSource.updateLot(
      uid: uid,
      ingredientId: ingredientId,
      lot: lot,
    );
  }

  @override
  Future<void> deleteLot({
    required String uid,
    required String ingredientId,
    required String lotId,
  }) {
    return _dataSource.deleteLot(
      uid: uid,
      ingredientId: ingredientId,
      lotId: lotId,
    );
  }

  @override
  Future<void> deleteEntry({
    required String uid,
    required String ingredientId,
  }) {
    return _dataSource.deleteEntry(uid: uid, ingredientId: ingredientId);
  }
}
