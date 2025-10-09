// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggestion_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SuggestionState {

// Theo dõi trạng thái của danh sách gợi ý món ăn.
 AsyncState<List<RecipeEntity>> get suggestionsStatus;
/// Create a copy of SuggestionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuggestionStateCopyWith<SuggestionState> get copyWith => _$SuggestionStateCopyWithImpl<SuggestionState>(this as SuggestionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuggestionState&&(identical(other.suggestionsStatus, suggestionsStatus) || other.suggestionsStatus == suggestionsStatus));
}


@override
int get hashCode => Object.hash(runtimeType,suggestionsStatus);

@override
String toString() {
  return 'SuggestionState(suggestionsStatus: $suggestionsStatus)';
}


}

/// @nodoc
abstract mixin class $SuggestionStateCopyWith<$Res>  {
  factory $SuggestionStateCopyWith(SuggestionState value, $Res Function(SuggestionState) _then) = _$SuggestionStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<List<RecipeEntity>> suggestionsStatus
});


$AsyncStateCopyWith<List<RecipeEntity>, $Res> get suggestionsStatus;

}
/// @nodoc
class _$SuggestionStateCopyWithImpl<$Res>
    implements $SuggestionStateCopyWith<$Res> {
  _$SuggestionStateCopyWithImpl(this._self, this._then);

  final SuggestionState _self;
  final $Res Function(SuggestionState) _then;

/// Create a copy of SuggestionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? suggestionsStatus = null,}) {
  return _then(_self.copyWith(
suggestionsStatus: null == suggestionsStatus ? _self.suggestionsStatus : suggestionsStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<List<RecipeEntity>>,
  ));
}
/// Create a copy of SuggestionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<RecipeEntity>, $Res> get suggestionsStatus {
  
  return $AsyncStateCopyWith<List<RecipeEntity>, $Res>(_self.suggestionsStatus, (value) {
    return _then(_self.copyWith(suggestionsStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [SuggestionState].
extension SuggestionStatePatterns on SuggestionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SuggestionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SuggestionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SuggestionState value)  $default,){
final _that = this;
switch (_that) {
case _SuggestionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SuggestionState value)?  $default,){
final _that = this;
switch (_that) {
case _SuggestionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncState<List<RecipeEntity>> suggestionsStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SuggestionState() when $default != null:
return $default(_that.suggestionsStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncState<List<RecipeEntity>> suggestionsStatus)  $default,) {final _that = this;
switch (_that) {
case _SuggestionState():
return $default(_that.suggestionsStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncState<List<RecipeEntity>> suggestionsStatus)?  $default,) {final _that = this;
switch (_that) {
case _SuggestionState() when $default != null:
return $default(_that.suggestionsStatus);case _:
  return null;

}
}

}

/// @nodoc


class _SuggestionState implements SuggestionState {
  const _SuggestionState({this.suggestionsStatus = const AsyncInitial()});
  

// Theo dõi trạng thái của danh sách gợi ý món ăn.
@override@JsonKey() final  AsyncState<List<RecipeEntity>> suggestionsStatus;

/// Create a copy of SuggestionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuggestionStateCopyWith<_SuggestionState> get copyWith => __$SuggestionStateCopyWithImpl<_SuggestionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuggestionState&&(identical(other.suggestionsStatus, suggestionsStatus) || other.suggestionsStatus == suggestionsStatus));
}


@override
int get hashCode => Object.hash(runtimeType,suggestionsStatus);

@override
String toString() {
  return 'SuggestionState(suggestionsStatus: $suggestionsStatus)';
}


}

/// @nodoc
abstract mixin class _$SuggestionStateCopyWith<$Res> implements $SuggestionStateCopyWith<$Res> {
  factory _$SuggestionStateCopyWith(_SuggestionState value, $Res Function(_SuggestionState) _then) = __$SuggestionStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<List<RecipeEntity>> suggestionsStatus
});


@override $AsyncStateCopyWith<List<RecipeEntity>, $Res> get suggestionsStatus;

}
/// @nodoc
class __$SuggestionStateCopyWithImpl<$Res>
    implements _$SuggestionStateCopyWith<$Res> {
  __$SuggestionStateCopyWithImpl(this._self, this._then);

  final _SuggestionState _self;
  final $Res Function(_SuggestionState) _then;

/// Create a copy of SuggestionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? suggestionsStatus = null,}) {
  return _then(_SuggestionState(
suggestionsStatus: null == suggestionsStatus ? _self.suggestionsStatus : suggestionsStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<List<RecipeEntity>>,
  ));
}

/// Create a copy of SuggestionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<RecipeEntity>, $Res> get suggestionsStatus {
  
  return $AsyncStateCopyWith<List<RecipeEntity>, $Res>(_self.suggestionsStatus, (value) {
    return _then(_self.copyWith(suggestionsStatus: value));
  });
}
}

// dart format on
