// lib/features/pantry/domain/usecases/get_pantry_with_details_usecase.dart
import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:cookora/features/pantry/domain/entities/pantry_display_entry.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient.dart';
import 'package:cookora/features/pantry/domain/repositories/ingredient_repository.dart';
import 'package:cookora/features/pantry/domain/repositories/pantry_repository.dart';

class GetPantryWithDetailsUseCase {
  final PantryRepository _pantryRepository;
  final IngredientRepository _ingredientRepository;

  GetPantryWithDetailsUseCase({
    required PantryRepository pantryRepository,
    required IngredientRepository ingredientRepository,
  }) : _pantryRepository = pantryRepository,
       _ingredientRepository = ingredientRepository;

  Stream<List<PantryDisplayEntry>> call(String uid) {
    return _pantryRepository.getPantryEntries(uid).switchMap((pantryEntries) {
      if (pantryEntries.isEmpty) {
        return Stream.value([]);
      }

      final ingredientIds = pantryEntries
          .map((e) => e.ingredientId)
          .toSet()
          .toList();

      return _ingredientRepository
          .getIngredientsByIds(ingredientIds)
          .asStream()
          .map((ingredients) {
            final ingredientsMap = {
              for (var ingredient in ingredients)
                ingredient.ingredientId: ingredient,
            };

            return pantryEntries.map((entry) {
              final ingredientInfo = ingredientsMap[entry.ingredientId];
              // Nếu không tìm thấy thông tin (dữ liệu không đồng bộ),
              // tạo một object tạm để tránh lỗi UI
              final safeIngredientInfo =
                  ingredientInfo ??
                  Ingredient(
                    ingredientId: entry.ingredientId,
                    name: 'Đang tải...',
                  );

              return PantryDisplayEntry(
                entry: entry,
                ingredientInfo: safeIngredientInfo,
              );
            }).toList();
          });
    });
  }
}
