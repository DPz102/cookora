import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/exception_handler.dart';

import 'package:cookora/features/suggestion/domain/entities/recipe_entity.dart';
import 'package:cookora/features/suggestion/domain/usecases/get_suggestions_usecase.dart';
import 'package:cookora/features/suggestion/presentation/bloc/suggestion_event.dart';
import 'package:cookora/features/suggestion/presentation/bloc/suggestion_state.dart';

class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {
  final GetSuggestionsUsecase _getSuggestionsUsecase;
  StreamSubscription<List<RecipeEntity>>? _suggestionSubscription;

  SuggestionBloc({required GetSuggestionsUsecase getSuggestionUseCase})
    : _getSuggestionsUsecase = getSuggestionUseCase,
      super(const SuggestionState()) {
    on<SubscribeToSuggestions>(_onSubscribeToSuggestions);
    on<SuggestionsReceived>(_onSuggestionsReceived);
    on<ClearSuggestions>(_onClearSuggestions);
  }

  void _onSubscribeToSuggestions(
    SubscribeToSuggestions event,
    Emitter<SuggestionState> emit,
  ) {
    emit(state.copyWith(suggestionsStatus: const AsyncLoading()));

    _suggestionSubscription?.cancel();

    _suggestionSubscription = _getSuggestionsUsecase(uid: event.uid).listen(
      (recipes) {
        add(SuggestionsReceived(recipes: recipes));
      },
      onError: (e) {
        final eMessage = ExceptionHandler.handle(e).toString();
        emit(state.copyWith(suggestionsStatus: AsyncFailure(eMessage)));
      },
    );
  }

  void _onSuggestionsReceived(
    SuggestionsReceived event,
    Emitter<SuggestionState> emit,
  ) {
    emit(state.copyWith(suggestionsStatus: AsyncSuccess(event.recipes)));
  }

  void _onClearSuggestions(
    ClearSuggestions event,
    Emitter<SuggestionState> emit,
  ) {
    _suggestionSubscription?.cancel();
    emit(const SuggestionState());
  }

  @override
  Future<void> close() {
    _suggestionSubscription?.cancel();
    return super.close();
  }
}
