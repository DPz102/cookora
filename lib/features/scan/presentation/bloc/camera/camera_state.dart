part of 'camera_bloc.dart';

@freezed
abstract class CameraState with _$CameraState {
  const factory CameraState.initial() = CameraInitial;
  const factory CameraState.loadInProgress() = CameraLoadInProgress;
  const factory CameraState.loadSuccess(CameraController controller) =
      CameraLoadSuccess;
  const factory CameraState.loadFailure(String error) = CameraLoadFailure;
}
