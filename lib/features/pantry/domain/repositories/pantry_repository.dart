// lib/features/pantry/domain/repositories/pantry_repository.dart
import 'package:cookora/features/pantry/domain/entities/pantry_entry.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_lot.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient.dart';

abstract class PantryRepository {
  /// Lấy stream danh sách các entry trong kho của người dùng.
  Stream<List<PantryEntry>> getPantryEntries(String uid);

  /// Thêm một lot mới vào một entry.
  Future<void> addLot({
    required String uid,
    required Ingredient ingredient,
    required PantryLot lot,
  });

  /// Thêm nhiều lots cùng lúc.
  Future<void> addMultipleLots({
    required String uid,
    required List<({Ingredient ingredient, PantryLot lot})> items,
  });

  /// Cập nhật một lot đã tồn tại.
  Future<void> updateLot({
    required String uid,
    required String ingredientId,
    required PantryLot lot,
  });

  /// Xóa một lot khỏi một entry.
  Future<void> deleteLot({
    required String uid,
    required String ingredientId,
    required String lotId,
  });

  /// Xóa toàn bộ một entry.
  Future<void> deleteEntry({required String uid, required String ingredientId});
}
