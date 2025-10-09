// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommunityState {

// Trạng thái của danh sách bài đăng.
 AsyncState<List<PostEntity>> get feedStatus;// Trạng thái của hành động tạo bài đăng.
 AsyncState<void> get createPostStatus;
/// Create a copy of CommunityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunityStateCopyWith<CommunityState> get copyWith => _$CommunityStateCopyWithImpl<CommunityState>(this as CommunityState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityState&&(identical(other.feedStatus, feedStatus) || other.feedStatus == feedStatus)&&(identical(other.createPostStatus, createPostStatus) || other.createPostStatus == createPostStatus));
}


@override
int get hashCode => Object.hash(runtimeType,feedStatus,createPostStatus);

@override
String toString() {
  return 'CommunityState(feedStatus: $feedStatus, createPostStatus: $createPostStatus)';
}


}

/// @nodoc
abstract mixin class $CommunityStateCopyWith<$Res>  {
  factory $CommunityStateCopyWith(CommunityState value, $Res Function(CommunityState) _then) = _$CommunityStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<List<PostEntity>> feedStatus, AsyncState<void> createPostStatus
});


$AsyncStateCopyWith<List<PostEntity>, $Res> get feedStatus;$AsyncStateCopyWith<void, $Res> get createPostStatus;

}
/// @nodoc
class _$CommunityStateCopyWithImpl<$Res>
    implements $CommunityStateCopyWith<$Res> {
  _$CommunityStateCopyWithImpl(this._self, this._then);

  final CommunityState _self;
  final $Res Function(CommunityState) _then;

/// Create a copy of CommunityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? feedStatus = null,Object? createPostStatus = null,}) {
  return _then(_self.copyWith(
feedStatus: null == feedStatus ? _self.feedStatus : feedStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<List<PostEntity>>,createPostStatus: null == createPostStatus ? _self.createPostStatus : createPostStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,
  ));
}
/// Create a copy of CommunityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<PostEntity>, $Res> get feedStatus {
  
  return $AsyncStateCopyWith<List<PostEntity>, $Res>(_self.feedStatus, (value) {
    return _then(_self.copyWith(feedStatus: value));
  });
}/// Create a copy of CommunityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get createPostStatus {
  
  return $AsyncStateCopyWith<void, $Res>(_self.createPostStatus, (value) {
    return _then(_self.copyWith(createPostStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [CommunityState].
extension CommunityStatePatterns on CommunityState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommunityState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommunityState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommunityState value)  $default,){
final _that = this;
switch (_that) {
case _CommunityState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommunityState value)?  $default,){
final _that = this;
switch (_that) {
case _CommunityState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncState<List<PostEntity>> feedStatus,  AsyncState<void> createPostStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommunityState() when $default != null:
return $default(_that.feedStatus,_that.createPostStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncState<List<PostEntity>> feedStatus,  AsyncState<void> createPostStatus)  $default,) {final _that = this;
switch (_that) {
case _CommunityState():
return $default(_that.feedStatus,_that.createPostStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncState<List<PostEntity>> feedStatus,  AsyncState<void> createPostStatus)?  $default,) {final _that = this;
switch (_that) {
case _CommunityState() when $default != null:
return $default(_that.feedStatus,_that.createPostStatus);case _:
  return null;

}
}

}

/// @nodoc


class _CommunityState implements CommunityState {
  const _CommunityState({this.feedStatus = const AsyncInitial(), this.createPostStatus = const AsyncInitial()});
  

// Trạng thái của danh sách bài đăng.
@override@JsonKey() final  AsyncState<List<PostEntity>> feedStatus;
// Trạng thái của hành động tạo bài đăng.
@override@JsonKey() final  AsyncState<void> createPostStatus;

/// Create a copy of CommunityState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommunityStateCopyWith<_CommunityState> get copyWith => __$CommunityStateCopyWithImpl<_CommunityState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommunityState&&(identical(other.feedStatus, feedStatus) || other.feedStatus == feedStatus)&&(identical(other.createPostStatus, createPostStatus) || other.createPostStatus == createPostStatus));
}


@override
int get hashCode => Object.hash(runtimeType,feedStatus,createPostStatus);

@override
String toString() {
  return 'CommunityState(feedStatus: $feedStatus, createPostStatus: $createPostStatus)';
}


}

/// @nodoc
abstract mixin class _$CommunityStateCopyWith<$Res> implements $CommunityStateCopyWith<$Res> {
  factory _$CommunityStateCopyWith(_CommunityState value, $Res Function(_CommunityState) _then) = __$CommunityStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<List<PostEntity>> feedStatus, AsyncState<void> createPostStatus
});


@override $AsyncStateCopyWith<List<PostEntity>, $Res> get feedStatus;@override $AsyncStateCopyWith<void, $Res> get createPostStatus;

}
/// @nodoc
class __$CommunityStateCopyWithImpl<$Res>
    implements _$CommunityStateCopyWith<$Res> {
  __$CommunityStateCopyWithImpl(this._self, this._then);

  final _CommunityState _self;
  final $Res Function(_CommunityState) _then;

/// Create a copy of CommunityState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? feedStatus = null,Object? createPostStatus = null,}) {
  return _then(_CommunityState(
feedStatus: null == feedStatus ? _self.feedStatus : feedStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<List<PostEntity>>,createPostStatus: null == createPostStatus ? _self.createPostStatus : createPostStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,
  ));
}

/// Create a copy of CommunityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<PostEntity>, $Res> get feedStatus {
  
  return $AsyncStateCopyWith<List<PostEntity>, $Res>(_self.feedStatus, (value) {
    return _then(_self.copyWith(feedStatus: value));
  });
}/// Create a copy of CommunityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get createPostStatus {
  
  return $AsyncStateCopyWith<void, $Res>(_self.createPostStatus, (value) {
    return _then(_self.copyWith(createPostStatus: value));
  });
}
}

// dart format on
