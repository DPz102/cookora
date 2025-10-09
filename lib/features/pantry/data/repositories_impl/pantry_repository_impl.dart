import 'package:cookora/features/pantry/data/datasources/pantry_data_source.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient_entity.dart';
import 'package:cookora/features/pantry/domain/repositories/pantry_repository.dart';

class PantryRepositoryImpl implements PantryRepository {
  final PantryDataSource _dataSource;

  PantryRepositoryImpl(this._dataSource);

  @override
  Stream<List<IngredientEntity>> getPantryIngredients(String uid) {
    return _dataSource.getPantryStream(uid).map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return IngredientEntity.fromJson(doc.data()).copyWith(id: doc.id);
      }).toList();
    });
  }

  @override
  Future<void> addIngredient({
    required String uid,
    required IngredientEntity ingredient,
  }) {
    return _dataSource.addIngredient(uid: uid, ingredient: ingredient);
  }

  @override
  Future<void> updateIngredient(IngredientEntity ingredient) {
    return _dataSource.updateIngredient(ingredient);
  }

  @override
  Future<void> deleteIngredient({
    required String uid,
    required String ingredientId,
  }) {
    return _dataSource.deleteIngredient(uid: uid, ingredientId: ingredientId);
  }
}
