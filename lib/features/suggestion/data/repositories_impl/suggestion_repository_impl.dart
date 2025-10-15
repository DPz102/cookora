// lib/features/suggestion/data/repositories_impl/suggestion_repository_impl.dart
import 'package:cookora/features/suggestion/data/datasources/suggestion_data_source.dart';
import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';
import 'package:cookora/features/suggestion/domain/repositories/suggestion_repository.dart';

class SuggestionRepositoryImpl implements SuggestionRepository {
  final SuggestionDataSource _dataSource;

  SuggestionRepositoryImpl(this._dataSource);

  @override
  Future<List<RecipeEntity>> getSuggestedRecipes(
    List<String> pantryIngredientIds,
  ) async {
    // Chuyển danh sách ID thành một Set để tra cứu nhanh hơn O(1)
    final pantryIngredientIdSet = pantryIngredientIds.toSet();

    // 1. Lấy danh sách công thức có thể nấu từ server
    final candidateRecipes = await _dataSource.getRecipes(
      pantryIngredientIds: pantryIngredientIds,
    );

    // 2. Tính điểm và sắp xếp ở client
    final List<Map<String, dynamic>> scoredRecipes = [];

    for (final recipe in candidateRecipes) {
      // Điều kiện cần: Đủ tất cả nguyên liệu bắt buộc
      final hasAllRequired = recipe.requiredIngredients.every(
        (reqId) => pantryIngredientIdSet.contains(reqId),
      );
      if (!hasAllRequired) continue;

      // Tính điểm
      int score = recipe.requiredIngredients.length * 10;
      for (final optId in recipe.optionalIngredients) {
        if (pantryIngredientIdSet.contains(optId)) {
          score += 3;
        }
      }
      scoredRecipes.add({'recipe': recipe, 'score': score});
    }

    // 3. Sắp xếp theo điểm từ cao đến thấp
    scoredRecipes.sort(
      (a, b) => (b['score'] as int).compareTo(a['score'] as int),
    );

    return scoredRecipes.map((e) => e['recipe'] as RecipeEntity).toList();
  }
}
