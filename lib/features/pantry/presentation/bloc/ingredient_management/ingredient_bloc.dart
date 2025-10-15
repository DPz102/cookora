// lib/features/pantry/presentation/bloc/ingredient_management/ingredient_bloc.dart
import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/exception_handler.dart';
import 'package:cookora/features/pantry/domain/repositories/ingredient_repository.dart';
import 'package:cookora/features/pantry/presentation/bloc/ingredient_management/ingredient_event.dart';
import 'package:cookora/features/pantry/presentation/bloc/ingredient_management/ingredient_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IngredientBloc extends Bloc<IngredientEvent, IngredientState> {
  final IngredientRepository _ingredientRepository;

  IngredientBloc(this._ingredientRepository) : super(const IngredientState()) {
    on<FetchAllIngredients>(_onFetchAllIngredients);
  }

  Future<void> _onFetchAllIngredients(
    FetchAllIngredients event,
    Emitter<IngredientState> emit,
  ) async {
    // Chỉ fetch nếu dữ liệu chưa có
    if (state.ingredientsMap is! AsyncSuccess) {
      emit(state.copyWith(ingredientsMap: const AsyncLoading()));
      try {
        final ingredientsList = await _ingredientRepository.getAllIngredients();
        final ingredientsMap = {
          for (var item in ingredientsList) item.ingredientId: item,
        };
        emit(state.copyWith(ingredientsMap: AsyncSuccess(ingredientsMap)));
      } catch (e) {
        final errorMessage = ExceptionHandler.handle(e).toString();
        emit(state.copyWith(ingredientsMap: AsyncFailure(errorMessage)));
      }
    }
  }
}
