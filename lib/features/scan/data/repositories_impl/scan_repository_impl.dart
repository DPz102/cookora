import 'dart:io';

import 'package:cookora/features/scan/data/datasources/scan_data_source.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient_entity.dart';
import 'package:cookora/features/scan/domain/entities/scan_result.dart';
import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';
import 'package:cookora/features/scan/domain/repositories/scan_repository.dart';

class ScanRepositoryImpl implements ScanRepository {
  final ScanDataSource _dataSource;

  ScanRepositoryImpl({required ScanDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<ScanResult> recognizeFromImage({
    required File imageFile,
    required bool isDishScan,
  }) async {
    try {
      if (isDishScan) {
        final resultData = await _dataSource.recognizeDishFromImage(imageFile);
        final recipe = RecipeEntity.fromJson(resultData);
        return ScanResult.dish(recipe: recipe);
      } else {
        final ingredientData = await _dataSource.recognizeIngredientsFromImage(
          imageFile,
        );
        final ingredients = ingredientData
            .map((data) => IngredientEntity.fromJson(data))
            .toList();
        return ScanResult.ingredients(results: ingredients);
      }
    } catch (e) {
      rethrow;
    }
  }
}
