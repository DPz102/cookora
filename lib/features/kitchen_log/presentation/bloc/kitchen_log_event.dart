import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';

part 'kitchen_log_event.freezed.dart';

@freezed
abstract class KitchenLogEvent with _$KitchenLogEvent {
  const factory KitchenLogEvent.subscribeToKitchenLog({required String uid}) =
      SubscribeToKitchenLog;

  const factory KitchenLogEvent.addRecipeToLog({required RecipeEntity recipe}) =
      AddRecipeToLog;

  const factory KitchenLogEvent.kitchenLogUpdated({
    required List<RecipeEntity> recipes,
  }) = KitchenLogUpdated;

  const factory KitchenLogEvent.clearLog() = ClearLog;
}
