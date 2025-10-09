import 'package:cookora/core/utils/exception_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/features/scan/domain/enums/scan_mode.dart';

import 'package:cookora/features/scan/domain/repositories/scan_repository.dart';
import 'package:cookora/features/scan/presentation/bloc/scan/scan_event.dart';
import 'package:cookora/features/scan/presentation/bloc/scan/scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  final ScanRepository _scanRepository;

  ScanBloc({required ScanRepository scanRepository})
    : _scanRepository = scanRepository,
      super(const ScanState()) {
    on<RecognizeImage>(_onRecognizeImage);
    on<Reset>((_, emit) => emit(const ScanState()));
  }

  Future<void> _onRecognizeImage(
    RecognizeImage event,
    Emitter<ScanState> emit,
  ) async {
    if (state.isScanning) return;

    emit(state.copyWith(scanStatus: const AsyncLoading()));
    try {
      final result = await _scanRepository.recognizeFromImage(
        imageFile: event.imageFile,
        isDishScan: event.mode == ScanMode.dish,
      );

      if (!isClosed) {
        emit(state.copyWith(scanStatus: AsyncSuccess(result)));
      }
    } catch (e) {
      if (!isClosed) {
        final eMessage = ExceptionHandler.handle(e).toString();
        emit(state.copyWith(scanStatus: AsyncFailure(eMessage)));
      }
    }
  }
}
