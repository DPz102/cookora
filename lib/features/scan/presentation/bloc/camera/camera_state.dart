// lib/features/scan/presentation/bloc/camera/camera_state.dart
part of 'camera_bloc.dart';

@freezed
abstract class CameraState with _$CameraState {
  const factory CameraState({
    // Quản lý trạng thái khởi tạo của CameraController
    @Default(AsyncInitial()) AsyncState<CameraController> cameraStatus,

    // Giữ cài đặt hiện tại của camera
    @Default(CameraSettings()) CameraSettings settings,

    // Tín hiệu cho biết ảnh vừa được chụp hoặc chọn
    XFile? capturedImage,

    // Quản lý trạng thái có đang chụp hay không?
    @Default(false) bool isTakingPicture,
  }) = _CameraState;
}
