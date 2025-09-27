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

 AsyncState<void> get authRequestState;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.authRequestState, authRequestState) || other.authRequestState == authRequestState));
}


@override
int get hashCode => Object.hash(runtimeType,authRequestState);

@override
String toString() {
  return 'AuthState(authRequestState: $authRequestState)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<void> authRequestState
});


$AsyncStateCopyWith<void, $Res> get authRequestState;

}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? authRequestState = null,}) {
  return _then(_self.copyWith(
authRequestState: null == authRequestState ? _self.authRequestState : authRequestState // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,
  ));
}
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get authRequestState {
  
  return $AsyncStateCopyWith<void, $Res>(_self.authRequestState, (value) {
    return _then(_self.copyWith(authRequestState: value));
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Authenticated value)?  authenticated,TResult Function( Unauthenticated value)?  unauthenticated,TResult Function( PasswordResetSuccess value)?  passwordResetSuccess,TResult Function( ChangePasswordSuccess value)?  changePasswordSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Authenticated() when authenticated != null:
return authenticated(_that);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case PasswordResetSuccess() when passwordResetSuccess != null:
return passwordResetSuccess(_that);case ChangePasswordSuccess() when changePasswordSuccess != null:
return changePasswordSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Authenticated value)  authenticated,required TResult Function( Unauthenticated value)  unauthenticated,required TResult Function( PasswordResetSuccess value)  passwordResetSuccess,required TResult Function( ChangePasswordSuccess value)  changePasswordSuccess,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Authenticated():
return authenticated(_that);case Unauthenticated():
return unauthenticated(_that);case PasswordResetSuccess():
return passwordResetSuccess(_that);case ChangePasswordSuccess():
return changePasswordSuccess(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Authenticated value)?  authenticated,TResult? Function( Unauthenticated value)?  unauthenticated,TResult? Function( PasswordResetSuccess value)?  passwordResetSuccess,TResult? Function( ChangePasswordSuccess value)?  changePasswordSuccess,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Authenticated() when authenticated != null:
return authenticated(_that);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case PasswordResetSuccess() when passwordResetSuccess != null:
return passwordResetSuccess(_that);case ChangePasswordSuccess() when changePasswordSuccess != null:
return changePasswordSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AsyncState<void> authRequestState)?  initial,TResult Function( firebase.User user,  AsyncState<void> authRequestState)?  authenticated,TResult Function( AsyncState<void> authRequestState)?  unauthenticated,TResult Function( AsyncState<void> authRequestState)?  passwordResetSuccess,TResult Function( AsyncState<void> authRequestState)?  changePasswordSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.authRequestState);case Authenticated() when authenticated != null:
return authenticated(_that.user,_that.authRequestState);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that.authRequestState);case PasswordResetSuccess() when passwordResetSuccess != null:
return passwordResetSuccess(_that.authRequestState);case ChangePasswordSuccess() when changePasswordSuccess != null:
return changePasswordSuccess(_that.authRequestState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AsyncState<void> authRequestState)  initial,required TResult Function( firebase.User user,  AsyncState<void> authRequestState)  authenticated,required TResult Function( AsyncState<void> authRequestState)  unauthenticated,required TResult Function( AsyncState<void> authRequestState)  passwordResetSuccess,required TResult Function( AsyncState<void> authRequestState)  changePasswordSuccess,}) {final _that = this;
switch (_that) {
case Initial():
return initial(_that.authRequestState);case Authenticated():
return authenticated(_that.user,_that.authRequestState);case Unauthenticated():
return unauthenticated(_that.authRequestState);case PasswordResetSuccess():
return passwordResetSuccess(_that.authRequestState);case ChangePasswordSuccess():
return changePasswordSuccess(_that.authRequestState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AsyncState<void> authRequestState)?  initial,TResult? Function( firebase.User user,  AsyncState<void> authRequestState)?  authenticated,TResult? Function( AsyncState<void> authRequestState)?  unauthenticated,TResult? Function( AsyncState<void> authRequestState)?  passwordResetSuccess,TResult? Function( AsyncState<void> authRequestState)?  changePasswordSuccess,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.authRequestState);case Authenticated() when authenticated != null:
return authenticated(_that.user,_that.authRequestState);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that.authRequestState);case PasswordResetSuccess() when passwordResetSuccess != null:
return passwordResetSuccess(_that.authRequestState);case ChangePasswordSuccess() when changePasswordSuccess != null:
return changePasswordSuccess(_that.authRequestState);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements AuthState {
  const Initial({this.authRequestState = const AsyncInitial()});
  

@override@JsonKey() final  AsyncState<void> authRequestState;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialCopyWith<Initial> get copyWith => _$InitialCopyWithImpl<Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial&&(identical(other.authRequestState, authRequestState) || other.authRequestState == authRequestState));
}


@override
int get hashCode => Object.hash(runtimeType,authRequestState);

@override
String toString() {
  return 'AuthState.initial(authRequestState: $authRequestState)';
}


}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) = _$InitialCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<void> authRequestState
});


@override $AsyncStateCopyWith<void, $Res> get authRequestState;

}
/// @nodoc
class _$InitialCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final Initial _self;
  final $Res Function(Initial) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authRequestState = null,}) {
  return _then(Initial(
authRequestState: null == authRequestState ? _self.authRequestState : authRequestState // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get authRequestState {
  
  return $AsyncStateCopyWith<void, $Res>(_self.authRequestState, (value) {
    return _then(_self.copyWith(authRequestState: value));
  });
}
}

/// @nodoc


class Authenticated implements AuthState {
  const Authenticated({required this.user, this.authRequestState = const AsyncInitial()});
  

 final  firebase.User user;
@override@JsonKey() final  AsyncState<void> authRequestState;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticatedCopyWith<Authenticated> get copyWith => _$AuthenticatedCopyWithImpl<Authenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Authenticated&&(identical(other.user, user) || other.user == user)&&(identical(other.authRequestState, authRequestState) || other.authRequestState == authRequestState));
}


@override
int get hashCode => Object.hash(runtimeType,user,authRequestState);

@override
String toString() {
  return 'AuthState.authenticated(user: $user, authRequestState: $authRequestState)';
}


}

/// @nodoc
abstract mixin class $AuthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthenticatedCopyWith(Authenticated value, $Res Function(Authenticated) _then) = _$AuthenticatedCopyWithImpl;
@override @useResult
$Res call({
 firebase.User user, AsyncState<void> authRequestState
});


@override $AsyncStateCopyWith<void, $Res> get authRequestState;

}
/// @nodoc
class _$AuthenticatedCopyWithImpl<$Res>
    implements $AuthenticatedCopyWith<$Res> {
  _$AuthenticatedCopyWithImpl(this._self, this._then);

  final Authenticated _self;
  final $Res Function(Authenticated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? authRequestState = null,}) {
  return _then(Authenticated(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as firebase.User,authRequestState: null == authRequestState ? _self.authRequestState : authRequestState // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get authRequestState {
  
  return $AsyncStateCopyWith<void, $Res>(_self.authRequestState, (value) {
    return _then(_self.copyWith(authRequestState: value));
  });
}
}

/// @nodoc


class Unauthenticated implements AuthState {
  const Unauthenticated({this.authRequestState = const AsyncInitial()});
  

@override@JsonKey() final  AsyncState<void> authRequestState;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthenticatedCopyWith<Unauthenticated> get copyWith => _$UnauthenticatedCopyWithImpl<Unauthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unauthenticated&&(identical(other.authRequestState, authRequestState) || other.authRequestState == authRequestState));
}


@override
int get hashCode => Object.hash(runtimeType,authRequestState);

@override
String toString() {
  return 'AuthState.unauthenticated(authRequestState: $authRequestState)';
}


}

/// @nodoc
abstract mixin class $UnauthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $UnauthenticatedCopyWith(Unauthenticated value, $Res Function(Unauthenticated) _then) = _$UnauthenticatedCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<void> authRequestState
});


@override $AsyncStateCopyWith<void, $Res> get authRequestState;

}
/// @nodoc
class _$UnauthenticatedCopyWithImpl<$Res>
    implements $UnauthenticatedCopyWith<$Res> {
  _$UnauthenticatedCopyWithImpl(this._self, this._then);

  final Unauthenticated _self;
  final $Res Function(Unauthenticated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authRequestState = null,}) {
  return _then(Unauthenticated(
authRequestState: null == authRequestState ? _self.authRequestState : authRequestState // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get authRequestState {
  
  return $AsyncStateCopyWith<void, $Res>(_self.authRequestState, (value) {
    return _then(_self.copyWith(authRequestState: value));
  });
}
}

/// @nodoc


class PasswordResetSuccess implements AuthState {
  const PasswordResetSuccess({this.authRequestState = const AsyncInitial()});
  

@override@JsonKey() final  AsyncState<void> authRequestState;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordResetSuccessCopyWith<PasswordResetSuccess> get copyWith => _$PasswordResetSuccessCopyWithImpl<PasswordResetSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordResetSuccess&&(identical(other.authRequestState, authRequestState) || other.authRequestState == authRequestState));
}


@override
int get hashCode => Object.hash(runtimeType,authRequestState);

@override
String toString() {
  return 'AuthState.passwordResetSuccess(authRequestState: $authRequestState)';
}


}

/// @nodoc
abstract mixin class $PasswordResetSuccessCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $PasswordResetSuccessCopyWith(PasswordResetSuccess value, $Res Function(PasswordResetSuccess) _then) = _$PasswordResetSuccessCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<void> authRequestState
});


@override $AsyncStateCopyWith<void, $Res> get authRequestState;

}
/// @nodoc
class _$PasswordResetSuccessCopyWithImpl<$Res>
    implements $PasswordResetSuccessCopyWith<$Res> {
  _$PasswordResetSuccessCopyWithImpl(this._self, this._then);

  final PasswordResetSuccess _self;
  final $Res Function(PasswordResetSuccess) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authRequestState = null,}) {
  return _then(PasswordResetSuccess(
authRequestState: null == authRequestState ? _self.authRequestState : authRequestState // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get authRequestState {
  
  return $AsyncStateCopyWith<void, $Res>(_self.authRequestState, (value) {
    return _then(_self.copyWith(authRequestState: value));
  });
}
}

/// @nodoc


class ChangePasswordSuccess implements AuthState {
  const ChangePasswordSuccess({this.authRequestState = const AsyncInitial()});
  

@override@JsonKey() final  AsyncState<void> authRequestState;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePasswordSuccessCopyWith<ChangePasswordSuccess> get copyWith => _$ChangePasswordSuccessCopyWithImpl<ChangePasswordSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordSuccess&&(identical(other.authRequestState, authRequestState) || other.authRequestState == authRequestState));
}


@override
int get hashCode => Object.hash(runtimeType,authRequestState);

@override
String toString() {
  return 'AuthState.changePasswordSuccess(authRequestState: $authRequestState)';
}


}

/// @nodoc
abstract mixin class $ChangePasswordSuccessCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $ChangePasswordSuccessCopyWith(ChangePasswordSuccess value, $Res Function(ChangePasswordSuccess) _then) = _$ChangePasswordSuccessCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<void> authRequestState
});


@override $AsyncStateCopyWith<void, $Res> get authRequestState;

}
/// @nodoc
class _$ChangePasswordSuccessCopyWithImpl<$Res>
    implements $ChangePasswordSuccessCopyWith<$Res> {
  _$ChangePasswordSuccessCopyWithImpl(this._self, this._then);

  final ChangePasswordSuccess _self;
  final $Res Function(ChangePasswordSuccess) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authRequestState = null,}) {
  return _then(ChangePasswordSuccess(
authRequestState: null == authRequestState ? _self.authRequestState : authRequestState // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get authRequestState {
  
  return $AsyncStateCopyWith<void, $Res>(_self.authRequestState, (value) {
    return _then(_self.copyWith(authRequestState: value));
  });
}
}

// dart format on
