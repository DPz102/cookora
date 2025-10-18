// lib/features/scan/presentation/bloc/camera/camera_event.dart
part of 'camera_bloc.dart';

@freezed
abstract class CameraEvent with _$CameraEvent {
  // Lifecycle
  const factory CameraEvent.initialize() = _Initialize;
  const factory CameraEvent.dispose() = _Dispose;

  // Preview Control
  const factory CameraEvent.pausePreview() = _PausePreview;
  const factory CameraEvent.resumePreview() = _ResumePreview;

  // Settings
  const factory CameraEvent.toggleFlash() = _ToggleFlash;
  const factory CameraEvent.cycleZoom() = _CycleZoom;
  const factory CameraEvent.cycleScanMode() = _CycleScanMode;

  // Actions
  const factory CameraEvent.takePicture() = _TakePicture;
  const factory CameraEvent.pickImage() = _PickImage;

  // Internal: Đặt lại tín hiệu ảnh đã chụp
  const factory CameraEvent.resetCapture() = _ResetCapture;
  const factory CameraEvent.checkAndRequestPermission() =
      _CheckAndRequestPermission;
  const factory CameraEvent.retryInitialization() = _RetryInitialization;
}
