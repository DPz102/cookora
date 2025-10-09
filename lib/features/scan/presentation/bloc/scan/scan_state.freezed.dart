// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScanState {

 AsyncState<ScanResult> get scanStatus;
/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanStateCopyWith<ScanState> get copyWith => _$ScanStateCopyWithImpl<ScanState>(this as ScanState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanState&&(identical(other.scanStatus, scanStatus) || other.scanStatus == scanStatus));
}


@override
int get hashCode => Object.hash(runtimeType,scanStatus);

@override
String toString() {
  return 'ScanState(scanStatus: $scanStatus)';
}


}

/// @nodoc
abstract mixin class $ScanStateCopyWith<$Res>  {
  factory $ScanStateCopyWith(ScanState value, $Res Function(ScanState) _then) = _$ScanStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<ScanResult> scanStatus
});


$AsyncStateCopyWith<ScanResult, $Res> get scanStatus;

}
/// @nodoc
class _$ScanStateCopyWithImpl<$Res>
    implements $ScanStateCopyWith<$Res> {
  _$ScanStateCopyWithImpl(this._self, this._then);

  final ScanState _self;
  final $Res Function(ScanState) _then;

/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scanStatus = null,}) {
  return _then(_self.copyWith(
scanStatus: null == scanStatus ? _self.scanStatus : scanStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<ScanResult>,
  ));
}
/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<ScanResult, $Res> get scanStatus {
  
  return $AsyncStateCopyWith<ScanResult, $Res>(_self.scanStatus, (value) {
    return _then(_self.copyWith(scanStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [ScanState].
extension ScanStatePatterns on ScanState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScanState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScanState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScanState value)  $default,){
final _that = this;
switch (_that) {
case _ScanState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScanState value)?  $default,){
final _that = this;
switch (_that) {
case _ScanState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncState<ScanResult> scanStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScanState() when $default != null:
return $default(_that.scanStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncState<ScanResult> scanStatus)  $default,) {final _that = this;
switch (_that) {
case _ScanState():
return $default(_that.scanStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncState<ScanResult> scanStatus)?  $default,) {final _that = this;
switch (_that) {
case _ScanState() when $default != null:
return $default(_that.scanStatus);case _:
  return null;

}
}

}

/// @nodoc


class _ScanState extends ScanState {
  const _ScanState({this.scanStatus = const AsyncInitial()}): super._();
  

@override@JsonKey() final  AsyncState<ScanResult> scanStatus;

/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScanStateCopyWith<_ScanState> get copyWith => __$ScanStateCopyWithImpl<_ScanState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScanState&&(identical(other.scanStatus, scanStatus) || other.scanStatus == scanStatus));
}


@override
int get hashCode => Object.hash(runtimeType,scanStatus);

@override
String toString() {
  return 'ScanState(scanStatus: $scanStatus)';
}


}

/// @nodoc
abstract mixin class _$ScanStateCopyWith<$Res> implements $ScanStateCopyWith<$Res> {
  factory _$ScanStateCopyWith(_ScanState value, $Res Function(_ScanState) _then) = __$ScanStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<ScanResult> scanStatus
});


@override $AsyncStateCopyWith<ScanResult, $Res> get scanStatus;

}
/// @nodoc
class __$ScanStateCopyWithImpl<$Res>
    implements _$ScanStateCopyWith<$Res> {
  __$ScanStateCopyWithImpl(this._self, this._then);

  final _ScanState _self;
  final $Res Function(_ScanState) _then;

/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scanStatus = null,}) {
  return _then(_ScanState(
scanStatus: null == scanStatus ? _self.scanStatus : scanStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<ScanResult>,
  ));
}

/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<ScanResult, $Res> get scanStatus {
  
  return $AsyncStateCopyWith<ScanResult, $Res>(_self.scanStatus, (value) {
    return _then(_self.copyWith(scanStatus: value));
  });
}
}

// dart format on
