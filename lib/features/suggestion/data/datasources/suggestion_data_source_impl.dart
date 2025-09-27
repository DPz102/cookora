import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cookora/features/suggestion/data/datasources/suggestion_data_source.dart';
import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';

class SuggestionDataSourceImpl implements SuggestionDataSource {
  final FirebaseFirestore _firestore;

  SuggestionDataSourceImpl({required FirebaseFirestore firestore})
    : _firestore = firestore;

  @override
  Future<List<RecipeEntity>> getRecipes({
    required List<String> pantryIngredientNames,
  }) async {
    // Nếu trong kho không có nguyên liệu, không cần query, trả về list rỗng
    if (pantryIngredientNames.isEmpty) {
      return [];
    }

    try {
      // Lấy tất cả công thức từ Firestore.
      final snapshot = await _firestore.collection('recipes').get();

      if (snapshot.docs.isEmpty) {
        return [];
      }

      // Chuyển đổi tất cả document thành RecipeEntity.
      final allRecipes = snapshot.docs
          .map((doc) => RecipeEntity.fromJson(doc.data()))
          .toList();

      // Lọc kết quả ở client để tìm công thức phù hợp.
      // Chuyển danh sách nguyên liệu trong kho thành một Set để kiểm tra hiệu quả hơn.
      final pantrySet = Set<String>.from(pantryIngredientNames);

      // Lọc ra những công thức mà tất cả nguyên liệu bắc buộc đều có trong kho.
      final suitableRecipes = allRecipes.where((recipe) {
        if (recipe.requiredIngredients.isEmpty) {
          return false; // Bỏ qua công thức không có nguyên liệu bắc buộc
        }
        return recipe.requiredIngredients.every(
          (ingredient) => pantrySet.contains(ingredient),
        );
      }).toList();

      return suitableRecipes;
    } catch (e) {
      rethrow;
    }
  }
}
