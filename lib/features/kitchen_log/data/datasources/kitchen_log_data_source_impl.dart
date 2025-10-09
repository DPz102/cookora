import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cookora/features/kitchen_log/data/datasources/kitchen_log_data_source.dart';
import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';

class KitchenLogDataSourceImpl implements KitchenLogDataSource {
  final FirebaseFirestore _firestore;
  KitchenLogDataSourceImpl(this._firestore);

  @override
  Stream<List<RecipeEntity>> getKitchenLogStream(String uid) {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("kitchen_log")
        .orderBy('createdAt', descending: true)
        .limit(10)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => RecipeEntity.fromJson(doc.data()))
              .toList(),
        );
  }

  @override
  Future<void> addRecipeToLog(String uid, RecipeEntity recipe) async {
    try {
      final recipeWithTimestamp = recipe.copyWith(createdAt: DateTime.now());
      await _firestore
          .collection("users")
          .doc(uid)
          .collection("kitchen_log")
          .doc(recipe.id)
          .set(recipeWithTimestamp.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
