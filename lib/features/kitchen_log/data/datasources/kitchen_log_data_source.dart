import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';

abstract class KitchenLogDataSource {
  Stream<List<RecipeEntity>> getKitchenLogStream(String uid);
  Future<void> addRecipeToLog(String uid, RecipeEntity recipe);
}
