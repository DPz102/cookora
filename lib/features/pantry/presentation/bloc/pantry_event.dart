// lib/features/pantry/presentation/bloc/pantry_event.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_entry.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_lot.dart';

part 'pantry_event.freezed.dart';

@freezed
abstract class PantryEvent with _$PantryEvent {
  // Bắt đầu lắng nghe stream pantry từ Firestore.
  const factory PantryEvent.subscribeToPantry({required String uid}) =
      SubscribeToPantry;

  // Thêm một lô mới.
  const factory PantryEvent.addLot({required PantryLot lot}) = AddLot;

  // Cập nhật một lô.
  const factory PantryEvent.updateLot({required PantryLot lot}) = UpdateLot;

  // Xóa một lô.
  const factory PantryEvent.deleteLot({
    required String ingredientId,
    required String lotId,
  }) = DeleteLot;

  // Xóa toàn bộ một nguyên liệu (entry).
  const factory PantryEvent.deletePantryEntry({required String ingredientId}) =
      DeletePantryEntry;

  // Event nội bộ để đẩy dữ liệu mới từ stream vào state.
  const factory PantryEvent.pantryUpdated(List<PantryEntry> entries) =
      PantryUpdated;

  // Event để reset trạng thái mutation (loading/error/success).
  const factory PantryEvent.resetMutationStatus() = ResetMutationStatus;

  // Event reset toàn bộ bloc khi đăng xuất.
  const factory PantryEvent.clearPantry() = ClearPantry;
}
