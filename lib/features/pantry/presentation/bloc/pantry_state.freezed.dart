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

// Thay đổi kiểu dữ liệu ở đây
 AsyncState<List<PantryDisplayEntry>> get displayEntriesStatus;// Giữ nguyên mutationStatus
 AsyncState<void> get mutationStatus;
/// Create a copy of PantryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PantryStateCopyWith<PantryState> get copyWith => _$PantryStateCopyWithImpl<PantryState>(this as PantryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PantryState&&(identical(other.displayEntriesStatus, displayEntriesStatus) || other.displayEntriesStatus == displayEntriesStatus)&&(identical(other.mutationStatus, mutationStatus) || other.mutationStatus == mutationStatus));
}


@override
int get hashCode => Object.hash(runtimeType,displayEntriesStatus,mutationStatus);

@override
String toString() {
  return 'PantryState(displayEntriesStatus: $displayEntriesStatus, mutationStatus: $mutationStatus)';
}


}

/// @nodoc
abstract mixin class $PantryStateCopyWith<$Res>  {
  factory $PantryStateCopyWith(PantryState value, $Res Function(PantryState) _then) = _$PantryStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<List<PantryDisplayEntry>> displayEntriesStatus, AsyncState<void> mutationStatus
});


$AsyncStateCopyWith<List<PantryDisplayEntry>, $Res> get displayEntriesStatus;$AsyncStateCopyWith<void, $Res> get mutationStatus;

}
/// @nodoc
class _$PantryStateCopyWithImpl<$Res>
    implements $PantryStateCopyWith<$Res> {
  _$PantryStateCopyWithImpl(this._self, this._then);

  final PantryState _self;
  final $Res Function(PantryState) _then;

/// Create a copy of PantryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? displayEntriesStatus = null,Object? mutationStatus = null,}) {
  return _then(_self.copyWith(
displayEntriesStatus: null == displayEntriesStatus ? _self.displayEntriesStatus : displayEntriesStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<List<PantryDisplayEntry>>,mutationStatus: null == mutationStatus ? _self.mutationStatus : mutationStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,
  ));
}
/// Create a copy of PantryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<PantryDisplayEntry>, $Res> get displayEntriesStatus {
  
  return $AsyncStateCopyWith<List<PantryDisplayEntry>, $Res>(_self.displayEntriesStatus, (value) {
    return _then(_self.copyWith(displayEntriesStatus: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncState<List<PantryDisplayEntry>> displayEntriesStatus,  AsyncState<void> mutationStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PantryState() when $default != null:
return $default(_that.displayEntriesStatus,_that.mutationStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncState<List<PantryDisplayEntry>> displayEntriesStatus,  AsyncState<void> mutationStatus)  $default,) {final _that = this;
switch (_that) {
case _PantryState():
return $default(_that.displayEntriesStatus,_that.mutationStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncState<List<PantryDisplayEntry>> displayEntriesStatus,  AsyncState<void> mutationStatus)?  $default,) {final _that = this;
switch (_that) {
case _PantryState() when $default != null:
return $default(_that.displayEntriesStatus,_that.mutationStatus);case _:
  return null;

}
}

}

/// @nodoc


class _PantryState implements PantryState {
  const _PantryState({this.displayEntriesStatus = const AsyncInitial(), this.mutationStatus = const AsyncInitial()});
  

// Thay đổi kiểu dữ liệu ở đây
@override@JsonKey() final  AsyncState<List<PantryDisplayEntry>> displayEntriesStatus;
// Giữ nguyên mutationStatus
@override@JsonKey() final  AsyncState<void> mutationStatus;

/// Create a copy of PantryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PantryStateCopyWith<_PantryState> get copyWith => __$PantryStateCopyWithImpl<_PantryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PantryState&&(identical(other.displayEntriesStatus, displayEntriesStatus) || other.displayEntriesStatus == displayEntriesStatus)&&(identical(other.mutationStatus, mutationStatus) || other.mutationStatus == mutationStatus));
}


@override
int get hashCode => Object.hash(runtimeType,displayEntriesStatus,mutationStatus);

@override
String toString() {
  return 'PantryState(displayEntriesStatus: $displayEntriesStatus, mutationStatus: $mutationStatus)';
}


}

/// @nodoc
abstract mixin class _$PantryStateCopyWith<$Res> implements $PantryStateCopyWith<$Res> {
  factory _$PantryStateCopyWith(_PantryState value, $Res Function(_PantryState) _then) = __$PantryStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<List<PantryDisplayEntry>> displayEntriesStatus, AsyncState<void> mutationStatus
});


@override $AsyncStateCopyWith<List<PantryDisplayEntry>, $Res> get displayEntriesStatus;@override $AsyncStateCopyWith<void, $Res> get mutationStatus;

}
/// @nodoc
class __$PantryStateCopyWithImpl<$Res>
    implements _$PantryStateCopyWith<$Res> {
  __$PantryStateCopyWithImpl(this._self, this._then);

  final _PantryState _self;
  final $Res Function(_PantryState) _then;

/// Create a copy of PantryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? displayEntriesStatus = null,Object? mutationStatus = null,}) {
  return _then(_PantryState(
displayEntriesStatus: null == displayEntriesStatus ? _self.displayEntriesStatus : displayEntriesStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<List<PantryDisplayEntry>>,mutationStatus: null == mutationStatus ? _self.mutationStatus : mutationStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,
  ));
}

/// Create a copy of PantryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<PantryDisplayEntry>, $Res> get displayEntriesStatus {
  
  return $AsyncStateCopyWith<List<PantryDisplayEntry>, $Res>(_self.displayEntriesStatus, (value) {
    return _then(_self.copyWith(displayEntriesStatus: value));
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
