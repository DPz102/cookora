// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CameraEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraEvent()';
}


}

/// @nodoc
class $CameraEventCopyWith<$Res>  {
$CameraEventCopyWith(CameraEvent _, $Res Function(CameraEvent) __);
}


/// Adds pattern-matching-related methods to [CameraEvent].
extension CameraEventPatterns on CameraEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initialize value)?  initialize,TResult Function( _Dispose value)?  dispose,TResult Function( _PausePreview value)?  pausePreview,TResult Function( _ResumePreview value)?  resumePreview,TResult Function( _ToggleFlash value)?  toggleFlash,TResult Function( _CycleZoom value)?  cycleZoom,TResult Function( _CycleScanMode value)?  cycleScanMode,TResult Function( _TakePicture value)?  takePicture,TResult Function( _PickImage value)?  pickImage,TResult Function( _ResetCapture value)?  resetCapture,TResult Function( _CheckAndRequestPermission value)?  checkAndRequestPermission,TResult Function( _RetryInitialization value)?  retryInitialization,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initialize() when initialize != null:
return initialize(_that);case _Dispose() when dispose != null:
return dispose(_that);case _PausePreview() when pausePreview != null:
return pausePreview(_that);case _ResumePreview() when resumePreview != null:
return resumePreview(_that);case _ToggleFlash() when toggleFlash != null:
return toggleFlash(_that);case _CycleZoom() when cycleZoom != null:
return cycleZoom(_that);case _CycleScanMode() when cycleScanMode != null:
return cycleScanMode(_that);case _TakePicture() when takePicture != null:
return takePicture(_that);case _PickImage() when pickImage != null:
return pickImage(_that);case _ResetCapture() when resetCapture != null:
return resetCapture(_that);case _CheckAndRequestPermission() when checkAndRequestPermission != null:
return checkAndRequestPermission(_that);case _RetryInitialization() when retryInitialization != null:
return retryInitialization(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initialize value)  initialize,required TResult Function( _Dispose value)  dispose,required TResult Function( _PausePreview value)  pausePreview,required TResult Function( _ResumePreview value)  resumePreview,required TResult Function( _ToggleFlash value)  toggleFlash,required TResult Function( _CycleZoom value)  cycleZoom,required TResult Function( _CycleScanMode value)  cycleScanMode,required TResult Function( _TakePicture value)  takePicture,required TResult Function( _PickImage value)  pickImage,required TResult Function( _ResetCapture value)  resetCapture,required TResult Function( _CheckAndRequestPermission value)  checkAndRequestPermission,required TResult Function( _RetryInitialization value)  retryInitialization,}){
final _that = this;
switch (_that) {
case _Initialize():
return initialize(_that);case _Dispose():
return dispose(_that);case _PausePreview():
return pausePreview(_that);case _ResumePreview():
return resumePreview(_that);case _ToggleFlash():
return toggleFlash(_that);case _CycleZoom():
return cycleZoom(_that);case _CycleScanMode():
return cycleScanMode(_that);case _TakePicture():
return takePicture(_that);case _PickImage():
return pickImage(_that);case _ResetCapture():
return resetCapture(_that);case _CheckAndRequestPermission():
return checkAndRequestPermission(_that);case _RetryInitialization():
return retryInitialization(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initialize value)?  initialize,TResult? Function( _Dispose value)?  dispose,TResult? Function( _PausePreview value)?  pausePreview,TResult? Function( _ResumePreview value)?  resumePreview,TResult? Function( _ToggleFlash value)?  toggleFlash,TResult? Function( _CycleZoom value)?  cycleZoom,TResult? Function( _CycleScanMode value)?  cycleScanMode,TResult? Function( _TakePicture value)?  takePicture,TResult? Function( _PickImage value)?  pickImage,TResult? Function( _ResetCapture value)?  resetCapture,TResult? Function( _CheckAndRequestPermission value)?  checkAndRequestPermission,TResult? Function( _RetryInitialization value)?  retryInitialization,}){
final _that = this;
switch (_that) {
case _Initialize() when initialize != null:
return initialize(_that);case _Dispose() when dispose != null:
return dispose(_that);case _PausePreview() when pausePreview != null:
return pausePreview(_that);case _ResumePreview() when resumePreview != null:
return resumePreview(_that);case _ToggleFlash() when toggleFlash != null:
return toggleFlash(_that);case _CycleZoom() when cycleZoom != null:
return cycleZoom(_that);case _CycleScanMode() when cycleScanMode != null:
return cycleScanMode(_that);case _TakePicture() when takePicture != null:
return takePicture(_that);case _PickImage() when pickImage != null:
return pickImage(_that);case _ResetCapture() when resetCapture != null:
return resetCapture(_that);case _CheckAndRequestPermission() when checkAndRequestPermission != null:
return checkAndRequestPermission(_that);case _RetryInitialization() when retryInitialization != null:
return retryInitialization(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initialize,TResult Function()?  dispose,TResult Function()?  pausePreview,TResult Function()?  resumePreview,TResult Function()?  toggleFlash,TResult Function()?  cycleZoom,TResult Function()?  cycleScanMode,TResult Function()?  takePicture,TResult Function()?  pickImage,TResult Function()?  resetCapture,TResult Function()?  checkAndRequestPermission,TResult Function()?  retryInitialization,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initialize() when initialize != null:
return initialize();case _Dispose() when dispose != null:
return dispose();case _PausePreview() when pausePreview != null:
return pausePreview();case _ResumePreview() when resumePreview != null:
return resumePreview();case _ToggleFlash() when toggleFlash != null:
return toggleFlash();case _CycleZoom() when cycleZoom != null:
return cycleZoom();case _CycleScanMode() when cycleScanMode != null:
return cycleScanMode();case _TakePicture() when takePicture != null:
return takePicture();case _PickImage() when pickImage != null:
return pickImage();case _ResetCapture() when resetCapture != null:
return resetCapture();case _CheckAndRequestPermission() when checkAndRequestPermission != null:
return checkAndRequestPermission();case _RetryInitialization() when retryInitialization != null:
return retryInitialization();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initialize,required TResult Function()  dispose,required TResult Function()  pausePreview,required TResult Function()  resumePreview,required TResult Function()  toggleFlash,required TResult Function()  cycleZoom,required TResult Function()  cycleScanMode,required TResult Function()  takePicture,required TResult Function()  pickImage,required TResult Function()  resetCapture,required TResult Function()  checkAndRequestPermission,required TResult Function()  retryInitialization,}) {final _that = this;
switch (_that) {
case _Initialize():
return initialize();case _Dispose():
return dispose();case _PausePreview():
return pausePreview();case _ResumePreview():
return resumePreview();case _ToggleFlash():
return toggleFlash();case _CycleZoom():
return cycleZoom();case _CycleScanMode():
return cycleScanMode();case _TakePicture():
return takePicture();case _PickImage():
return pickImage();case _ResetCapture():
return resetCapture();case _CheckAndRequestPermission():
return checkAndRequestPermission();case _RetryInitialization():
return retryInitialization();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initialize,TResult? Function()?  dispose,TResult? Function()?  pausePreview,TResult? Function()?  resumePreview,TResult? Function()?  toggleFlash,TResult? Function()?  cycleZoom,TResult? Function()?  cycleScanMode,TResult? Function()?  takePicture,TResult? Function()?  pickImage,TResult? Function()?  resetCapture,TResult? Function()?  checkAndRequestPermission,TResult? Function()?  retryInitialization,}) {final _that = this;
switch (_that) {
case _Initialize() when initialize != null:
return initialize();case _Dispose() when dispose != null:
return dispose();case _PausePreview() when pausePreview != null:
return pausePreview();case _ResumePreview() when resumePreview != null:
return resumePreview();case _ToggleFlash() when toggleFlash != null:
return toggleFlash();case _CycleZoom() when cycleZoom != null:
return cycleZoom();case _CycleScanMode() when cycleScanMode != null:
return cycleScanMode();case _TakePicture() when takePicture != null:
return takePicture();case _PickImage() when pickImage != null:
return pickImage();case _ResetCapture() when resetCapture != null:
return resetCapture();case _CheckAndRequestPermission() when checkAndRequestPermission != null:
return checkAndRequestPermission();case _RetryInitialization() when retryInitialization != null:
return retryInitialization();case _:
  return null;

}
}

}

/// @nodoc


class _Initialize implements CameraEvent {
  const _Initialize();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initialize);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraEvent.initialize()';
}


}




/// @nodoc


class _Dispose implements CameraEvent {
  const _Dispose();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Dispose);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraEvent.dispose()';
}


}




/// @nodoc


class _PausePreview implements CameraEvent {
  const _PausePreview();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PausePreview);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraEvent.pausePreview()';
}


}




/// @nodoc


class _ResumePreview implements CameraEvent {
  const _ResumePreview();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResumePreview);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraEvent.resumePreview()';
}


}




/// @nodoc


class _ToggleFlash implements CameraEvent {
  const _ToggleFlash();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleFlash);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraEvent.toggleFlash()';
}


}




/// @nodoc


class _CycleZoom implements CameraEvent {
  const _CycleZoom();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CycleZoom);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraEvent.cycleZoom()';
}


}




/// @nodoc


class _CycleScanMode implements CameraEvent {
  const _CycleScanMode();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CycleScanMode);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraEvent.cycleScanMode()';
}


}




/// @nodoc


class _TakePicture implements CameraEvent {
  const _TakePicture();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TakePicture);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraEvent.takePicture()';
}


}




/// @nodoc


class _PickImage implements CameraEvent {
  const _PickImage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PickImage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraEvent.pickImage()';
}


}




/// @nodoc


class _ResetCapture implements CameraEvent {
  const _ResetCapture();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetCapture);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraEvent.resetCapture()';
}


}




/// @nodoc


class _CheckAndRequestPermission implements CameraEvent {
  const _CheckAndRequestPermission();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckAndRequestPermission);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraEvent.checkAndRequestPermission()';
}


}




/// @nodoc


class _RetryInitialization implements CameraEvent {
  const _RetryInitialization();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryInitialization);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraEvent.retryInitialization()';
}


}




/// @nodoc
mixin _$CameraState {

// Quản lý trạng thái khởi tạo của CameraController
 AsyncState<CameraController> get cameraStatus;// Giữ cài đặt hiện tại của camera
 CameraSettings get settings;// Tín hiệu cho biết ảnh vừa được chụp hoặc chọn
 XFile? get capturedImage;// Quản lý trạng thái có đang chụp hay không?
 bool get isTakingPicture;
/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraStateCopyWith<CameraState> get copyWith => _$CameraStateCopyWithImpl<CameraState>(this as CameraState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraState&&(identical(other.cameraStatus, cameraStatus) || other.cameraStatus == cameraStatus)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.capturedImage, capturedImage) || other.capturedImage == capturedImage)&&(identical(other.isTakingPicture, isTakingPicture) || other.isTakingPicture == isTakingPicture));
}


@override
int get hashCode => Object.hash(runtimeType,cameraStatus,settings,capturedImage,isTakingPicture);

@override
String toString() {
  return 'CameraState(cameraStatus: $cameraStatus, settings: $settings, capturedImage: $capturedImage, isTakingPicture: $isTakingPicture)';
}


}

/// @nodoc
abstract mixin class $CameraStateCopyWith<$Res>  {
  factory $CameraStateCopyWith(CameraState value, $Res Function(CameraState) _then) = _$CameraStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<CameraController> cameraStatus, CameraSettings settings, XFile? capturedImage, bool isTakingPicture
});


$AsyncStateCopyWith<CameraController, $Res> get cameraStatus;$CameraSettingsCopyWith<$Res> get settings;

}
/// @nodoc
class _$CameraStateCopyWithImpl<$Res>
    implements $CameraStateCopyWith<$Res> {
  _$CameraStateCopyWithImpl(this._self, this._then);

  final CameraState _self;
  final $Res Function(CameraState) _then;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cameraStatus = null,Object? settings = null,Object? capturedImage = freezed,Object? isTakingPicture = null,}) {
  return _then(_self.copyWith(
cameraStatus: null == cameraStatus ? _self.cameraStatus : cameraStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<CameraController>,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as CameraSettings,capturedImage: freezed == capturedImage ? _self.capturedImage : capturedImage // ignore: cast_nullable_to_non_nullable
as XFile?,isTakingPicture: null == isTakingPicture ? _self.isTakingPicture : isTakingPicture // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<CameraController, $Res> get cameraStatus {
  
  return $AsyncStateCopyWith<CameraController, $Res>(_self.cameraStatus, (value) {
    return _then(_self.copyWith(cameraStatus: value));
  });
}/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CameraSettingsCopyWith<$Res> get settings {
  
  return $CameraSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}


/// Adds pattern-matching-related methods to [CameraState].
extension CameraStatePatterns on CameraState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CameraState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CameraState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CameraState value)  $default,){
final _that = this;
switch (_that) {
case _CameraState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CameraState value)?  $default,){
final _that = this;
switch (_that) {
case _CameraState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncState<CameraController> cameraStatus,  CameraSettings settings,  XFile? capturedImage,  bool isTakingPicture)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CameraState() when $default != null:
return $default(_that.cameraStatus,_that.settings,_that.capturedImage,_that.isTakingPicture);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncState<CameraController> cameraStatus,  CameraSettings settings,  XFile? capturedImage,  bool isTakingPicture)  $default,) {final _that = this;
switch (_that) {
case _CameraState():
return $default(_that.cameraStatus,_that.settings,_that.capturedImage,_that.isTakingPicture);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncState<CameraController> cameraStatus,  CameraSettings settings,  XFile? capturedImage,  bool isTakingPicture)?  $default,) {final _that = this;
switch (_that) {
case _CameraState() when $default != null:
return $default(_that.cameraStatus,_that.settings,_that.capturedImage,_that.isTakingPicture);case _:
  return null;

}
}

}

/// @nodoc


class _CameraState implements CameraState {
  const _CameraState({this.cameraStatus = const AsyncInitial(), this.settings = const CameraSettings(), this.capturedImage, this.isTakingPicture = false});
  

// Quản lý trạng thái khởi tạo của CameraController
@override@JsonKey() final  AsyncState<CameraController> cameraStatus;
// Giữ cài đặt hiện tại của camera
@override@JsonKey() final  CameraSettings settings;
// Tín hiệu cho biết ảnh vừa được chụp hoặc chọn
@override final  XFile? capturedImage;
// Quản lý trạng thái có đang chụp hay không?
@override@JsonKey() final  bool isTakingPicture;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CameraStateCopyWith<_CameraState> get copyWith => __$CameraStateCopyWithImpl<_CameraState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CameraState&&(identical(other.cameraStatus, cameraStatus) || other.cameraStatus == cameraStatus)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.capturedImage, capturedImage) || other.capturedImage == capturedImage)&&(identical(other.isTakingPicture, isTakingPicture) || other.isTakingPicture == isTakingPicture));
}


@override
int get hashCode => Object.hash(runtimeType,cameraStatus,settings,capturedImage,isTakingPicture);

@override
String toString() {
  return 'CameraState(cameraStatus: $cameraStatus, settings: $settings, capturedImage: $capturedImage, isTakingPicture: $isTakingPicture)';
}


}

/// @nodoc
abstract mixin class _$CameraStateCopyWith<$Res> implements $CameraStateCopyWith<$Res> {
  factory _$CameraStateCopyWith(_CameraState value, $Res Function(_CameraState) _then) = __$CameraStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<CameraController> cameraStatus, CameraSettings settings, XFile? capturedImage, bool isTakingPicture
});


@override $AsyncStateCopyWith<CameraController, $Res> get cameraStatus;@override $CameraSettingsCopyWith<$Res> get settings;

}
/// @nodoc
class __$CameraStateCopyWithImpl<$Res>
    implements _$CameraStateCopyWith<$Res> {
  __$CameraStateCopyWithImpl(this._self, this._then);

  final _CameraState _self;
  final $Res Function(_CameraState) _then;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cameraStatus = null,Object? settings = null,Object? capturedImage = freezed,Object? isTakingPicture = null,}) {
  return _then(_CameraState(
cameraStatus: null == cameraStatus ? _self.cameraStatus : cameraStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<CameraController>,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as CameraSettings,capturedImage: freezed == capturedImage ? _self.capturedImage : capturedImage // ignore: cast_nullable_to_non_nullable
as XFile?,isTakingPicture: null == isTakingPicture ? _self.isTakingPicture : isTakingPicture // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<CameraController, $Res> get cameraStatus {
  
  return $AsyncStateCopyWith<CameraController, $Res>(_self.cameraStatus, (value) {
    return _then(_self.copyWith(cameraStatus: value));
  });
}/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CameraSettingsCopyWith<$Res> get settings {
  
  return $CameraSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}

// dart format on
