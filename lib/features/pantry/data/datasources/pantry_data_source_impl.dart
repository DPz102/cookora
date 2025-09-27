import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cookora/features/pantry/data/datasources/pantry_data_source.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient_entity.dart';

class PantryDataSourceImpl implements PantryDataSource {
  final FirebaseFirestore _firestore;

  PantryDataSourceImpl(this._firestore);

  CollectionReference<Map<String, dynamic>> _getUserPantryCollection(
    String uid,
  ) {
    return _firestore.collection('users').doc(uid).collection('pantry');
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getPantryStream(String uid) {
    return _getUserPantryCollection(uid).snapshots();
  }

  @override
  Future<void> addIngredient({
    required String uid,
    required IngredientEntity ingredient,
  }) {
    // 1. Tự tạo một document rỗng để lấy ID.
    final docRef = _getUserPantryCollection(uid).doc();

    // 2. Ghi đè id và uid vào entity trước khi set
    return docRef.set(ingredient.copyWith(id: docRef.id, uid: uid).toJson());
  }

  @override
  Future<void> updateIngredient(IngredientEntity ingredient) {
    return _getUserPantryCollection(
      ingredient.uid,
    ).doc(ingredient.id).update(ingredient.toJson());
  }

  @override
  Future<void> deleteIngredient({
    required String uid,
    required String ingredientId,
  }) {
    return _getUserPantryCollection(uid).doc(ingredientId).delete();
  }
}
