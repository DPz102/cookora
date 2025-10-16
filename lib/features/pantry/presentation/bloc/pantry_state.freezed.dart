// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pantry_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PantryState {

/// Quản lý trạng thái tải danh sách entries từ Firestore.
 AsyncState<List<PantryEntry>> get entriesStatus;/// Quản lý trạng thái của các hành động CUD (Create, Update, Delete).
 AsyncState<void> get mutationStatus;
/// Create a copy of PantryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PantryStateCopyWith<PantryState> get copyWith => _$PantryStateCopyWithImpl<PantryState>(this as PantryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PantryState&&(identical(other.entriesStatus, entriesStatus) || other.entriesStatus == entriesStatus)&&(identical(other.mutationStatus, mutationStatus) || other.mutationStatus == mutationStatus));
}


@override
int get hashCode => Object.hash(runtimeType,entriesStatus,mutationStatus);

@override
String toString() {
  return 'PantryState(entriesStatus: $entriesStatus, mutationStatus: $mutationStatus)';
}


}

/// @nodoc
abstract mixin class $PantryStateCopyWith<$Res>  {
  factory $PantryStateCopyWith(PantryState value, $Res Function(PantryState) _then) = _$PantryStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<List<PantryEntry>> entriesStatus, AsyncState<void> mutationStatus
});


$AsyncStateCopyWith<List<PantryEntry>, $Res> get entriesStatus;$AsyncStateCopyWith<void, $Res> get mutationStatus;

}
/// @nodoc
class _$PantryStateCopyWithImpl<$Res>
    implements $PantryStateCopyWith<$Res> {
  _$PantryStateCopyWithImpl(this._self, this._then);

  final PantryState _self;
  final $Res Function(PantryState) _then;

/// Create a copy of PantryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entriesStatus = null,Object? mutationStatus = null,}) {
  return _then(_self.copyWith(
entriesStatus: null == entriesStatus ? _self.entriesStatus : entriesStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<List<PantryEntry>>,mutationStatus: null == mutationStatus ? _self.mutationStatus : mutationStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,
  ));
}
/// Create a copy of PantryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<PantryEntry>, $Res> get entriesStatus {
  
  return $AsyncStateCopyWith<List<PantryEntry>, $Res>(_self.entriesStatus, (value) {
    return _then(_self.copyWith(entriesStatus: value));
  });
}/// Create a copy of PantryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get mutationStatus {
  
  return $AsyncStateCopyWith<void, $Res>(_self.mutationStatus, (value) {
    return _then(_self.copyWith(mutationStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [PantryState].
extension PantryStatePatterns on PantryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PantryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PantryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PantryState value)  $default,){
final _that = this;
switch (_that) {
case _PantryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PantryState value)?  $default,){
final _that = this;
switch (_that) {
case _PantryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncState<List<PantryEntry>> entriesStatus,  AsyncState<void> mutationStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PantryState() when $default != null:
return $default(_that.entriesStatus,_that.mutationStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncState<List<PantryEntry>> entriesStatus,  AsyncState<void> mutationStatus)  $default,) {final _that = this;
switch (_that) {
case _PantryState():
return $default(_that.entriesStatus,_that.mutationStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncState<List<PantryEntry>> entriesStatus,  AsyncState<void> mutationStatus)?  $default,) {final _that = this;
switch (_that) {
case _PantryState() when $default != null:
return $default(_that.entriesStatus,_that.mutationStatus);case _:
  return null;

}
}

}

/// @nodoc


class _PantryState implements PantryState {
  const _PantryState({this.entriesStatus = const AsyncInitial(), this.mutationStatus = const AsyncInitial()});
  

/// Quản lý trạng thái tải danh sách entries từ Firestore.
@override@JsonKey() final  AsyncState<List<PantryEntry>> entriesStatus;
/// Quản lý trạng thái của các hành động CUD (Create, Update, Delete).
@override@JsonKey() final  AsyncState<void> mutationStatus;

/// Create a copy of PantryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PantryStateCopyWith<_PantryState> get copyWith => __$PantryStateCopyWithImpl<_PantryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PantryState&&(identical(other.entriesStatus, entriesStatus) || other.entriesStatus == entriesStatus)&&(identical(other.mutationStatus, mutationStatus) || other.mutationStatus == mutationStatus));
}


@override
int get hashCode => Object.hash(runtimeType,entriesStatus,mutationStatus);

@override
String toString() {
  return 'PantryState(entriesStatus: $entriesStatus, mutationStatus: $mutationStatus)';
}


}

/// @nodoc
abstract mixin class _$PantryStateCopyWith<$Res> implements $PantryStateCopyWith<$Res> {
  factory _$PantryStateCopyWith(_PantryState value, $Res Function(_PantryState) _then) = __$PantryStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<List<PantryEntry>> entriesStatus, AsyncState<void> mutationStatus
});


@override $AsyncStateCopyWith<List<PantryEntry>, $Res> get entriesStatus;@override $AsyncStateCopyWith<void, $Res> get mutationStatus;

}
/// @nodoc
class __$PantryStateCopyWithImpl<$Res>
    implements _$PantryStateCopyWith<$Res> {
  __$PantryStateCopyWithImpl(this._self, this._then);

  final _PantryState _self;
  final $Res Function(_PantryState) _then;

/// Create a copy of PantryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entriesStatus = null,Object? mutationStatus = null,}) {
  return _then(_PantryState(
entriesStatus: null == entriesStatus ? _self.entriesStatus : entriesStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<List<PantryEntry>>,mutationStatus: null == mutationStatus ? _self.mutationStatus : mutationStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,
  ));
}

/// Create a copy of PantryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<PantryEntry>, $Res> get entriesStatus {
  
  return $AsyncStateCopyWith<List<PantryEntry>, $Res>(_self.entriesStatus, (value) {
    return _then(_self.copyWith(entriesStatus: value));
  });
}/// Create a copy of PantryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get mutationStatus {
  
  return $AsyncStateCopyWith<void, $Res>(_self.mutationStatus, (value) {
    return _then(_self.copyWith(mutationStatus: value));
  });
}
}

// dart format on
