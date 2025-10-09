import 'package:cookora/features/pantry/domain/entities/ingredient_entity.dart';

abstract class PantryRepository {
  // Lấy một stream chứa danh sách nguyên liệu của người dùng hiện tại.
  Stream<List<IngredientEntity>> getPantryIngredients(String uid);

  // Thêm một nguyên liệu mới.
  Future<void> addIngredient({
    required String uid,
    required IngredientEntity ingredient,
  });

  // Cập nhật một nguyên liệu đã có.
  Future<void> updateIngredient(IngredientEntity ingredient);

  // Xóa một nguyên liệu.
  Future<void> deleteIngredient({
    required String uid,
    required String ingredientId,
  });
}
