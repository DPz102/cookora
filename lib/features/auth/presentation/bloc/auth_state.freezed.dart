// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {

// Một thuộc tính duy nhất để quản lý trạng thái của các request
 AsyncState<void> get requestStatus;// Thuộc tính để gửi tín hiệu thành công cho UI
 AuthSuccessSignal get successSignal;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.requestStatus, requestStatus) || other.requestStatus == requestStatus)&&(identical(other.successSignal, successSignal) || other.successSignal == successSignal));
}


@override
int get hashCode => Object.hash(runtimeType,requestStatus,successSignal);

@override
String toString() {
  return 'AuthState(requestStatus: $requestStatus, successSignal: $successSignal)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<void> requestStatus, AuthSuccessSignal successSignal
});


$AsyncStateCopyWith<void, $Res> get requestStatus;

}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestStatus = null,Object? successSignal = null,}) {
  return _then(_self.copyWith(
requestStatus: null == requestStatus ? _self.requestStatus : requestStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,successSignal: null == successSignal ? _self.successSignal : successSignal // ignore: cast_nullable_to_non_nullable
as AuthSuccessSignal,
  ));
}
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get requestStatus {
  
  return $AsyncStateCopyWith<void, $Res>(_self.requestStatus, (value) {
    return _then(_self.copyWith(requestStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Authenticated value)?  authenticated,TResult Function( Unauthenticated value)?  unauthenticated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Authenticated() when authenticated != null:
return authenticated(_that);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Authenticated value)  authenticated,required TResult Function( Unauthenticated value)  unauthenticated,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Authenticated():
return authenticated(_that);case Unauthenticated():
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Authenticated value)?  authenticated,TResult? Function( Unauthenticated value)?  unauthenticated,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Authenticated() when authenticated != null:
return authenticated(_that);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AsyncState<void> requestStatus,  AuthSuccessSignal successSignal)?  initial,TResult Function( firebase.User user,  AsyncState<void> requestStatus,  AuthSuccessSignal successSignal)?  authenticated,TResult Function( AsyncState<void> requestStatus,  AuthSuccessSignal successSignal)?  unauthenticated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.requestStatus,_that.successSignal);case Authenticated() when authenticated != null:
return authenticated(_that.user,_that.requestStatus,_that.successSignal);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that.requestStatus,_that.successSignal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AsyncState<void> requestStatus,  AuthSuccessSignal successSignal)  initial,required TResult Function( firebase.User user,  AsyncState<void> requestStatus,  AuthSuccessSignal successSignal)  authenticated,required TResult Function( AsyncState<void> requestStatus,  AuthSuccessSignal successSignal)  unauthenticated,}) {final _that = this;
switch (_that) {
case Initial():
return initial(_that.requestStatus,_that.successSignal);case Authenticated():
return authenticated(_that.user,_that.requestStatus,_that.successSignal);case Unauthenticated():
return unauthenticated(_that.requestStatus,_that.successSignal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AsyncState<void> requestStatus,  AuthSuccessSignal successSignal)?  initial,TResult? Function( firebase.User user,  AsyncState<void> requestStatus,  AuthSuccessSignal successSignal)?  authenticated,TResult? Function( AsyncState<void> requestStatus,  AuthSuccessSignal successSignal)?  unauthenticated,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.requestStatus,_that.successSignal);case Authenticated() when authenticated != null:
return authenticated(_that.user,_that.requestStatus,_that.successSignal);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that.requestStatus,_that.successSignal);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements AuthState {
  const Initial({this.requestStatus = const AsyncInitial(), this.successSignal = AuthSuccessSignal.none});
  

@override@JsonKey() final  AsyncState<void> requestStatus;
@override@JsonKey() final  AuthSuccessSignal successSignal;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialCopyWith<Initial> get copyWith => _$InitialCopyWithImpl<Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial&&(identical(other.requestStatus, requestStatus) || other.requestStatus == requestStatus)&&(identical(other.successSignal, successSignal) || other.successSignal == successSignal));
}


@override
int get hashCode => Object.hash(runtimeType,requestStatus,successSignal);

@override
String toString() {
  return 'AuthState.initial(requestStatus: $requestStatus, successSignal: $successSignal)';
}


}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) = _$InitialCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<void> requestStatus, AuthSuccessSignal successSignal
});


@override $AsyncStateCopyWith<void, $Res> get requestStatus;

}
/// @nodoc
class _$InitialCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final Initial _self;
  final $Res Function(Initial) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestStatus = null,Object? successSignal = null,}) {
  return _then(Initial(
requestStatus: null == requestStatus ? _self.requestStatus : requestStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,successSignal: null == successSignal ? _self.successSignal : successSignal // ignore: cast_nullable_to_non_nullable
as AuthSuccessSignal,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get requestStatus {
  
  return $AsyncStateCopyWith<void, $Res>(_self.requestStatus, (value) {
    return _then(_self.copyWith(requestStatus: value));
  });
}
}

/// @nodoc


class Authenticated implements AuthState {
  const Authenticated({required this.user, this.requestStatus = const AsyncInitial(), this.successSignal = AuthSuccessSignal.none});
  

 final  firebase.User user;
// Một thuộc tính duy nhất để quản lý trạng thái của các request
@override@JsonKey() final  AsyncState<void> requestStatus;
// Thuộc tính để gửi tín hiệu thành công cho UI
@override@JsonKey() final  AuthSuccessSignal successSignal;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticatedCopyWith<Authenticated> get copyWith => _$AuthenticatedCopyWithImpl<Authenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Authenticated&&(identical(other.user, user) || other.user == user)&&(identical(other.requestStatus, requestStatus) || other.requestStatus == requestStatus)&&(identical(other.successSignal, successSignal) || other.successSignal == successSignal));
}


@override
int get hashCode => Object.hash(runtimeType,user,requestStatus,successSignal);

@override
String toString() {
  return 'AuthState.authenticated(user: $user, requestStatus: $requestStatus, successSignal: $successSignal)';
}


}

/// @nodoc
abstract mixin class $AuthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthenticatedCopyWith(Authenticated value, $Res Function(Authenticated) _then) = _$AuthenticatedCopyWithImpl;
@override @useResult
$Res call({
 firebase.User user, AsyncState<void> requestStatus, AuthSuccessSignal successSignal
});


@override $AsyncStateCopyWith<void, $Res> get requestStatus;

}
/// @nodoc
class _$AuthenticatedCopyWithImpl<$Res>
    implements $AuthenticatedCopyWith<$Res> {
  _$AuthenticatedCopyWithImpl(this._self, this._then);

  final Authenticated _self;
  final $Res Function(Authenticated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? requestStatus = null,Object? successSignal = null,}) {
  return _then(Authenticated(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as firebase.User,requestStatus: null == requestStatus ? _self.requestStatus : requestStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,successSignal: null == successSignal ? _self.successSignal : successSignal // ignore: cast_nullable_to_non_nullable
as AuthSuccessSignal,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get requestStatus {
  
  return $AsyncStateCopyWith<void, $Res>(_self.requestStatus, (value) {
    return _then(_self.copyWith(requestStatus: value));
  });
}
}

/// @nodoc


class Unauthenticated implements AuthState {
  const Unauthenticated({this.requestStatus = const AsyncInitial(), this.successSignal = AuthSuccessSignal.none});
  

@override@JsonKey() final  AsyncState<void> requestStatus;
@override@JsonKey() final  AuthSuccessSignal successSignal;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthenticatedCopyWith<Unauthenticated> get copyWith => _$UnauthenticatedCopyWithImpl<Unauthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unauthenticated&&(identical(other.requestStatus, requestStatus) || other.requestStatus == requestStatus)&&(identical(other.successSignal, successSignal) || other.successSignal == successSignal));
}


@override
int get hashCode => Object.hash(runtimeType,requestStatus,successSignal);

@override
String toString() {
  return 'AuthState.unauthenticated(requestStatus: $requestStatus, successSignal: $successSignal)';
}


}

/// @nodoc
abstract mixin class $UnauthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $UnauthenticatedCopyWith(Unauthenticated value, $Res Function(Unauthenticated) _then) = _$UnauthenticatedCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<void> requestStatus, AuthSuccessSignal successSignal
});


@override $AsyncStateCopyWith<void, $Res> get requestStatus;

}
/// @nodoc
class _$UnauthenticatedCopyWithImpl<$Res>
    implements $UnauthenticatedCopyWith<$Res> {
  _$UnauthenticatedCopyWithImpl(this._self, this._then);

  final Unauthenticated _self;
  final $Res Function(Unauthenticated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestStatus = null,Object? successSignal = null,}) {
  return _then(Unauthenticated(
requestStatus: null == requestStatus ? _self.requestStatus : requestStatus // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,successSignal: null == successSignal ? _self.successSignal : successSignal // ignore: cast_nullable_to_non_nullable
as AuthSuccessSignal,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get requestStatus {
  
  return $AsyncStateCopyWith<void, $Res>(_self.requestStatus, (value) {
    return _then(_self.copyWith(requestStatus: value));
  });
}
}

// dart format on
