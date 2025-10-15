// lib/features/suggestion/domain/usecases/get_suggestions_usecase.dart
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
    // Lấy danh sách PantryEntry từ kho
    return _pantryRepository.getPantryEntries(uid).switchMap((entries) {
      // Trích xuất danh sách các ingredientId mà người dùng có
      final ingredientIds = entries.map((entry) => entry.ingredientId).toList();
      if (ingredientIds.isEmpty) {
        return Stream.value([]);
      }
      // Gọi repository gợi ý với danh sách ID này
      return Stream.fromFuture(
        _suggestionRepository.getSuggestedRecipes(ingredientIds),
      );
    });
  }
}
