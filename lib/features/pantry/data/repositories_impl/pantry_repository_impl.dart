// lib/features/pantry/data/repositories_impl/pantry_repository_impl.dart
import 'package:cookora/features/pantry/data/datasources/pantry_data_source.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_entry.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_lot.dart';
import 'package:cookora/features/pantry/domain/repositories/pantry_repository.dart';

class PantryRepositoryImpl implements PantryRepository {
  final PantryDataSource _dataSource;

  PantryRepositoryImpl(this._dataSource);

  @override
  Stream<List<PantryEntry>> getPantryEntries(String uid) {
    return _dataSource.getPantryStream(uid).map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return PantryEntry.fromJson(doc.data()).copyWith(ingredientId: doc.id);
      }).toList();
    });
  }

  @override
  Future<void> addLot({required String uid, required PantryLot lot}) {
    return _dataSource.addLot(uid: uid, newLot: lot);
  }

  @override
  Future<void> updateLot({required String uid, required PantryLot lot}) {
    return _dataSource.updateLot(uid: uid, updatedLot: lot);
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
  Future<void> deletePantryEntry({
    required String uid,
    required String ingredientId,
  }) {
    return _dataSource.deletePantryEntry(uid: uid, ingredientId: ingredientId);
  }
}
