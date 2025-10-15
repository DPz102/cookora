// lib/features/scan/domain/entities/scan_result.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient.dart'; // THAY ĐỔI
import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';

part 'scan_result.freezed.dart';

@freezed
abstract class ScanResult with _$ScanResult {
  const factory ScanResult.dish({required RecipeEntity recipe}) =
      DishScanResult;

  // Sẽ trả về danh sách các Ingredient mà AI nhận diện được
  const factory ScanResult.ingredients({
    required List<Ingredient> results, // THAY ĐỔI
  }) = IngredientsScanResults;
}
