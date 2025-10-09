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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitializeCamera value)?  initialize,TResult Function( DisposeCamera value)?  dispose,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitializeCamera() when initialize != null:
return initialize(_that);case DisposeCamera() when dispose != null:
return dispose(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitializeCamera value)  initialize,required TResult Function( DisposeCamera value)  dispose,}){
final _that = this;
switch (_that) {
case InitializeCamera():
return initialize(_that);case DisposeCamera():
return dispose(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitializeCamera value)?  initialize,TResult? Function( DisposeCamera value)?  dispose,}){
final _that = this;
switch (_that) {
case InitializeCamera() when initialize != null:
return initialize(_that);case DisposeCamera() when dispose != null:
return dispose(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initialize,TResult Function()?  dispose,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitializeCamera() when initialize != null:
return initialize();case DisposeCamera() when dispose != null:
return dispose();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initialize,required TResult Function()  dispose,}) {final _that = this;
switch (_that) {
case InitializeCamera():
return initialize();case DisposeCamera():
return dispose();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initialize,TResult? Function()?  dispose,}) {final _that = this;
switch (_that) {
case InitializeCamera() when initialize != null:
return initialize();case DisposeCamera() when dispose != null:
return dispose();case _:
  return null;

}
}

}

/// @nodoc


class InitializeCamera implements CameraEvent {
  const InitializeCamera();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitializeCamera);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraEvent.initialize()';
}


}




/// @nodoc


class DisposeCamera implements CameraEvent {
  const DisposeCamera();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisposeCamera);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraEvent.dispose()';
}


}




/// @nodoc
mixin _$CameraState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraState()';
}


}

/// @nodoc
class $CameraStateCopyWith<$Res>  {
$CameraStateCopyWith(CameraState _, $Res Function(CameraState) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CameraInitial value)?  initial,TResult Function( CameraLoadInProgress value)?  loadInProgress,TResult Function( CameraLoadSuccess value)?  loadSuccess,TResult Function( CameraLoadFailure value)?  loadFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CameraInitial() when initial != null:
return initial(_that);case CameraLoadInProgress() when loadInProgress != null:
return loadInProgress(_that);case CameraLoadSuccess() when loadSuccess != null:
return loadSuccess(_that);case CameraLoadFailure() when loadFailure != null:
return loadFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CameraInitial value)  initial,required TResult Function( CameraLoadInProgress value)  loadInProgress,required TResult Function( CameraLoadSuccess value)  loadSuccess,required TResult Function( CameraLoadFailure value)  loadFailure,}){
final _that = this;
switch (_that) {
case CameraInitial():
return initial(_that);case CameraLoadInProgress():
return loadInProgress(_that);case CameraLoadSuccess():
return loadSuccess(_that);case CameraLoadFailure():
return loadFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CameraInitial value)?  initial,TResult? Function( CameraLoadInProgress value)?  loadInProgress,TResult? Function( CameraLoadSuccess value)?  loadSuccess,TResult? Function( CameraLoadFailure value)?  loadFailure,}){
final _that = this;
switch (_that) {
case CameraInitial() when initial != null:
return initial(_that);case CameraLoadInProgress() when loadInProgress != null:
return loadInProgress(_that);case CameraLoadSuccess() when loadSuccess != null:
return loadSuccess(_that);case CameraLoadFailure() when loadFailure != null:
return loadFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loadInProgress,TResult Function( CameraController controller)?  loadSuccess,TResult Function( String error)?  loadFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CameraInitial() when initial != null:
return initial();case CameraLoadInProgress() when loadInProgress != null:
return loadInProgress();case CameraLoadSuccess() when loadSuccess != null:
return loadSuccess(_that.controller);case CameraLoadFailure() when loadFailure != null:
return loadFailure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loadInProgress,required TResult Function( CameraController controller)  loadSuccess,required TResult Function( String error)  loadFailure,}) {final _that = this;
switch (_that) {
case CameraInitial():
return initial();case CameraLoadInProgress():
return loadInProgress();case CameraLoadSuccess():
return loadSuccess(_that.controller);case CameraLoadFailure():
return loadFailure(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loadInProgress,TResult? Function( CameraController controller)?  loadSuccess,TResult? Function( String error)?  loadFailure,}) {final _that = this;
switch (_that) {
case CameraInitial() when initial != null:
return initial();case CameraLoadInProgress() when loadInProgress != null:
return loadInProgress();case CameraLoadSuccess() when loadSuccess != null:
return loadSuccess(_that.controller);case CameraLoadFailure() when loadFailure != null:
return loadFailure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class CameraInitial implements CameraState {
  const CameraInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraState.initial()';
}


}




/// @nodoc


class CameraLoadInProgress implements CameraState {
  const CameraLoadInProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraLoadInProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraState.loadInProgress()';
}


}




/// @nodoc


class CameraLoadSuccess implements CameraState {
  const CameraLoadSuccess(this.controller);
  

 final  CameraController controller;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraLoadSuccessCopyWith<CameraLoadSuccess> get copyWith => _$CameraLoadSuccessCopyWithImpl<CameraLoadSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraLoadSuccess&&(identical(other.controller, controller) || other.controller == controller));
}


@override
int get hashCode => Object.hash(runtimeType,controller);

@override
String toString() {
  return 'CameraState.loadSuccess(controller: $controller)';
}


}

/// @nodoc
abstract mixin class $CameraLoadSuccessCopyWith<$Res> implements $CameraStateCopyWith<$Res> {
  factory $CameraLoadSuccessCopyWith(CameraLoadSuccess value, $Res Function(CameraLoadSuccess) _then) = _$CameraLoadSuccessCopyWithImpl;
@useResult
$Res call({
 CameraController controller
});




}
/// @nodoc
class _$CameraLoadSuccessCopyWithImpl<$Res>
    implements $CameraLoadSuccessCopyWith<$Res> {
  _$CameraLoadSuccessCopyWithImpl(this._self, this._then);

  final CameraLoadSuccess _self;
  final $Res Function(CameraLoadSuccess) _then;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? controller = null,}) {
  return _then(CameraLoadSuccess(
null == controller ? _self.controller : controller // ignore: cast_nullable_to_non_nullable
as CameraController,
  ));
}


}

/// @nodoc


class CameraLoadFailure implements CameraState {
  const CameraLoadFailure(this.error);
  

 final  String error;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraLoadFailureCopyWith<CameraLoadFailure> get copyWith => _$CameraLoadFailureCopyWithImpl<CameraLoadFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraLoadFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'CameraState.loadFailure(error: $error)';
}


}

/// @nodoc
abstract mixin class $CameraLoadFailureCopyWith<$Res> implements $CameraStateCopyWith<$Res> {
  factory $CameraLoadFailureCopyWith(CameraLoadFailure value, $Res Function(CameraLoadFailure) _then) = _$CameraLoadFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$CameraLoadFailureCopyWithImpl<$Res>
    implements $CameraLoadFailureCopyWith<$Res> {
  _$CameraLoadFailureCopyWithImpl(this._self, this._then);

  final CameraLoadFailure _self;
  final $Res Function(CameraLoadFailure) _then;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(CameraLoadFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
