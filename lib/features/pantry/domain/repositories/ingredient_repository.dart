// lib/features/pantry/domain/repositories/ingredient_repository.dart
import 'package:cookora/features/pantry/data/datasources/ingredient_data_source.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient.dart';

abstract class IngredientRepository {
  // Thay thế hàm cũ bằng hàm mới này
  Future<List<Ingredient>> getIngredientsByIds(List<String> ids);
}

class IngredientRepositoryImpl implements IngredientRepository {
  final IngredientDataSource _dataSource;

  IngredientRepositoryImpl(this._dataSource);

  @override
  Future<List<Ingredient>> getIngredientsByIds(List<String> ids) async {
    // Tránh gọi query rỗng tới Firestore
    if (ids.isEmpty) {
      return [];
    }
    try {
      final snapshot = await _dataSource.getIngredientsByIds(ids);
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
