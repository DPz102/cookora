// lib/features/pantry/presentation/bloc/pantry_bloc.dart
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/exception_handler.dart';

import 'package:cookora/features/user/presentation/bloc/user_bloc.dart';
import 'package:cookora/features/user/domain/entities/user_entity.dart';

import 'package:cookora/features/pantry/domain/entities/pantry_display_entry.dart';
import 'package:cookora/features/pantry/domain/usecases/get_pantry_with_details_usecase.dart';
import 'package:cookora/features/pantry/domain/repositories/pantry_repository.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_event.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_state.dart';

class PantryBloc extends Bloc<PantryEvent, PantryState> {
  final PantryRepository _pantryRepository;
  final UserBloc _userBloc;
  // Thêm UseCase
  final GetPantryWithDetailsUseCase _getPantryWithDetailsUseCase;

  StreamSubscription<List<PantryDisplayEntry>>? _pantrySubscription;

  PantryBloc({
    required PantryRepository pantryRepository,
    required UserBloc userBloc,
    // Thêm UseCase vào constructor
    required GetPantryWithDetailsUseCase getPantryWithDetailsUseCase,
  }) : _pantryRepository = pantryRepository,
       _userBloc = userBloc,
       _getPantryWithDetailsUseCase = getPantryWithDetailsUseCase,
       super(const PantryState()) {
    on<SubscribeToPantry>(_onSubscribeToPantry);
    on<PantryUpdated>(_onPantryUpdated); // Đổi tên event này cho rõ nghĩa
    on<AddLot>(_onAddLot);
    on<UpdateLot>(_onUpdateLot);
    on<DeleteLot>(_onDeleteLot);
    on<DeletePantryEntry>(_onDeletePantryEntry);
    on<ResetMutationStatus>(_onResetMutationStatus);
    on<ClearPantry>(_onClearPantry);
  }

  String? _getCurrentUid() {
    final userState = _userBloc.state.profileStatus;
    return userState is AsyncSuccess<UserEntity> ? userState.data.uid : null;
  }

  void _onSubscribeToPantry(
    SubscribeToPantry event,
    Emitter<PantryState> emit,
  ) {
    emit(state.copyWith(displayEntriesStatus: const AsyncLoading()));
    _pantrySubscription?.cancel();

    // Gọi UseCase ở đây
    _pantrySubscription = _getPantryWithDetailsUseCase(event.uid).listen(
      (displayEntries) =>
          add(PantryUpdated(displayEntries)), // Gửi dữ liệu đã được join
      onError: (e) {
        final eMessage = ExceptionHandler.handle(e).toString();
        emit(state.copyWith(displayEntriesStatus: AsyncFailure(eMessage)));
      },
    );
  }

  // Sửa event handler này
  void _onPantryUpdated(PantryUpdated event, Emitter<PantryState> emit) {
    emit(state.copyWith(displayEntriesStatus: AsyncSuccess(event.entries)));
  }

  // ... (Các hàm xử lý mutation không thay đổi)
  Future<void> _onAddLot(AddLot event, Emitter<PantryState> emit) async {
    final uid = _getCurrentUid();
    if (uid == null) return _emitAuthError(emit);
    await _handleMutation(
      emit,
      () => _pantryRepository.addLot(uid: uid, lot: event.lot),
    );
  }

  Future<void> _onUpdateLot(UpdateLot event, Emitter<PantryState> emit) async {
    final uid = _getCurrentUid();
    if (uid == null) return _emitAuthError(emit);
    await _handleMutation(
      emit,
      () => _pantryRepository.updateLot(uid: uid, lot: event.lot),
    );
  }

  Future<void> _onDeleteLot(DeleteLot event, Emitter<PantryState> emit) async {
    final uid = _getCurrentUid();
    if (uid == null) return _emitAuthError(emit);
    await _handleMutation(
      emit,
      () => _pantryRepository.deleteLot(
        uid: uid,
        ingredientId: event.ingredientId,
        lotId: event.lotId,
      ),
    );
  }

  Future<void> _onDeletePantryEntry(
    DeletePantryEntry event,
    Emitter<PantryState> emit,
  ) async {
    final uid = _getCurrentUid();
    if (uid == null) return _emitAuthError(emit);
    await _handleMutation(
      emit,
      () => _pantryRepository.deletePantryEntry(
        uid: uid,
        ingredientId: event.ingredientId,
      ),
    );
  }

  Future<void> _handleMutation(
    Emitter<PantryState> emit,
    Future<void> Function() action,
  ) async {
    emit(state.copyWith(mutationStatus: const AsyncLoading()));
    try {
      await action();
      emit(state.copyWith(mutationStatus: const AsyncSuccess(null)));
    } catch (e) {
      final eMessage = ExceptionHandler.handle(e).toString();
      emit(state.copyWith(mutationStatus: AsyncFailure(eMessage)));
    }
  }

  void _emitAuthError(Emitter<PantryState> emit) {
    final eMessage = 'Lỗi: Không tìm thấy thông tin người dùng.';
    emit(state.copyWith(mutationStatus: AsyncFailure(eMessage)));
  }

  void _onResetMutationStatus(
    ResetMutationStatus event,
    Emitter<PantryState> emit,
  ) {
    emit(state.copyWith(mutationStatus: const AsyncInitial()));
  }

  void _onClearPantry(ClearPantry event, Emitter<PantryState> emit) {
    _pantrySubscription?.cancel();
    emit(const PantryState());
  }

  @override
  Future<void> close() {
    _pantrySubscription?.cancel();
    return super.close();
  }
}
