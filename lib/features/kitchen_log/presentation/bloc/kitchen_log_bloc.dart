import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/exception_handler.dart';
import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';
import 'package:cookora/features/kitchen_log/domain/repository/kitchen_log_repository.dart';
import 'package:cookora/features/kitchen_log/presentation/bloc/kitchen_log_event.dart';
import 'package:cookora/features/kitchen_log/presentation/bloc/kitchen_log_state.dart';
import 'package:cookora/features/user/domain/entities/user_entity.dart';
import 'package:cookora/features/user/presentation/bloc/user_bloc.dart';

class KitchenLogBloc extends Bloc<KitchenLogEvent, KitchenLogState> {
  final KitchenLogRepository _kitchenLogRepository;
  final UserBloc _userBloc;
  StreamSubscription<List<RecipeEntity>>? _logSubscription;

  KitchenLogBloc({
    required KitchenLogRepository kitchenLogRepository,
    required UserBloc userBloc,
  }) : _kitchenLogRepository = kitchenLogRepository,
       _userBloc = userBloc,
       super(const KitchenLogState()) {
    on<SubscribeToKitchenLog>(_onSubscribeToKitchenLog);
    on<AddRecipeToLog>(_onAddRecipeToLog);
    on<KitchenLogUpdated>(_onKitchenLogUpdated);
    on<ClearLog>(_onClearLog);
  }

  String? _getCurrentUid() {
    final userState = _userBloc.state.profileStatus;
    return userState is AsyncSuccess<UserEntity> ? userState.data.uid : null;
  }

  void _onSubscribeToKitchenLog(
    SubscribeToKitchenLog event,
    Emitter<KitchenLogState> emit,
  ) {
    emit(state.copyWith(logStatus: const AsyncLoading()));

    _logSubscription?.cancel();

    _logSubscription = _kitchenLogRepository
        .getKitchenLogStream(uid: event.uid)
        .listen(
          (recipes) => add(KitchenLogUpdated(recipes: recipes)),
          onError: (e) {
            final eMessage = ExceptionHandler.handle(e).toString();
            emit(state.copyWith(logStatus: AsyncFailure(eMessage)));
          },
        );
  }

  Future<void> _onAddRecipeToLog(
    AddRecipeToLog event,
    Emitter<KitchenLogState> emit,
  ) async {
    emit(state.copyWith(logStatus: AsyncLoading()));
    final uid = _getCurrentUid();
    if (uid == null) {
      final eMessage = 'Lỗi: Không tìm thấy thông tin người dùng.';
      emit(state.copyWith(logStatus: AsyncFailure(eMessage)));
      return;
    }

    try {
      await _kitchenLogRepository.addRecipeToLog(
        uid: uid,
        recipe: event.recipe,
      );
    } catch (e) {
      final eMessage = ExceptionHandler.handle(e).toString();
      emit(state.copyWith(logStatus: AsyncFailure(eMessage)));
    }
  }

  void _onKitchenLogUpdated(
    KitchenLogUpdated event,
    Emitter<KitchenLogState> emit,
  ) {
    emit(state.copyWith(logStatus: AsyncSuccess(event.recipes)));
  }

  void _onClearLog(ClearLog event, Emitter<KitchenLogState> emit) {
    _logSubscription?.cancel();
    emit(const KitchenLogState());
  }

  @override
  Future<void> close() {
    _logSubscription?.cancel();
    return super.close();
  }
}
