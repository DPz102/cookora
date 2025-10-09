import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient_entity.dart';

abstract class PantryDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getPantryStream(String uid);

  Future<void> addIngredient({
    required String uid,
    required IngredientEntity ingredient,
  });

  Future<void> updateIngredient(IngredientEntity ingredient);

  Future<void> deleteIngredient({
    required String uid,
    required String ingredientId,
  });
}
