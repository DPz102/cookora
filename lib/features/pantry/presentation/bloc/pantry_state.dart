// lib/features/pantry/presentation/bloc/pantry_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_entry.dart';

part 'pantry_state.freezed.dart';

@freezed
abstract class PantryState with _$PantryState {
  const factory PantryState({
    // Theo dõi trạng thái của danh sách các mục trong kho (PantryEntry).
    @Default(AsyncInitial()) AsyncState<List<PantryEntry>> entriesStatus,

    // Theo dõi trạng thái của các hành động (thêm, sửa, xóa).
    @Default(AsyncInitial()) AsyncState<void> mutationStatus,
  }) = _PantryState;
}
