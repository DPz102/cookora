import 'package:cookora/features/suggestion/data/datasources/suggestion_data_source.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient_entity.dart';
import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';
import 'package:cookora/features/suggestion/domain/repositories/suggestion_repository.dart';

class SuggestionRepositoryImpl implements SuggestionRepository {
  final SuggestionDataSource _dataSource;

  SuggestionRepositoryImpl(this._dataSource);

  @override
  Future<List<RecipeEntity>> getSuggestedRecipes(
    List<IngredientEntity> pantryIngredients,
  ) async {
    final pantryIngredientNames = pantryIngredients
        .map((ingredient) => ingredient.name.toLowerCase())
        .toSet();

    // 1. Lấy danh sách công thức đã được lọc sơ bộ từ server
    final getRecipes = await _dataSource.getRecipes(
      pantryIngredientNames: pantryIngredientNames.toList(),
    );

    // 2. Kiểm tra công thức
    final List<Map<String, dynamic>> scoredRecipes = [];

    for (final recipe in getRecipes) {
      // Điều kiện cần: Đủ tất cả nguyên liệu bắc buộc
      final hasAllRequired = recipe.requiredIngredients.every(
        (req) => pantryIngredientNames.contains(req.toLowerCase()),
      );

      // Nếu không đủ, bỏ qua công thức này
      if (!hasAllRequired) continue;

      // Tính điểm phù hợp: Nếu đã đủ điều kiện cần (Mỗi cái 10 điểm)
      int score = 0;
      score += recipe.requiredIngredients.length * 10;

      // Cộng điểm cho mỗi nguyên liệu tùy chọn có sẵn (Mỗi cái 3 điểm)
      for (final opt in recipe.optionalIngredients) {
        if (pantryIngredientNames.contains(opt.toLowerCase())) {
          score += 3;
        }
      }
      scoredRecipes.add({'recipe': recipe, 'score': score});
    }

    // 4. Sắp xếp công thức theo điểm từ cao đến thấp
    scoredRecipes.sort(
      (a, b) => (b['score'] as int).compareTo(a['score'] as int),
    );

    // 5. Trả về danh sách Entity đã được sắp xếp thông minh
    return scoredRecipes.map((e) => e['recipe'] as RecipeEntity).toList();
  }
}
