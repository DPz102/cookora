import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient_entity.dart';
import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';

part 'scan_result.freezed.dart';

@freezed
abstract class ScanResult with _$ScanResult {
  // Kết quả khi quét thành công một món ăn.
  const factory ScanResult.dish({required RecipeEntity recipe}) =
      DishScanResult;

  // Kết quả khi quét thành công các nguyên liệu.
  const factory ScanResult.ingredients({
    required List<IngredientEntity> results,
  }) = IngredientsScanResults;
}
