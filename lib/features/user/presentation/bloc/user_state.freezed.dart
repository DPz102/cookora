// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserState {

// Trạng thái của thông tin profile (UserEntity).
 AsyncState<UserEntity> get profileStatus;// Trạng thái của danh sách bài đăng.
 AsyncState<List<PostEntity>> get postsStatus;// Trạng thái của hành động cập nhật profile.
 AsyncState<void> get updateProfileStatus;// Theo dõi quá trình tải avatar.
 bool get isUploadingAvatar;
/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserStateCopyWith<UserState> get copyWith => _$UserStateCopyWithImpl<UserState>(this as UserState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserState&&(identical(other.profileStatus, profileStatus) || other.profileStatus == profileStatus)&&(identical(other.postsStatus, postsStatus) || other.postsStatus == postsStatus)&&(identical(other.updateProfileStatus, updateProfileStatus) || other.updateProfileStatus == updateProfileStatus)&&(identical(other.isUploadingAvatar, isUploadingAvatar) || other.isUploadingAvatar == isUploadingAvatar));
}


@override
int get hashCode => Object.hash(runtimeType,profileStatus,postsStatus,updateProfileStatus,isUploadingAvatar);

@override
String toString() {
  return 'UserState(profileStatus: $profileStatus, postsStatus: $postsStatus, updateProfileStatus: $updateProfileStatus, isUploadingAvatar: $isUploadingAvatar)';
}


}

/// @nodoc
abstract mixin class $UserStateCopyWith<$Res>  {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) _then) = _$UserStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<UserEntity> profileStatus, AsyncState<List<PostEntity>> postsStatus, AsyncState<void> updateProfileStatus, bool isUploadingAvatar
});


$AsyncStateCopyWith<UserEntity, $Res> get profileStatus;$AsyncStateCopyWith<List<PostEntity>, $Res> get postsStatus;$AsyncStateCopyWith<void, $Res> get updateProfileStatus;

}
/// @nodoc
class _$UserStateCopyWithImpl<$Res>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._self, this._then);

  final UserState _self;
  final $Res Function(UserState) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profileStatus = null,Object? postsStatus = null,Object? updateProfileStatus = null,Object? isUploadingAvatar = null,}) {
  return _then(_self.copyWith(
profileStatus: null == profileStatus ? _self.profileStatus : profileStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<UserEntity>,postsStatus: null == postsStatus ? _self.postsStatus : postsStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<List<PostEntity>>,updateProfileStatus: null == updateProfileStatus ? _self.updateProfileStatus : updateProfileStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,isUploadingAvatar: null == isUploadingAvatar ? _self.isUploadingAvatar : isUploadingAvatar // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<UserEntity, $Res> get profileStatus {
  
  return $AsyncStateCopyWith<UserEntity, $Res>(_self.profileStatus, (value) {
    return _then(_self.copyWith(profileStatus: value));
  });
}/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<PostEntity>, $Res> get postsStatus {
  
  return $AsyncStateCopyWith<List<PostEntity>, $Res>(_self.postsStatus, (value) {
    return _then(_self.copyWith(postsStatus: value));
  });
}/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get updateProfileStatus {
  
  return $AsyncStateCopyWith<void, $Res>(_self.updateProfileStatus, (value) {
    return _then(_self.copyWith(updateProfileStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserState].
extension UserStatePatterns on UserState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserState value)  $default,){
final _that = this;
switch (_that) {
case _UserState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserState value)?  $default,){
final _that = this;
switch (_that) {
case _UserState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncState<UserEntity> profileStatus,  AsyncState<List<PostEntity>> postsStatus,  AsyncState<void> updateProfileStatus,  bool isUploadingAvatar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserState() when $default != null:
return $default(_that.profileStatus,_that.postsStatus,_that.updateProfileStatus,_that.isUploadingAvatar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncState<UserEntity> profileStatus,  AsyncState<List<PostEntity>> postsStatus,  AsyncState<void> updateProfileStatus,  bool isUploadingAvatar)  $default,) {final _that = this;
switch (_that) {
case _UserState():
return $default(_that.profileStatus,_that.postsStatus,_that.updateProfileStatus,_that.isUploadingAvatar);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncState<UserEntity> profileStatus,  AsyncState<List<PostEntity>> postsStatus,  AsyncState<void> updateProfileStatus,  bool isUploadingAvatar)?  $default,) {final _that = this;
switch (_that) {
case _UserState() when $default != null:
return $default(_that.profileStatus,_that.postsStatus,_that.updateProfileStatus,_that.isUploadingAvatar);case _:
  return null;

}
}

}

/// @nodoc


class _UserState implements UserState {
  const _UserState({this.profileStatus = const AsyncInitial(), this.postsStatus = const AsyncInitial(), this.updateProfileStatus = const AsyncInitial(), this.isUploadingAvatar = false});
  

// Trạng thái của thông tin profile (UserEntity).
@override@JsonKey() final  AsyncState<UserEntity> profileStatus;
// Trạng thái của danh sách bài đăng.
@override@JsonKey() final  AsyncState<List<PostEntity>> postsStatus;
// Trạng thái của hành động cập nhật profile.
@override@JsonKey() final  AsyncState<void> updateProfileStatus;
// Theo dõi quá trình tải avatar.
@override@JsonKey() final  bool isUploadingAvatar;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserStateCopyWith<_UserState> get copyWith => __$UserStateCopyWithImpl<_UserState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserState&&(identical(other.profileStatus, profileStatus) || other.profileStatus == profileStatus)&&(identical(other.postsStatus, postsStatus) || other.postsStatus == postsStatus)&&(identical(other.updateProfileStatus, updateProfileStatus) || other.updateProfileStatus == updateProfileStatus)&&(identical(other.isUploadingAvatar, isUploadingAvatar) || other.isUploadingAvatar == isUploadingAvatar));
}


@override
int get hashCode => Object.hash(runtimeType,profileStatus,postsStatus,updateProfileStatus,isUploadingAvatar);

@override
String toString() {
  return 'UserState(profileStatus: $profileStatus, postsStatus: $postsStatus, updateProfileStatus: $updateProfileStatus, isUploadingAvatar: $isUploadingAvatar)';
}


}

/// @nodoc
abstract mixin class _$UserStateCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$UserStateCopyWith(_UserState value, $Res Function(_UserState) _then) = __$UserStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<UserEntity> profileStatus, AsyncState<List<PostEntity>> postsStatus, AsyncState<void> updateProfileStatus, bool isUploadingAvatar
});


@override $AsyncStateCopyWith<UserEntity, $Res> get profileStatus;@override $AsyncStateCopyWith<List<PostEntity>, $Res> get postsStatus;@override $AsyncStateCopyWith<void, $Res> get updateProfileStatus;

}
/// @nodoc
class __$UserStateCopyWithImpl<$Res>
    implements _$UserStateCopyWith<$Res> {
  __$UserStateCopyWithImpl(this._self, this._then);

  final _UserState _self;
  final $Res Function(_UserState) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profileStatus = null,Object? postsStatus = null,Object? updateProfileStatus = null,Object? isUploadingAvatar = null,}) {
  return _then(_UserState(
profileStatus: null == profileStatus ? _self.profileStatus : profileStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<UserEntity>,postsStatus: null == postsStatus ? _self.postsStatus : postsStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<List<PostEntity>>,updateProfileStatus: null == updateProfileStatus ? _self.updateProfileStatus : updateProfileStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,isUploadingAvatar: null == isUploadingAvatar ? _self.isUploadingAvatar : isUploadingAvatar // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<UserEntity, $Res> get profileStatus {
  
  return $AsyncStateCopyWith<UserEntity, $Res>(_self.profileStatus, (value) {
    return _then(_self.copyWith(profileStatus: value));
  });
}/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<PostEntity>, $Res> get postsStatus {
  
  return $AsyncStateCopyWith<List<PostEntity>, $Res>(_self.postsStatus, (value) {
    return _then(_self.copyWith(postsStatus: value));
  });
}/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get updateProfileStatus {
  
  return $AsyncStateCopyWith<void, $Res>(_self.updateProfileStatus, (value) {
    return _then(_self.copyWith(updateProfileStatus: value));
  });
}
}

// dart format on
