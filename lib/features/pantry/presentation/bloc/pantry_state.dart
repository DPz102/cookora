// lib/features/pantry/presentation/bloc/pantry_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_entry.dart';

part 'pantry_state.freezed.dart';

@freezed
abstract class PantryState with _$PantryState {
  const factory PantryState({
    /// Quản lý trạng thái tải danh sách entries từ Firestore.
    @Default(AsyncInitial()) AsyncState<List<PantryEntry>> entriesStatus,

    /// Quản lý trạng thái của các hành động CUD (Create, Update, Delete).
    @Default(AsyncInitial()) AsyncState<void> mutationStatus,
  }) = _PantryState;
}
