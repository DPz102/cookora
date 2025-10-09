// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kitchen_log_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KitchenLogState {

 AsyncState<List<RecipeEntity>> get logStatus;
/// Create a copy of KitchenLogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KitchenLogStateCopyWith<KitchenLogState> get copyWith => _$KitchenLogStateCopyWithImpl<KitchenLogState>(this as KitchenLogState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KitchenLogState&&(identical(other.logStatus, logStatus) || other.logStatus == logStatus));
}


@override
int get hashCode => Object.hash(runtimeType,logStatus);

@override
String toString() {
  return 'KitchenLogState(logStatus: $logStatus)';
}


}

/// @nodoc
abstract mixin class $KitchenLogStateCopyWith<$Res>  {
  factory $KitchenLogStateCopyWith(KitchenLogState value, $Res Function(KitchenLogState) _then) = _$KitchenLogStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<List<RecipeEntity>> logStatus
});


$AsyncStateCopyWith<List<RecipeEntity>, $Res> get logStatus;

}
/// @nodoc
class _$KitchenLogStateCopyWithImpl<$Res>
    implements $KitchenLogStateCopyWith<$Res> {
  _$KitchenLogStateCopyWithImpl(this._self, this._then);

  final KitchenLogState _self;
  final $Res Function(KitchenLogState) _then;

/// Create a copy of KitchenLogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? logStatus = null,}) {
  return _then(_self.copyWith(
logStatus: null == logStatus ? _self.logStatus : logStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<List<RecipeEntity>>,
  ));
}
/// Create a copy of KitchenLogState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<RecipeEntity>, $Res> get logStatus {
  
  return $AsyncStateCopyWith<List<RecipeEntity>, $Res>(_self.logStatus, (value) {
    return _then(_self.copyWith(logStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [KitchenLogState].
extension KitchenLogStatePatterns on KitchenLogState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KitchenLogState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KitchenLogState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KitchenLogState value)  $default,){
final _that = this;
switch (_that) {
case _KitchenLogState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KitchenLogState value)?  $default,){
final _that = this;
switch (_that) {
case _KitchenLogState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncState<List<RecipeEntity>> logStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KitchenLogState() when $default != null:
return $default(_that.logStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncState<List<RecipeEntity>> logStatus)  $default,) {final _that = this;
switch (_that) {
case _KitchenLogState():
return $default(_that.logStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncState<List<RecipeEntity>> logStatus)?  $default,) {final _that = this;
switch (_that) {
case _KitchenLogState() when $default != null:
return $default(_that.logStatus);case _:
  return null;

}
}

}

/// @nodoc


class _KitchenLogState implements KitchenLogState {
  const _KitchenLogState({this.logStatus = const AsyncInitial()});
  

@override@JsonKey() final  AsyncState<List<RecipeEntity>> logStatus;

/// Create a copy of KitchenLogState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KitchenLogStateCopyWith<_KitchenLogState> get copyWith => __$KitchenLogStateCopyWithImpl<_KitchenLogState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KitchenLogState&&(identical(other.logStatus, logStatus) || other.logStatus == logStatus));
}


@override
int get hashCode => Object.hash(runtimeType,logStatus);

@override
String toString() {
  return 'KitchenLogState(logStatus: $logStatus)';
}


}

/// @nodoc
abstract mixin class _$KitchenLogStateCopyWith<$Res> implements $KitchenLogStateCopyWith<$Res> {
  factory _$KitchenLogStateCopyWith(_KitchenLogState value, $Res Function(_KitchenLogState) _then) = __$KitchenLogStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<List<RecipeEntity>> logStatus
});


@override $AsyncStateCopyWith<List<RecipeEntity>, $Res> get logStatus;

}
/// @nodoc
class __$KitchenLogStateCopyWithImpl<$Res>
    implements _$KitchenLogStateCopyWith<$Res> {
  __$KitchenLogStateCopyWithImpl(this._self, this._then);

  final _KitchenLogState _self;
  final $Res Function(_KitchenLogState) _then;

/// Create a copy of KitchenLogState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? logStatus = null,}) {
  return _then(_KitchenLogState(
logStatus: null == logStatus ? _self.logStatus : logStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<List<RecipeEntity>>,
  ));
}

/// Create a copy of KitchenLogState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<RecipeEntity>, $Res> get logStatus {
  
  return $AsyncStateCopyWith<List<RecipeEntity>, $Res>(_self.logStatus, (value) {
    return _then(_self.copyWith(logStatus: value));
  });
}
}

// dart format on
