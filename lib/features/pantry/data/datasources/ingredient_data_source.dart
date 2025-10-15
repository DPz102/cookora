// lib/features/pantry/data/datasources/ingredient_data_source.dart
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IngredientDataSource {
  Future<QuerySnapshot<Map<String, dynamic>>> getAllIngredients();
}

class IngredientDataSourceImpl implements IngredientDataSource {
  final FirebaseFirestore _firestore;

  IngredientDataSourceImpl(this._firestore);

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getAllIngredients() {
    return _firestore.collection('ingredients').get();
  }
}
