import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';
import 'package:cookora/features/kitchen_log/data/datasources/kitchen_log_data_source.dart';
import 'package:cookora/features/kitchen_log/domain/repository/kitchen_log_repository.dart';

class KitchenLogRepositoryImpl implements KitchenLogRepository {
  final KitchenLogDataSource _dataSource;
  KitchenLogRepositoryImpl({required KitchenLogDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Stream<List<RecipeEntity>> getKitchenLogStream({required String uid}) {
    return _dataSource.getKitchenLogStream(uid);
  }

  @override
  Future<void> addRecipeToLog({
    required String uid,
    required RecipeEntity recipe,
  }) async {
    try {
      await _dataSource.addRecipeToLog(uid, recipe);
    } catch (e) {
      rethrow;
    }
  }
}
