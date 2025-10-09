import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:cookora/features/pantry/domain/repositories/pantry_repository.dart';
import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';
import 'package:cookora/features/suggestion/domain/repositories/suggestion_repository.dart';

class GetSuggestionsUsecase {
  final PantryRepository _pantryRepository;
  final SuggestionRepository _suggestionRepository;

  GetSuggestionsUsecase({
    required PantryRepository pantryRepository,
    required SuggestionRepository suggestionRepository,
  }) : _pantryRepository = pantryRepository,
       _suggestionRepository = suggestionRepository;

  Stream<List<RecipeEntity>> call({required String uid}) {
    return _pantryRepository.getPantryIngredients(uid).switchMap((ingredients) {
      return Stream.fromFuture(
        _suggestionRepository.getSuggestedRecipes(ingredients),
      );
    });
  }
}
