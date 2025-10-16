// lib/features/pantry/presentation/bloc/pantry_bloc.dart
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/exception_handler.dart';
import 'package:cookora/features/user/presentation/bloc/user_bloc.dart';
import 'package:cookora/features/user/domain/entities/user_entity.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_entry.dart';
import 'package:cookora/features/pantry/domain/entities/pantry_lot.dart';
import 'package:cookora/features/pantry/domain/repositories/pantry_repository.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_event.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_state.dart';

class PantryBloc extends Bloc<PantryEvent, PantryState> {
  final PantryRepository _pantryRepository;
  final UserBloc _userBloc;

  StreamSubscription<List<PantryEntry>>? _pantrySubscription;

  PantryBloc({
    required PantryRepository pantryRepository,
    required UserBloc userBloc,
  }) : _pantryRepository = pantryRepository,
       _userBloc = userBloc,
       super(const PantryState()) {
    on<SubscribeToPantry>(_onSubscribeToPantry);
    on<PantryUpdated>(_onPantryUpdated);
    on<AddLot>(_onAddLot);
    on<AddMultipleLots>(_onAddMultipleLots);
    on<UpdateLot>(_onUpdateLot);
    on<DeleteLot>(_onDeleteLot);
    on<DeleteEntry>(_onDeleteEntry);
    on<ResetMutationStatus>(_onResetMutationStatus);
    on<ClearPantry>(_onClearPantry);
  }

  String? get _currentUserId {
    final userState = _userBloc.state.profileStatus;
    return userState is AsyncSuccess<UserEntity> ? userState.data.uid : null;
  }

  void _onSubscribeToPantry(
    SubscribeToPantry event,
    Emitter<PantryState> emit,
  ) {
    emit(state.copyWith(entriesStatus: const AsyncLoading()));
    _pantrySubscription?.cancel();
    _pantrySubscription = _pantryRepository
        .getPantryEntries(event.uid)
        .listen(
          (entries) => add(PantryUpdated(entries)),
          onError: (error) {
            final errorMessage = ExceptionHandler.handle(error).toString();
            emit(state.copyWith(entriesStatus: AsyncFailure(errorMessage)));
          },
        );
  }

  void _onPantryUpdated(PantryUpdated event, Emitter<PantryState> emit) {
    emit(state.copyWith(entriesStatus: AsyncSuccess(event.entries)));
  }

  Future<void> _handleMutation(
    Emitter<PantryState> emit,
    Future<void> Function() mutation,
  ) async {
    final uid = _currentUserId;
    if (uid == null) {
      emit(
        state.copyWith(
          mutationStatus: const AsyncFailure('Người dùng chưa đăng nhập.'),
        ),
      );
      return;
    }
    emit(state.copyWith(mutationStatus: const AsyncLoading()));
    try {
      await mutation();
      emit(state.copyWith(mutationStatus: const AsyncSuccess(null)));
    } catch (e) {
      final errorMessage = ExceptionHandler.handle(e).toString();
      emit(state.copyWith(mutationStatus: AsyncFailure(errorMessage)));
    }
  }

  Future<void> _onAddLot(AddLot event, Emitter<PantryState> emit) async {
    final newLot = PantryLot.fromJson(event.lotData);

    await _handleMutation(
      emit,
      () => _pantryRepository.addLot(
        uid: _currentUserId!,
        ingredient: event.ingredient,
        lot: newLot,
      ),
    );
  }

  Future<void> _onAddMultipleLots(
    AddMultipleLots event,
    Emitter<PantryState> emit,
  ) async {
    final itemsWithEntities = event.items.map((item) {
      return (
        ingredient: item.ingredient,
        lot: PantryLot.fromJson(item.lotData),
      );
    }).toList();

    await _handleMutation(
      emit,
      () => _pantryRepository.addMultipleLots(
        uid: _currentUserId!,
        items: itemsWithEntities,
      ),
    );
  }

  Future<void> _onUpdateLot(UpdateLot event, Emitter<PantryState> emit) async {
    final lotDataWithId = {...event.lotData, 'id': event.lotId};
    final updatedLot = PantryLot.fromJson(lotDataWithId);

    await _handleMutation(
      emit,
      () => _pantryRepository.updateLot(
        uid: _currentUserId!,
        ingredientId: event.ingredientId,
        lot: updatedLot,
      ),
    );
  }

  Future<void> _onDeleteLot(DeleteLot event, Emitter<PantryState> emit) async {
    await _handleMutation(
      emit,
      () => _pantryRepository.deleteLot(
        uid: _currentUserId!,
        ingredientId: event.ingredientId,
        lotId: event.lotId,
      ),
    );
  }

  Future<void> _onDeleteEntry(
    DeleteEntry event,
    Emitter<PantryState> emit,
  ) async {
    await _handleMutation(
      emit,
      () => _pantryRepository.deleteEntry(
        uid: _currentUserId!,
        ingredientId: event.ingredientId,
      ),
    );
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
