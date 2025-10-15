// lib/features/suggestion/domain/repositories/suggestion_repository.dart
import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';

abstract class SuggestionRepository {
  Future<List<RecipeEntity>> getSuggestedRecipes(
    List<String> pantryIngredientIds,
  );
}
