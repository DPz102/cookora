// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthStatusChanged value)?  authStatusChanged,TResult Function( EmailSignInRequested value)?  emailSignInRequested,TResult Function( EmailSignUpRequested value)?  emailSignUpRequested,TResult Function( PasswordResetRequested value)?  passwordResetRequested,TResult Function( LogoutRequested value)?  logoutRequested,TResult Function( PasswordChanged value)?  passwordChange,TResult Function( ClearAuthRequestState value)?  clearAuthRequestState,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthStatusChanged() when authStatusChanged != null:
return authStatusChanged(_that);case EmailSignInRequested() when emailSignInRequested != null:
return emailSignInRequested(_that);case EmailSignUpRequested() when emailSignUpRequested != null:
return emailSignUpRequested(_that);case PasswordResetRequested() when passwordResetRequested != null:
return passwordResetRequested(_that);case LogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case PasswordChanged() when passwordChange != null:
return passwordChange(_that);case ClearAuthRequestState() when clearAuthRequestState != null:
return clearAuthRequestState(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthStatusChanged value)  authStatusChanged,required TResult Function( EmailSignInRequested value)  emailSignInRequested,required TResult Function( EmailSignUpRequested value)  emailSignUpRequested,required TResult Function( PasswordResetRequested value)  passwordResetRequested,required TResult Function( LogoutRequested value)  logoutRequested,required TResult Function( PasswordChanged value)  passwordChange,required TResult Function( ClearAuthRequestState value)  clearAuthRequestState,}){
final _that = this;
switch (_that) {
case AuthStatusChanged():
return authStatusChanged(_that);case EmailSignInRequested():
return emailSignInRequested(_that);case EmailSignUpRequested():
return emailSignUpRequested(_that);case PasswordResetRequested():
return passwordResetRequested(_that);case LogoutRequested():
return logoutRequested(_that);case PasswordChanged():
return passwordChange(_that);case ClearAuthRequestState():
return clearAuthRequestState(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthStatusChanged value)?  authStatusChanged,TResult? Function( EmailSignInRequested value)?  emailSignInRequested,TResult? Function( EmailSignUpRequested value)?  emailSignUpRequested,TResult? Function( PasswordResetRequested value)?  passwordResetRequested,TResult? Function( LogoutRequested value)?  logoutRequested,TResult? Function( PasswordChanged value)?  passwordChange,TResult? Function( ClearAuthRequestState value)?  clearAuthRequestState,}){
final _that = this;
switch (_that) {
case AuthStatusChanged() when authStatusChanged != null:
return authStatusChanged(_that);case EmailSignInRequested() when emailSignInRequested != null:
return emailSignInRequested(_that);case EmailSignUpRequested() when emailSignUpRequested != null:
return emailSignUpRequested(_that);case PasswordResetRequested() when passwordResetRequested != null:
return passwordResetRequested(_that);case LogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case PasswordChanged() when passwordChange != null:
return passwordChange(_that);case ClearAuthRequestState() when clearAuthRequestState != null:
return clearAuthRequestState(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( firebase.User? user)?  authStatusChanged,TResult Function( String email,  String password)?  emailSignInRequested,TResult Function( String email,  String password,  String username)?  emailSignUpRequested,TResult Function( String email)?  passwordResetRequested,TResult Function()?  logoutRequested,TResult Function( String currentPassword,  String newPassword)?  passwordChange,TResult Function()?  clearAuthRequestState,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthStatusChanged() when authStatusChanged != null:
return authStatusChanged(_that.user);case EmailSignInRequested() when emailSignInRequested != null:
return emailSignInRequested(_that.email,_that.password);case EmailSignUpRequested() when emailSignUpRequested != null:
return emailSignUpRequested(_that.email,_that.password,_that.username);case PasswordResetRequested() when passwordResetRequested != null:
return passwordResetRequested(_that.email);case LogoutRequested() when logoutRequested != null:
return logoutRequested();case PasswordChanged() when passwordChange != null:
return passwordChange(_that.currentPassword,_that.newPassword);case ClearAuthRequestState() when clearAuthRequestState != null:
return clearAuthRequestState();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( firebase.User? user)  authStatusChanged,required TResult Function( String email,  String password)  emailSignInRequested,required TResult Function( String email,  String password,  String username)  emailSignUpRequested,required TResult Function( String email)  passwordResetRequested,required TResult Function()  logoutRequested,required TResult Function( String currentPassword,  String newPassword)  passwordChange,required TResult Function()  clearAuthRequestState,}) {final _that = this;
switch (_that) {
case AuthStatusChanged():
return authStatusChanged(_that.user);case EmailSignInRequested():
return emailSignInRequested(_that.email,_that.password);case EmailSignUpRequested():
return emailSignUpRequested(_that.email,_that.password,_that.username);case PasswordResetRequested():
return passwordResetRequested(_that.email);case LogoutRequested():
return logoutRequested();case PasswordChanged():
return passwordChange(_that.currentPassword,_that.newPassword);case ClearAuthRequestState():
return clearAuthRequestState();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( firebase.User? user)?  authStatusChanged,TResult? Function( String email,  String password)?  emailSignInRequested,TResult? Function( String email,  String password,  String username)?  emailSignUpRequested,TResult? Function( String email)?  passwordResetRequested,TResult? Function()?  logoutRequested,TResult? Function( String currentPassword,  String newPassword)?  passwordChange,TResult? Function()?  clearAuthRequestState,}) {final _that = this;
switch (_that) {
case AuthStatusChanged() when authStatusChanged != null:
return authStatusChanged(_that.user);case EmailSignInRequested() when emailSignInRequested != null:
return emailSignInRequested(_that.email,_that.password);case EmailSignUpRequested() when emailSignUpRequested != null:
return emailSignUpRequested(_that.email,_that.password,_that.username);case PasswordResetRequested() when passwordResetRequested != null:
return passwordResetRequested(_that.email);case LogoutRequested() when logoutRequested != null:
return logoutRequested();case PasswordChanged() when passwordChange != null:
return passwordChange(_that.currentPassword,_that.newPassword);case ClearAuthRequestState() when clearAuthRequestState != null:
return clearAuthRequestState();case _:
  return null;

}
}

}

/// @nodoc


class AuthStatusChanged implements AuthEvent {
  const AuthStatusChanged(this.user);
  

 final  firebase.User? user;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStatusChangedCopyWith<AuthStatusChanged> get copyWith => _$AuthStatusChangedCopyWithImpl<AuthStatusChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStatusChanged&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthEvent.authStatusChanged(user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthStatusChangedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthStatusChangedCopyWith(AuthStatusChanged value, $Res Function(AuthStatusChanged) _then) = _$AuthStatusChangedCopyWithImpl;
@useResult
$Res call({
 firebase.User? user
});




}
/// @nodoc
class _$AuthStatusChangedCopyWithImpl<$Res>
    implements $AuthStatusChangedCopyWith<$Res> {
  _$AuthStatusChangedCopyWithImpl(this._self, this._then);

  final AuthStatusChanged _self;
  final $Res Function(AuthStatusChanged) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = freezed,}) {
  return _then(AuthStatusChanged(
freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as firebase.User?,
  ));
}


}

/// @nodoc


class EmailSignInRequested implements AuthEvent {
  const EmailSignInRequested({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailSignInRequestedCopyWith<EmailSignInRequested> get copyWith => _$EmailSignInRequestedCopyWithImpl<EmailSignInRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailSignInRequested&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.emailSignInRequested(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $EmailSignInRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $EmailSignInRequestedCopyWith(EmailSignInRequested value, $Res Function(EmailSignInRequested) _then) = _$EmailSignInRequestedCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$EmailSignInRequestedCopyWithImpl<$Res>
    implements $EmailSignInRequestedCopyWith<$Res> {
  _$EmailSignInRequestedCopyWithImpl(this._self, this._then);

  final EmailSignInRequested _self;
  final $Res Function(EmailSignInRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(EmailSignInRequested(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class EmailSignUpRequested implements AuthEvent {
  const EmailSignUpRequested({required this.email, required this.password, required this.username});
  

 final  String email;
 final  String password;
 final  String username;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailSignUpRequestedCopyWith<EmailSignUpRequested> get copyWith => _$EmailSignUpRequestedCopyWithImpl<EmailSignUpRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailSignUpRequested&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.username, username) || other.username == username));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,username);

@override
String toString() {
  return 'AuthEvent.emailSignUpRequested(email: $email, password: $password, username: $username)';
}


}

/// @nodoc
abstract mixin class $EmailSignUpRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $EmailSignUpRequestedCopyWith(EmailSignUpRequested value, $Res Function(EmailSignUpRequested) _then) = _$EmailSignUpRequestedCopyWithImpl;
@useResult
$Res call({
 String email, String password, String username
});




}
/// @nodoc
class _$EmailSignUpRequestedCopyWithImpl<$Res>
    implements $EmailSignUpRequestedCopyWith<$Res> {
  _$EmailSignUpRequestedCopyWithImpl(this._self, this._then);

  final EmailSignUpRequested _self;
  final $Res Function(EmailSignUpRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? username = null,}) {
  return _then(EmailSignUpRequested(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PasswordResetRequested implements AuthEvent {
  const PasswordResetRequested({required this.email});
  

 final  String email;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordResetRequestedCopyWith<PasswordResetRequested> get copyWith => _$PasswordResetRequestedCopyWithImpl<PasswordResetRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordResetRequested&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AuthEvent.passwordResetRequested(email: $email)';
}


}

/// @nodoc
abstract mixin class $PasswordResetRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $PasswordResetRequestedCopyWith(PasswordResetRequested value, $Res Function(PasswordResetRequested) _then) = _$PasswordResetRequestedCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$PasswordResetRequestedCopyWithImpl<$Res>
    implements $PasswordResetRequestedCopyWith<$Res> {
  _$PasswordResetRequestedCopyWithImpl(this._self, this._then);

  final PasswordResetRequested _self;
  final $Res Function(PasswordResetRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(PasswordResetRequested(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LogoutRequested implements AuthEvent {
  const LogoutRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.logoutRequested()';
}


}




/// @nodoc


class PasswordChanged implements AuthEvent {
  const PasswordChanged({required this.currentPassword, required this.newPassword});
  

 final  String currentPassword;
 final  String newPassword;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordChangedCopyWith<PasswordChanged> get copyWith => _$PasswordChangedCopyWithImpl<PasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordChanged&&(identical(other.currentPassword, currentPassword) || other.currentPassword == currentPassword)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}


@override
int get hashCode => Object.hash(runtimeType,currentPassword,newPassword);

@override
String toString() {
  return 'AuthEvent.passwordChange(currentPassword: $currentPassword, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class $PasswordChangedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $PasswordChangedCopyWith(PasswordChanged value, $Res Function(PasswordChanged) _then) = _$PasswordChangedCopyWithImpl;
@useResult
$Res call({
 String currentPassword, String newPassword
});




}
/// @nodoc
class _$PasswordChangedCopyWithImpl<$Res>
    implements $PasswordChangedCopyWith<$Res> {
  _$PasswordChangedCopyWithImpl(this._self, this._then);

  final PasswordChanged _self;
  final $Res Function(PasswordChanged) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentPassword = null,Object? newPassword = null,}) {
  return _then(PasswordChanged(
currentPassword: null == currentPassword ? _self.currentPassword : currentPassword // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClearAuthRequestState implements AuthEvent {
  const ClearAuthRequestState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearAuthRequestState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.clearAuthRequestState()';
}


}




// dart format on
