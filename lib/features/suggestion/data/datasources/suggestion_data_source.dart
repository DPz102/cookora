import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';

abstract class SuggestionDataSource {
  Future<List<RecipeEntity>> getRecipes({
    required List<String> pantryIngredientIds,
  });
}
