import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient_entity.dart';

part 'pantry_event.freezed.dart';

@freezed
abstract class PantryEvent with _$PantryEvent {
  // Bắt đầu lắng nghe stream nguyên liệu từ Firestore.
  const factory PantryEvent.subscribeToPantry({required String uid}) =
      SubscribeToPantry;

  // Thêm một nguyên liệu mới.
  const factory PantryEvent.addIngredient({
    required IngredientEntity ingredient,
  }) = AddIngredient;

  // Cập nhật một nguyên liệu.
  const factory PantryEvent.updateIngredient(IngredientEntity ingredient) =
      UpdateIngredient;

  // Xóa một nguyên liệu.
  const factory PantryEvent.deleteIngredient(String ingredientId) =
      DeleteIngredient;

  // Event nội bộ để đẩy dữ liệu mới từ stream vào state.
  const factory PantryEvent.pantryStreamUpdated(
    List<IngredientEntity> ingredients,
  ) = PantryStreamUpdated;

  // Event để reset trạng thái mutation, tránh listener bị gọi lại
  const factory PantryEvent.resetMutationStatus() = ResetMutationStatus;

  // Event reset bloc
  const factory PantryEvent.clearPantry() = ClearPantry;
}
