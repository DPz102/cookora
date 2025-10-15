// lib/features/pantry/domain/repositories/ingredient_repository.dart
import 'package:cookora/features/pantry/data/datasources/ingredient_data_source.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient.dart';

abstract class IngredientRepository {
  Future<List<Ingredient>> getAllIngredients();
}

class IngredientRepositoryImpl implements IngredientRepository {
  final IngredientDataSource _dataSource;

  IngredientRepositoryImpl(this._dataSource);

  @override
  Future<List<Ingredient>> getAllIngredients() async {
    try {
      final snapshot = await _dataSource.getAllIngredients();
      if (snapshot.docs.isEmpty) {
        return [];
      }
      return snapshot.docs
          .map(
            (doc) =>
                Ingredient.fromJson(doc.data()).copyWith(ingredientId: doc.id),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
