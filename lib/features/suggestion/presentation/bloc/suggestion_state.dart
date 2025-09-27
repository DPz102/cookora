import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:cookora/core/utils/async_state.dart';

import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';

part 'suggestion_state.freezed.dart';

@freezed
abstract class SuggestionState with _$SuggestionState {
  const factory SuggestionState({
    // Theo dõi trạng thái của danh sách gợi ý món ăn.
    @Default(AsyncInitial()) AsyncState<List<RecipeEntity>> suggestionsStatus,
  }) = _SuggestionState;
}
