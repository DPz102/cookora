import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/widgets.dart';

part 'camera_event.dart';
part 'camera_state.dart';
part 'camera_bloc.freezed.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState>
    with WidgetsBindingObserver {
  CameraBloc() : super(const CameraState.initial()) {
    on<InitializeCamera>(_onInitializeCamera);
    on<DisposeCamera>(_onDisposeCamera);

    // Bắt đầu lắng nghe vòng đời của app
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    final currentController = state is CameraLoadSuccess
        ? (state as CameraLoadSuccess).controller
        : null;

    // Chỉ xử lý nếu đã có controller
    if (currentController == null || !currentController.value.isInitialized) {
      return;
    }

    // Nếu app không active, dispose camera để giải phóng tài nguyên
    if (state == AppLifecycleState.inactive) {
      add(const DisposeCamera());
    }
    // Nếu app quay trở lại, khởi tạo lại camera
    else if (state == AppLifecycleState.resumed) {
      add(const InitializeCamera());
    }
  }

  Future<void> _onInitializeCamera(
    InitializeCamera event,
    Emitter<CameraState> emit,
  ) async {
    // Tránh khởi tạo lại nếu đang khởi tạo hoặc đã có controller
    if (state is CameraLoadInProgress || state is CameraLoadSuccess) return;

    emit(const CameraState.loadInProgress());

    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        throw Exception('Không tìm thấy camera');
      }

      final controller = CameraController(
        cameras.first,
        ResolutionPreset.high,
        enableAudio: false,
      );
      await controller.initialize();

      emit(CameraState.loadSuccess(controller));
    } catch (e) {
      emit(CameraState.loadFailure(e.toString()));
    }
  }

  Future<void> _onDisposeCamera(
    DisposeCamera event,
    Emitter<CameraState> emit,
  ) async {
    if (state is CameraLoadSuccess) {
      await (state as CameraLoadSuccess).controller.dispose();
      emit(const CameraState.initial());
    }
  }

  @override
  Future<void> close() {
    // Hủy lắng nghe và dispose controller khi Bloc bị đóng
    WidgetsBinding.instance.removeObserver(this);
    add(const DisposeCamera());
    return super.close();
  }
}
