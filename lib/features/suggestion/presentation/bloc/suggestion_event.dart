import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';

part 'suggestion_event.freezed.dart';

@freezed
abstract class SuggestionEvent with _$SuggestionEvent {
  const factory SuggestionEvent.subscribeToSuggestions({required String uid}) =
      SubscribeToSuggestions;

  const factory SuggestionEvent.suggestionsReceived({
    required List<RecipeEntity> recipes,
  }) = SuggestionsReceived;

  const factory SuggestionEvent.clearSuggestions() = ClearSuggestions;
}
