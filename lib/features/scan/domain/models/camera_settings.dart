import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:camera/camera.dart';

part 'camera_settings.freezed.dart';

enum ScanMode { ingredients, dish }

@freezed
abstract class CameraSettings with _$CameraSettings {
  const factory CameraSettings({
    @Default(ScanMode.ingredients) ScanMode scanMode,
    @Default(FlashMode.off) FlashMode flashMode,
    @Default(1.0) double currentZoom,
  }) = _CameraSettings;
}
