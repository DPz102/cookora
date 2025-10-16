// lib/features/pantry/presentation/bloc/pantry_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cookora/core/utils/async_state.dart';
// Import model mới
import 'package:cookora/features/pantry/domain/entities/pantry_display_entry.dart';

part 'pantry_state.freezed.dart';

@freezed
abstract class PantryState with _$PantryState {
  const factory PantryState({
    // Thay đổi kiểu dữ liệu ở đây
    @Default(AsyncInitial())
    AsyncState<List<PantryDisplayEntry>> displayEntriesStatus,

    // Giữ nguyên mutationStatus
    @Default(AsyncInitial()) AsyncState<void> mutationStatus,
  }) = _PantryState;
}
