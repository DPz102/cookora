import 'package:camera/camera.dart';
import 'package:cookora/features/scan/domain/enums/scan_mode.dart' as scan_enum;

class CameraSettings {
  final scan_enum.ScanMode scanMode;
  final FlashMode flashMode;
  final double currentZoom;

  const CameraSettings({
    this.scanMode = scan_enum.ScanMode.ingredient,
    this.flashMode = FlashMode.off,
    this.currentZoom = 1.0,
  });

  CameraSettings copyWith({
    scan_enum.ScanMode? scanMode,
    FlashMode? flashMode,
    double? currentZoom,
  }) {
    return CameraSettings(
      scanMode: scanMode ?? this.scanMode,
      flashMode: flashMode ?? this.flashMode,
      currentZoom: currentZoom ?? this.currentZoom,
    );
  }
}
