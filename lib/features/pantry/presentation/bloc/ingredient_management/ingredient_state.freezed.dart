// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IngredientState {

 AsyncState<Map<String, Ingredient>> get ingredientsMap;
/// Create a copy of IngredientState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientStateCopyWith<IngredientState> get copyWith => _$IngredientStateCopyWithImpl<IngredientState>(this as IngredientState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientState&&(identical(other.ingredientsMap, ingredientsMap) || other.ingredientsMap == ingredientsMap));
}


@override
int get hashCode => Object.hash(runtimeType,ingredientsMap);

@override
String toString() {
  return 'IngredientState(ingredientsMap: $ingredientsMap)';
}


}

/// @nodoc
abstract mixin class $IngredientStateCopyWith<$Res>  {
  factory $IngredientStateCopyWith(IngredientState value, $Res Function(IngredientState) _then) = _$IngredientStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<Map<String, Ingredient>> ingredientsMap
});


$AsyncStateCopyWith<Map<String, Ingredient>, $Res> get ingredientsMap;

}
/// @nodoc
class _$IngredientStateCopyWithImpl<$Res>
    implements $IngredientStateCopyWith<$Res> {
  _$IngredientStateCopyWithImpl(this._self, this._then);

  final IngredientState _self;
  final $Res Function(IngredientState) _then;

/// Create a copy of IngredientState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ingredientsMap = null,}) {
  return _then(_self.copyWith(
ingredientsMap: null == ingredientsMap ? _self.ingredientsMap : ingredientsMap // ignore: cast_nullable_to_non_nullable
as AsyncState<Map<String, Ingredient>>,
  ));
}
/// Create a copy of IngredientState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<Map<String, Ingredient>, $Res> get ingredientsMap {
  
  return $AsyncStateCopyWith<Map<String, Ingredient>, $Res>(_self.ingredientsMap, (value) {
    return _then(_self.copyWith(ingredientsMap: value));
  });
}
}


/// Adds pattern-matching-related methods to [IngredientState].
extension IngredientStatePatterns on IngredientState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IngredientState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IngredientState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IngredientState value)  $default,){
final _that = this;
switch (_that) {
case _IngredientState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IngredientState value)?  $default,){
final _that = this;
switch (_that) {
case _IngredientState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncState<Map<String, Ingredient>> ingredientsMap)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IngredientState() when $default != null:
return $default(_that.ingredientsMap);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncState<Map<String, Ingredient>> ingredientsMap)  $default,) {final _that = this;
switch (_that) {
case _IngredientState():
return $default(_that.ingredientsMap);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncState<Map<String, Ingredient>> ingredientsMap)?  $default,) {final _that = this;
switch (_that) {
case _IngredientState() when $default != null:
return $default(_that.ingredientsMap);case _:
  return null;

}
}

}

/// @nodoc


class _IngredientState implements IngredientState {
  const _IngredientState({this.ingredientsMap = const AsyncInitial()});
  

@override@JsonKey() final  AsyncState<Map<String, Ingredient>> ingredientsMap;

/// Create a copy of IngredientState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientStateCopyWith<_IngredientState> get copyWith => __$IngredientStateCopyWithImpl<_IngredientState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientState&&(identical(other.ingredientsMap, ingredientsMap) || other.ingredientsMap == ingredientsMap));
}


@override
int get hashCode => Object.hash(runtimeType,ingredientsMap);

@override
String toString() {
  return 'IngredientState(ingredientsMap: $ingredientsMap)';
}


}

/// @nodoc
abstract mixin class _$IngredientStateCopyWith<$Res> implements $IngredientStateCopyWith<$Res> {
  factory _$IngredientStateCopyWith(_IngredientState value, $Res Function(_IngredientState) _then) = __$IngredientStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<Map<String, Ingredient>> ingredientsMap
});


@override $AsyncStateCopyWith<Map<String, Ingredient>, $Res> get ingredientsMap;

}
/// @nodoc
class __$IngredientStateCopyWithImpl<$Res>
    implements _$IngredientStateCopyWith<$Res> {
  __$IngredientStateCopyWithImpl(this._self, this._then);

  final _IngredientState _self;
  final $Res Function(_IngredientState) _then;

/// Create a copy of IngredientState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ingredientsMap = null,}) {
  return _then(_IngredientState(
ingredientsMap: null == ingredientsMap ? _self.ingredientsMap : ingredientsMap // ignore: cast_nullable_to_non_nullable
as AsyncState<Map<String, Ingredient>>,
  ));
}

/// Create a copy of IngredientState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<Map<String, Ingredient>, $Res> get ingredientsMap {
  
  return $AsyncStateCopyWith<Map<String, Ingredient>, $Res>(_self.ingredientsMap, (value) {
    return _then(_self.copyWith(ingredientsMap: value));
  });
}
}

// dart format on
