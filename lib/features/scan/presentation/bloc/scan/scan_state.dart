import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/features/scan/domain/entities/scan_result.dart';

part 'scan_state.freezed.dart';

@freezed
abstract class ScanState with _$ScanState {
  const factory ScanState({
    @Default(AsyncInitial()) AsyncState<ScanResult> scanStatus,
  }) = _ScanState;

  const ScanState._();

  bool get isScanning => scanStatus is AsyncLoading;
}
