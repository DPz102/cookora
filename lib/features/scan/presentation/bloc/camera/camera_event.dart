part of 'camera_bloc.dart';

@freezed
abstract class CameraEvent with _$CameraEvent {
  const factory CameraEvent.initialize() = InitializeCamera;
  const factory CameraEvent.dispose() = DisposeCamera;
}
