import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';

part 'kitchen_log_state.freezed.dart';

@freezed
abstract class KitchenLogState with _$KitchenLogState {
  const factory KitchenLogState({
    @Default(AsyncInitial()) AsyncState<List<RecipeEntity>> logStatus,
  }) = _KitchenLogState;
}
