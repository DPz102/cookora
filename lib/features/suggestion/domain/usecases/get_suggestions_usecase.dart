// lib/features/suggestion/domain/usecases/get_suggestions_usecase.dart
import 'dart:async';
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

  Stream<List<RecipeEntity>> call({required String uid}) async* {
    // Lấy danh sách PantryEntry từ kho
    await for (final entries in _pantryRepository.getPantryEntries(uid)) {
      // Trích xuất danh sách các ingredientId mà người dùng có
      final ingredientIds = entries
          .map((entry) => entry.ingredient.ingredientId)
          .toList();
      if (ingredientIds.isEmpty) {
        yield [];
      } else {
        // Gọi repository gợi ý với danh sách ID này
        yield await _suggestionRepository.getSuggestedRecipes(ingredientIds);
      }
    }
  }
}
