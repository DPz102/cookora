// lib/features/scan/presentation/bloc/camera/camera_bloc.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:cookora/core/utils/async_state.dart';
import 'package:cookora/core/utils/exception_handler.dart';

import 'package:cookora/features/scan/domain/models/camera_settings.dart';

part 'camera_event.dart';
part 'camera_state.dart';
part 'camera_bloc.freezed.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState>
    with WidgetsBindingObserver {
  CameraController? _controller;
  final ImagePicker _picker = ImagePicker();

  bool _isProcessing = false; // Cờ để ngăn các xử lý đồng thời

  Future<List<CameraDescription>>? _camerasFuture;

  CameraBloc() : super(const CameraState()) {
    WidgetsBinding.instance.addObserver(this);

    // Đăng ký các event handler
    on<_Initialize>(_onInitialize, transformer: _serialize());
    on<_Dispose>(_onDispose, transformer: _serialize());
    on<_PausePreview>(_onPausePreview);
    on<_ResumePreview>(_onResumePreview);
    on<_ToggleFlash>(_onToggleFlash);
    on<_CycleZoom>(_onCycleZoom);
    on<_CycleScanMode>(_onCycleScanMode);
    on<_TakePicture>(_onTakePicture);
    on<_PickImage>(_onPickImage);
    on<_ResetCapture>(
      (event, emit) => emit(state.copyWith(capturedImage: null)),
    );
    on<_CheckAndRequestPermission>(
      _onCheckAndRequestPermission,
      transformer: _serialize(),
    );
    on<_RetryInitialization>(_onRetryInitialization, transformer: _serialize());

    _camerasFuture ??= availableCameras();
  }

  EventTransformer<E> _serialize<E>() =>
      (events, mapper) => events.asyncExpand(mapper);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    final controller = _controller;

    switch (state) {
      case AppLifecycleState.inactive:
        debugPrint('🟡 Camera: inactive');
        if (controller != null &&
            controller.value.isInitialized &&
            !controller.value.isPreviewPaused) {
          controller.pausePreview();
        }
        break;

      case AppLifecycleState.paused:
        debugPrint('🟠 Camera: paused - disposing');
        if (controller != null && controller.value.isInitialized) {
          add(const CameraEvent.dispose());
        }
        break;

      case AppLifecycleState.detached:
        debugPrint('🔴 Camera: detached - force dispose');
        // Dispose trực tiếp vì app sắp die
        if (controller != null) {
          try {
            controller.dispose();
            _controller = null;
          } catch (e) {
            debugPrint('❌ Error disposing on detached: $e');
          }
        }
        break;

      case AppLifecycleState.resumed:
        debugPrint('🟢 Camera: resumed');

        if (controller == null && this.state.cameraStatus is! AsyncFailure) {
          add(const CameraEvent.initialize());
        } else if (controller != null && controller.value.isPreviewPaused) {
          add(const CameraEvent.resumePreview());
        }
        break;

      case AppLifecycleState.hidden:
        debugPrint('⚫ Camera: hidden - disposing');
        if (controller != null && controller.value.isInitialized) {
          add(const CameraEvent.dispose());
        }
        break;
    }
  }

  // 0. Kiểm tra quyền truy cập Camera và thử kết nối lại
  Future<void> _onCheckAndRequestPermission(
    _CheckAndRequestPermission event,
    Emitter<CameraState> emit,
  ) async {
    if (_isProcessing) return;
    _isProcessing = true;

    emit(state.copyWith(cameraStatus: const AsyncLoading()));

    try {
      final status = await Permission.camera.status;

      if (status.isGranted) {
        add(const CameraEvent.initialize());
        return;
      }

      if (status.isDenied) {
        final result = await Permission.camera.request();

        if (result.isGranted) {
          add(const CameraEvent.initialize());
        } else if (result.isPermanentlyDenied) {
          throw CameraException(
            'CameraAccessDeniedWithoutPrompt',
            'Quyền camera bị từ chối vĩnh viễn. Vui lòng cấp quyền trong Cài đặt.',
          );
        } else {
          throw CameraException(
            'CameraAccessDenied',
            'Quyền truy cập camera bị từ chối. Vui lòng cấp quyền để sử dụng.',
          );
        }
        return;
      }

      if (status.isPermanentlyDenied) {
        throw CameraException(
          'CameraAccessDeniedWithoutPrompt',
          'Quyền camera đã bị từ chối. Vui lòng mở Cài đặt và cấp quyền.',
        );
      }

      if (status.isRestricted) {
        throw CameraException(
          'CameraAccessRestricted',
          'Truy cập camera bị hạn chế bởi chính sách thiết bị.',
        );
      }
    } catch (e) {
      final errorMessage = ExceptionHandler.handle(e).toString();
      emit(state.copyWith(cameraStatus: AsyncFailure(errorMessage)));
    } finally {
      _isProcessing = false;
    }
  }

  Future<void> _onRetryInitialization(
    _RetryInitialization event,
    Emitter<CameraState> emit,
  ) async {
    debugPrint('🔄 Retry initialization...');

    // Reset state về initial
    emit(const CameraState());

    // Dispose controller cũ nếu có
    if (_controller != null) {
      try {
        await _controller?.dispose();
        _controller = null;
      } catch (e) {
        debugPrint('⚠️ Error disposing old controller: $e');
      }
    }

    // Check permission lại
    add(const CameraEvent.checkAndRequestPermission());
  }

  // 1. KHỞI TẠO & XÓA
  Future<void> _onInitialize(
    _Initialize event,
    Emitter<CameraState> emit,
  ) async {
    if (_controller != null || _isProcessing) return;
    _isProcessing = true;

    emit(state.copyWith(cameraStatus: const AsyncLoading()));
    try {
      final cameras = await (_camerasFuture ??= availableCameras());
      if (cameras.isEmpty) {
        throw CameraException(
          'NoCamera',
          'Không tìm thấy camera trên thiết bị.',
        );
      }

      final description = cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );

      final controller = CameraController(
        description,
        ResolutionPreset.medium,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      await controller.initialize();
      _controller = controller;

      emit(state.copyWith(cameraStatus: AsyncSuccess(controller)));
    } catch (e) {
      final errorMessage = ExceptionHandler.handle(e).toString();
      emit(state.copyWith(cameraStatus: AsyncFailure(errorMessage)));
    } finally {
      _isProcessing = false;
    }
  }

  Future<void> _onDispose(_Dispose event, Emitter<CameraState> emit) async {
    if (_controller == null) return;

    // Đợi processing xong rồi mới dispose
    while (_isProcessing) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    _isProcessing = true;
    try {
      await _controller?.dispose();
    } catch (e) {
      debugPrint("Lỗi khi dispose camera: $e");
      final errorMessage = ExceptionHandler.handle(e).toString();
      emit(state.copyWith(cameraStatus: AsyncFailure(errorMessage)));
    } finally {
      _controller = null;
      emit(const CameraState()); // Reset về state ban đầu
      _isProcessing = false;
    }
  }

  // 2. TẠM DỪNG & CHẠY LẠI
  Future<void> _onPausePreview(
    _PausePreview event,
    Emitter<CameraState> emit,
  ) async {
    if (_controller?.value.isPreviewPaused ?? true) return;
    try {
      await _controller?.pausePreview();
    } catch (e) {
      debugPrint("Lỗi khi tạm dừng preview: $e");
      final errorMessage = ExceptionHandler.handle(e).toString();
      emit(state.copyWith(cameraStatus: AsyncFailure(errorMessage)));
    }
  }

  Future<void> _onResumePreview(
    _ResumePreview event,
    Emitter<CameraState> emit,
  ) async {
    if (!(_controller?.value.isPreviewPaused ?? false)) return;
    try {
      await _controller?.resumePreview();
    } catch (e) {
      debugPrint("Lỗi khi tiếp tục preview: $e");
      final errorMessage = ExceptionHandler.handle(e).toString();
      emit(state.copyWith(cameraStatus: AsyncFailure(errorMessage)));
    }
  }

  // 3. ZOOM, FLASH, SCAN MODE
  Future<void> _onToggleFlash(
    _ToggleFlash event,
    Emitter<CameraState> emit,
  ) async {
    if (_controller == null) return;
    final newFlashMode = switch (state.settings.flashMode) {
      FlashMode.off => FlashMode.auto,
      FlashMode.auto => FlashMode.torch,
      _ => FlashMode.off,
    };
    try {
      await _controller!.setFlashMode(newFlashMode);
      emit(
        state.copyWith(
          settings: state.settings.copyWith(flashMode: newFlashMode),
        ),
      );
    } catch (e) {
      final errorMessage = ExceptionHandler.handle(e).toString();
      emit(state.copyWith(cameraStatus: AsyncFailure(errorMessage)));
    }
  }

  Future<void> _onCycleZoom(_CycleZoom event, Emitter<CameraState> emit) async {
    if (_controller == null) return;
    try {
      final maxZoom = await _controller!.getMaxZoomLevel();

      // ✅ Kiểm tra thiết bị có hỗ trợ zoom không
      if (maxZoom <= 1.0) {
        debugPrint('⚠️ Device không hỗ trợ zoom');
        return;
      }

      // ✅ Tạo zoom levels dựa trên maxZoom thực tế
      final zoomLevels = <double>[1.0];
      if (maxZoom >= 2.0) zoomLevels.add(2.0);
      if (maxZoom >= 3.0) zoomLevels.add(3.0);
      if (maxZoom >= 4.0) zoomLevels.add(4.0);

      final currentZoom = state.settings.currentZoom;

      // ✅ Tìm zoom level gần nhất
      var currentIndex = 0;
      for (var i = 0; i < zoomLevels.length; i++) {
        if ((currentZoom - zoomLevels[i]).abs() < 0.1) {
          currentIndex = i;
          break;
        }
      }

      final nextIndex = (currentIndex + 1) % zoomLevels.length;
      final nextZoom = zoomLevels[nextIndex];

      await _controller!.setZoomLevel(nextZoom);
      emit(
        state.copyWith(
          settings: state.settings.copyWith(currentZoom: nextZoom),
        ),
      );
    } catch (e) {
      final errorMessage = ExceptionHandler.handle(e).toString();
      emit(state.copyWith(cameraStatus: AsyncFailure(errorMessage)));
    }
  }

  void _onCycleScanMode(_CycleScanMode event, Emitter<CameraState> emit) {
    final nextMode = state.settings.scanMode == ScanMode.ingredients
        ? ScanMode.dish
        : ScanMode.ingredients;

    emit(state.copyWith(settings: state.settings.copyWith(scanMode: nextMode)));
  }

  // 4. TAKE PICTURE, PICK PICTURE
  Future<void> _onTakePicture(
    _TakePicture event,
    Emitter<CameraState> emit,
  ) async {
    if (_controller == null ||
        !_controller!.value.isInitialized ||
        _controller!.value.isTakingPicture ||
        state.isTakingPicture) {
      return;
    }
    try {
      emit(state.copyWith(isTakingPicture: true));

      final image = await _controller!.takePicture();

      emit(state.copyWith(capturedImage: image, isTakingPicture: false));
    } catch (e) {
      final errorMessage = ExceptionHandler.handle(e).toString();
      emit(
        state.copyWith(
          cameraStatus: AsyncFailure(errorMessage),
          isTakingPicture: false,
        ),
      );
    }
  }

  Future<void> _onPickImage(_PickImage event, Emitter<CameraState> emit) async {
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      final image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        emit(state.copyWith(capturedImage: image));
      }
    } catch (e) {
      final errorMessage = ExceptionHandler.handle(e).toString();
      emit(state.copyWith(cameraStatus: AsyncFailure(errorMessage)));
    } finally {
      _isProcessing = false;
    }
  }

  @override
  Future<void> close() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    return super.close();
  }
}
