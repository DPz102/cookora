import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';

abstract class KitchenLogRepository {
  Stream<List<RecipeEntity>> getKitchenLogStream({required String uid});
  Future<void> addRecipeToLog({
    required String uid,
    required RecipeEntity recipe,
  });
}
