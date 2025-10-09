import 'package:cookora/features/pantry/domain/entities/ingredient_entity.dart';
import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';

abstract class SuggestionRepository {
  Future<List<RecipeEntity>> getSuggestedRecipes(
    List<IngredientEntity> pantryIngredients,
  );
}
