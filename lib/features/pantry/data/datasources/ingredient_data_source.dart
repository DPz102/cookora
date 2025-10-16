// lib/features/pantry/data/datasources/ingredient_data_source.dart
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IngredientDataSource {
  // Thay thế hàm cũ
  Future<QuerySnapshot<Map<String, dynamic>>> getIngredientsByIds(
    List<String> ids,
  );
}

class IngredientDataSourceImpl implements IngredientDataSource {
  final FirebaseFirestore _firestore;

  IngredientDataSourceImpl(this._firestore);

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getIngredientsByIds(
    List<String> ids,
  ) {
    // Sử dụng query "whereIn" để lấy nhiều document bằng ID
    return _firestore
        .collection('ingredients')
        .where(FieldPath.documentId, whereIn: ids)
        .get();
  }
}
