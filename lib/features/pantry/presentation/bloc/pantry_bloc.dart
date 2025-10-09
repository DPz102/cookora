import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/exception_handler.dart';

import 'package:cookora/features/user/presentation/bloc/user_bloc.dart';
import 'package:cookora/features/user/domain/entities/user_entity.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient_entity.dart';
import 'package:cookora/features/pantry/domain/repositories/pantry_repository.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_event.dart';
import 'package:cookora/features/pantry/presentation/bloc/pantry_state.dart';

class PantryBloc extends Bloc<PantryEvent, PantryState> {
  final PantryRepository _pantryRepository;
  final UserBloc _userBloc;

  StreamSubscription<List<IngredientEntity>>? _pantrySubscription;

  PantryBloc({
    required PantryRepository pantryRepository,
    required UserBloc userBloc,
  }) : _pantryRepository = pantryRepository,
       _userBloc = userBloc,
       super(const PantryState()) {
    on<SubscribeToPantry>(_onSubscribeToPantry);
    on<PantryStreamUpdated>(_onPantryStreamUpdated);
    on<AddIngredient>(_onAddIngredient);
    on<UpdateIngredient>(_onUpdateIngredient);
    on<DeleteIngredient>(_onDeleteIngredient);
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
    emit(state.copyWith(ingredientsStatus: const AsyncLoading()));
    // Hủy subscription cũ (nếu có) trước khi tạo cái mới
    _pantrySubscription?.cancel();

    _pantrySubscription = _pantryRepository
        .getPantryIngredients(event.uid)
        .listen(
          (ingredients) => add(PantryStreamUpdated(ingredients)),
          onError: (e) {
            final eMessage = ExceptionHandler.handle(e).toString();
            emit(state.copyWith(ingredientsStatus: AsyncFailure(eMessage)));
          },
        );
  }

  void _onPantryStreamUpdated(
    PantryStreamUpdated event,
    Emitter<PantryState> emit,
  ) {
    // Cập nhật state với dữ liệu mới
    emit(state.copyWith(ingredientsStatus: AsyncSuccess(event.ingredients)));
  }

  Future<void> _onAddIngredient(
    AddIngredient event,
    Emitter<PantryState> emit,
  ) async {
    final uid = _getCurrentUid();

    if (uid == null) {
      final eMessage = 'Lỗi: Không tìm thấy thông tin người dùng.';
      emit(state.copyWith(mutationStatus: AsyncFailure(eMessage)));
      return;
    }

    await _handleMutation(
      emit,
      () => _pantryRepository.addIngredient(
        uid: uid,
        ingredient: event.ingredient,
      ),
    );
  }

  Future<void> _onUpdateIngredient(
    UpdateIngredient event,
    Emitter<PantryState> emit,
  ) async {
    await _handleMutation(
      emit,
      () => _pantryRepository.updateIngredient(event.ingredient),
    );
  }

  Future<void> _onDeleteIngredient(
    DeleteIngredient event,
    Emitter<PantryState> emit,
  ) async {
    final uid = _getCurrentUid();

    if (uid == null) {
      final eMessage = 'Lỗi: Không tìm thấy thông tin người dùng.';
      emit(state.copyWith(mutationStatus: AsyncFailure(eMessage)));
      return;
    }

    await _handleMutation(
      emit,
      () => _pantryRepository.deleteIngredient(
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
