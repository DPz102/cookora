import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:cookora/core/utils/async_state.dart';

import 'package:cookora/features/pantry/domain/entities/ingredient_entity.dart';

part 'pantry_state.freezed.dart';

@freezed
abstract class PantryState with _$PantryState {
  const factory PantryState({
    // Theo dõi trạng thái của danh sách nguyên liệu (loading, success, failure).
    @Default(AsyncInitial())
    AsyncState<List<IngredientEntity>> ingredientsStatus,

    // Theo dõi trạng thái của các hành động (thêm, sửa xóa)
    @Default(AsyncInitial()) AsyncState<void> mutationStatus,
  }) = _PantryState;
}
