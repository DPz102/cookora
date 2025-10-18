// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CameraSettings {

 ScanMode get scanMode; FlashMode get flashMode; double get currentZoom;
/// Create a copy of CameraSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraSettingsCopyWith<CameraSettings> get copyWith => _$CameraSettingsCopyWithImpl<CameraSettings>(this as CameraSettings, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraSettings&&(identical(other.scanMode, scanMode) || other.scanMode == scanMode)&&(identical(other.flashMode, flashMode) || other.flashMode == flashMode)&&(identical(other.currentZoom, currentZoom) || other.currentZoom == currentZoom));
}


@override
int get hashCode => Object.hash(runtimeType,scanMode,flashMode,currentZoom);

@override
String toString() {
  return 'CameraSettings(scanMode: $scanMode, flashMode: $flashMode, currentZoom: $currentZoom)';
}


}

/// @nodoc
abstract mixin class $CameraSettingsCopyWith<$Res>  {
  factory $CameraSettingsCopyWith(CameraSettings value, $Res Function(CameraSettings) _then) = _$CameraSettingsCopyWithImpl;
@useResult
$Res call({
 ScanMode scanMode, FlashMode flashMode, double currentZoom
});




}
/// @nodoc
class _$CameraSettingsCopyWithImpl<$Res>
    implements $CameraSettingsCopyWith<$Res> {
  _$CameraSettingsCopyWithImpl(this._self, this._then);

  final CameraSettings _self;
  final $Res Function(CameraSettings) _then;

/// Create a copy of CameraSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scanMode = null,Object? flashMode = null,Object? currentZoom = null,}) {
  return _then(_self.copyWith(
scanMode: null == scanMode ? _self.scanMode : scanMode // ignore: cast_nullable_to_non_nullable
as ScanMode,flashMode: null == flashMode ? _self.flashMode : flashMode // ignore: cast_nullable_to_non_nullable
as FlashMode,currentZoom: null == currentZoom ? _self.currentZoom : currentZoom // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CameraSettings].
extension CameraSettingsPatterns on CameraSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CameraSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CameraSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CameraSettings value)  $default,){
final _that = this;
switch (_that) {
case _CameraSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CameraSettings value)?  $default,){
final _that = this;
switch (_that) {
case _CameraSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ScanMode scanMode,  FlashMode flashMode,  double currentZoom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CameraSettings() when $default != null:
return $default(_that.scanMode,_that.flashMode,_that.currentZoom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ScanMode scanMode,  FlashMode flashMode,  double currentZoom)  $default,) {final _that = this;
switch (_that) {
case _CameraSettings():
return $default(_that.scanMode,_that.flashMode,_that.currentZoom);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ScanMode scanMode,  FlashMode flashMode,  double currentZoom)?  $default,) {final _that = this;
switch (_that) {
case _CameraSettings() when $default != null:
return $default(_that.scanMode,_that.flashMode,_that.currentZoom);case _:
  return null;

}
}

}

/// @nodoc


class _CameraSettings implements CameraSettings {
  const _CameraSettings({this.scanMode = ScanMode.ingredients, this.flashMode = FlashMode.off, this.currentZoom = 1.0});
  

@override@JsonKey() final  ScanMode scanMode;
@override@JsonKey() final  FlashMode flashMode;
@override@JsonKey() final  double currentZoom;

/// Create a copy of CameraSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CameraSettingsCopyWith<_CameraSettings> get copyWith => __$CameraSettingsCopyWithImpl<_CameraSettings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CameraSettings&&(identical(other.scanMode, scanMode) || other.scanMode == scanMode)&&(identical(other.flashMode, flashMode) || other.flashMode == flashMode)&&(identical(other.currentZoom, currentZoom) || other.currentZoom == currentZoom));
}


@override
int get hashCode => Object.hash(runtimeType,scanMode,flashMode,currentZoom);

@override
String toString() {
  return 'CameraSettings(scanMode: $scanMode, flashMode: $flashMode, currentZoom: $currentZoom)';
}


}

/// @nodoc
abstract mixin class _$CameraSettingsCopyWith<$Res> implements $CameraSettingsCopyWith<$Res> {
  factory _$CameraSettingsCopyWith(_CameraSettings value, $Res Function(_CameraSettings) _then) = __$CameraSettingsCopyWithImpl;
@override @useResult
$Res call({
 ScanMode scanMode, FlashMode flashMode, double currentZoom
});




}
/// @nodoc
class __$CameraSettingsCopyWithImpl<$Res>
    implements _$CameraSettingsCopyWith<$Res> {
  __$CameraSettingsCopyWithImpl(this._self, this._then);

  final _CameraSettings _self;
  final $Res Function(_CameraSettings) _then;

/// Create a copy of CameraSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scanMode = null,Object? flashMode = null,Object? currentZoom = null,}) {
  return _then(_CameraSettings(
scanMode: null == scanMode ? _self.scanMode : scanMode // ignore: cast_nullable_to_non_nullable
as ScanMode,flashMode: null == flashMode ? _self.flashMode : flashMode // ignore: cast_nullable_to_non_nullable
as FlashMode,currentZoom: null == currentZoom ? _self.currentZoom : currentZoom // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
