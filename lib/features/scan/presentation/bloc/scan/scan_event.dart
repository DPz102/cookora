import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cookora/features/scan/domain/enums/scan_mode.dart';

part 'scan_event.freezed.dart';

typedef RecognizeImage = _RecognizeImage;
typedef Reset = _Reset;

@freezed
class ScanEvent with _$ScanEvent {
  const factory ScanEvent.recognizeImage({
    required File imageFile,
    required ScanMode mode,
  }) = _RecognizeImage;

  const factory ScanEvent.reset() = _Reset;

  const ScanEvent._();
}
