// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserEvent()';
}


}

/// @nodoc
class $UserEventCopyWith<$Res>  {
$UserEventCopyWith(UserEvent _, $Res Function(UserEvent) __);
}


/// Adds pattern-matching-related methods to [UserEvent].
extension UserEventPatterns on UserEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SubscribeToProfile value)?  subscribeToProfile,TResult Function( ProfileUpdated value)?  profileUpdated,TResult Function( PostsUpdated value)?  postsUpdated,TResult Function( UpdateProfile value)?  updateProfile,TResult Function( UpdateAvatar value)?  updateAvatar,TResult Function( SavePost value)?  savePost,TResult Function( UnsavePost value)?  unsavePost,TResult Function( SavedPostsUpdated value)?  savedPostsUpdated,TResult Function( ClearProfile value)?  clearProfile,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SubscribeToProfile() when subscribeToProfile != null:
return subscribeToProfile(_that);case ProfileUpdated() when profileUpdated != null:
return profileUpdated(_that);case PostsUpdated() when postsUpdated != null:
return postsUpdated(_that);case UpdateProfile() when updateProfile != null:
return updateProfile(_that);case UpdateAvatar() when updateAvatar != null:
return updateAvatar(_that);case SavePost() when savePost != null:
return savePost(_that);case UnsavePost() when unsavePost != null:
return unsavePost(_that);case SavedPostsUpdated() when savedPostsUpdated != null:
return savedPostsUpdated(_that);case ClearProfile() when clearProfile != null:
return clearProfile(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SubscribeToProfile value)  subscribeToProfile,required TResult Function( ProfileUpdated value)  profileUpdated,required TResult Function( PostsUpdated value)  postsUpdated,required TResult Function( UpdateProfile value)  updateProfile,required TResult Function( UpdateAvatar value)  updateAvatar,required TResult Function( SavePost value)  savePost,required TResult Function( UnsavePost value)  unsavePost,required TResult Function( SavedPostsUpdated value)  savedPostsUpdated,required TResult Function( ClearProfile value)  clearProfile,}){
final _that = this;
switch (_that) {
case SubscribeToProfile():
return subscribeToProfile(_that);case ProfileUpdated():
return profileUpdated(_that);case PostsUpdated():
return postsUpdated(_that);case UpdateProfile():
return updateProfile(_that);case UpdateAvatar():
return updateAvatar(_that);case SavePost():
return savePost(_that);case UnsavePost():
return unsavePost(_that);case SavedPostsUpdated():
return savedPostsUpdated(_that);case ClearProfile():
return clearProfile(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SubscribeToProfile value)?  subscribeToProfile,TResult? Function( ProfileUpdated value)?  profileUpdated,TResult? Function( PostsUpdated value)?  postsUpdated,TResult? Function( UpdateProfile value)?  updateProfile,TResult? Function( UpdateAvatar value)?  updateAvatar,TResult? Function( SavePost value)?  savePost,TResult? Function( UnsavePost value)?  unsavePost,TResult? Function( SavedPostsUpdated value)?  savedPostsUpdated,TResult? Function( ClearProfile value)?  clearProfile,}){
final _that = this;
switch (_that) {
case SubscribeToProfile() when subscribeToProfile != null:
return subscribeToProfile(_that);case ProfileUpdated() when profileUpdated != null:
return profileUpdated(_that);case PostsUpdated() when postsUpdated != null:
return postsUpdated(_that);case UpdateProfile() when updateProfile != null:
return updateProfile(_that);case UpdateAvatar() when updateAvatar != null:
return updateAvatar(_that);case SavePost() when savePost != null:
return savePost(_that);case UnsavePost() when unsavePost != null:
return unsavePost(_that);case SavedPostsUpdated() when savedPostsUpdated != null:
return savedPostsUpdated(_that);case ClearProfile() when clearProfile != null:
return clearProfile(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String uid)?  subscribeToProfile,TResult Function( UserEntity userProfile)?  profileUpdated,TResult Function( List<PostEntity> posts)?  postsUpdated,TResult Function( String uid,  Map<String, dynamic> data)?  updateProfile,TResult Function( XFile imageFile)?  updateAvatar,TResult Function( String postId)?  savePost,TResult Function( String postId)?  unsavePost,TResult Function( List<PostEntity> savedPosts)?  savedPostsUpdated,TResult Function()?  clearProfile,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SubscribeToProfile() when subscribeToProfile != null:
return subscribeToProfile(_that.uid);case ProfileUpdated() when profileUpdated != null:
return profileUpdated(_that.userProfile);case PostsUpdated() when postsUpdated != null:
return postsUpdated(_that.posts);case UpdateProfile() when updateProfile != null:
return updateProfile(_that.uid,_that.data);case UpdateAvatar() when updateAvatar != null:
return updateAvatar(_that.imageFile);case SavePost() when savePost != null:
return savePost(_that.postId);case UnsavePost() when unsavePost != null:
return unsavePost(_that.postId);case SavedPostsUpdated() when savedPostsUpdated != null:
return savedPostsUpdated(_that.savedPosts);case ClearProfile() when clearProfile != null:
return clearProfile();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String uid)  subscribeToProfile,required TResult Function( UserEntity userProfile)  profileUpdated,required TResult Function( List<PostEntity> posts)  postsUpdated,required TResult Function( String uid,  Map<String, dynamic> data)  updateProfile,required TResult Function( XFile imageFile)  updateAvatar,required TResult Function( String postId)  savePost,required TResult Function( String postId)  unsavePost,required TResult Function( List<PostEntity> savedPosts)  savedPostsUpdated,required TResult Function()  clearProfile,}) {final _that = this;
switch (_that) {
case SubscribeToProfile():
return subscribeToProfile(_that.uid);case ProfileUpdated():
return profileUpdated(_that.userProfile);case PostsUpdated():
return postsUpdated(_that.posts);case UpdateProfile():
return updateProfile(_that.uid,_that.data);case UpdateAvatar():
return updateAvatar(_that.imageFile);case SavePost():
return savePost(_that.postId);case UnsavePost():
return unsavePost(_that.postId);case SavedPostsUpdated():
return savedPostsUpdated(_that.savedPosts);case ClearProfile():
return clearProfile();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String uid)?  subscribeToProfile,TResult? Function( UserEntity userProfile)?  profileUpdated,TResult? Function( List<PostEntity> posts)?  postsUpdated,TResult? Function( String uid,  Map<String, dynamic> data)?  updateProfile,TResult? Function( XFile imageFile)?  updateAvatar,TResult? Function( String postId)?  savePost,TResult? Function( String postId)?  unsavePost,TResult? Function( List<PostEntity> savedPosts)?  savedPostsUpdated,TResult? Function()?  clearProfile,}) {final _that = this;
switch (_that) {
case SubscribeToProfile() when subscribeToProfile != null:
return subscribeToProfile(_that.uid);case ProfileUpdated() when profileUpdated != null:
return profileUpdated(_that.userProfile);case PostsUpdated() when postsUpdated != null:
return postsUpdated(_that.posts);case UpdateProfile() when updateProfile != null:
return updateProfile(_that.uid,_that.data);case UpdateAvatar() when updateAvatar != null:
return updateAvatar(_that.imageFile);case SavePost() when savePost != null:
return savePost(_that.postId);case UnsavePost() when unsavePost != null:
return unsavePost(_that.postId);case SavedPostsUpdated() when savedPostsUpdated != null:
return savedPostsUpdated(_that.savedPosts);case ClearProfile() when clearProfile != null:
return clearProfile();case _:
  return null;

}
}

}

/// @nodoc


class SubscribeToProfile implements UserEvent {
  const SubscribeToProfile(this.uid);
  

 final  String uid;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscribeToProfileCopyWith<SubscribeToProfile> get copyWith => _$SubscribeToProfileCopyWithImpl<SubscribeToProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscribeToProfile&&(identical(other.uid, uid) || other.uid == uid));
}


@override
int get hashCode => Object.hash(runtimeType,uid);

@override
String toString() {
  return 'UserEvent.subscribeToProfile(uid: $uid)';
}


}

/// @nodoc
abstract mixin class $SubscribeToProfileCopyWith<$Res> implements $UserEventCopyWith<$Res> {
  factory $SubscribeToProfileCopyWith(SubscribeToProfile value, $Res Function(SubscribeToProfile) _then) = _$SubscribeToProfileCopyWithImpl;
@useResult
$Res call({
 String uid
});




}
/// @nodoc
class _$SubscribeToProfileCopyWithImpl<$Res>
    implements $SubscribeToProfileCopyWith<$Res> {
  _$SubscribeToProfileCopyWithImpl(this._self, this._then);

  final SubscribeToProfile _self;
  final $Res Function(SubscribeToProfile) _then;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uid = null,}) {
  return _then(SubscribeToProfile(
null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProfileUpdated implements UserEvent {
  const ProfileUpdated(this.userProfile);
  

 final  UserEntity userProfile;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileUpdatedCopyWith<ProfileUpdated> get copyWith => _$ProfileUpdatedCopyWithImpl<ProfileUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileUpdated&&(identical(other.userProfile, userProfile) || other.userProfile == userProfile));
}


@override
int get hashCode => Object.hash(runtimeType,userProfile);

@override
String toString() {
  return 'UserEvent.profileUpdated(userProfile: $userProfile)';
}


}

/// @nodoc
abstract mixin class $ProfileUpdatedCopyWith<$Res> implements $UserEventCopyWith<$Res> {
  factory $ProfileUpdatedCopyWith(ProfileUpdated value, $Res Function(ProfileUpdated) _then) = _$ProfileUpdatedCopyWithImpl;
@useResult
$Res call({
 UserEntity userProfile
});


$UserEntityCopyWith<$Res> get userProfile;

}
/// @nodoc
class _$ProfileUpdatedCopyWithImpl<$Res>
    implements $ProfileUpdatedCopyWith<$Res> {
  _$ProfileUpdatedCopyWithImpl(this._self, this._then);

  final ProfileUpdated _self;
  final $Res Function(ProfileUpdated) _then;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userProfile = null,}) {
  return _then(ProfileUpdated(
null == userProfile ? _self.userProfile : userProfile // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res> get userProfile {
  
  return $UserEntityCopyWith<$Res>(_self.userProfile, (value) {
    return _then(_self.copyWith(userProfile: value));
  });
}
}

/// @nodoc


class PostsUpdated implements UserEvent {
  const PostsUpdated(final  List<PostEntity> posts): _posts = posts;
  

 final  List<PostEntity> _posts;
 List<PostEntity> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostsUpdatedCopyWith<PostsUpdated> get copyWith => _$PostsUpdatedCopyWithImpl<PostsUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostsUpdated&&const DeepCollectionEquality().equals(other._posts, _posts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'UserEvent.postsUpdated(posts: $posts)';
}


}

/// @nodoc
abstract mixin class $PostsUpdatedCopyWith<$Res> implements $UserEventCopyWith<$Res> {
  factory $PostsUpdatedCopyWith(PostsUpdated value, $Res Function(PostsUpdated) _then) = _$PostsUpdatedCopyWithImpl;
@useResult
$Res call({
 List<PostEntity> posts
});




}
/// @nodoc
class _$PostsUpdatedCopyWithImpl<$Res>
    implements $PostsUpdatedCopyWith<$Res> {
  _$PostsUpdatedCopyWithImpl(this._self, this._then);

  final PostsUpdated _self;
  final $Res Function(PostsUpdated) _then;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? posts = null,}) {
  return _then(PostsUpdated(
null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostEntity>,
  ));
}


}

/// @nodoc


class UpdateProfile implements UserEvent {
  const UpdateProfile({required this.uid, required final  Map<String, dynamic> data}): _data = data;
  

 final  String uid;
 final  Map<String, dynamic> _data;
 Map<String, dynamic> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}


/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileCopyWith<UpdateProfile> get copyWith => _$UpdateProfileCopyWithImpl<UpdateProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfile&&(identical(other.uid, uid) || other.uid == uid)&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,uid,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'UserEvent.updateProfile(uid: $uid, data: $data)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileCopyWith<$Res> implements $UserEventCopyWith<$Res> {
  factory $UpdateProfileCopyWith(UpdateProfile value, $Res Function(UpdateProfile) _then) = _$UpdateProfileCopyWithImpl;
@useResult
$Res call({
 String uid, Map<String, dynamic> data
});




}
/// @nodoc
class _$UpdateProfileCopyWithImpl<$Res>
    implements $UpdateProfileCopyWith<$Res> {
  _$UpdateProfileCopyWithImpl(this._self, this._then);

  final UpdateProfile _self;
  final $Res Function(UpdateProfile) _then;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? data = null,}) {
  return _then(UpdateProfile(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class UpdateAvatar implements UserEvent {
  const UpdateAvatar(this.imageFile);
  

 final  XFile imageFile;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAvatarCopyWith<UpdateAvatar> get copyWith => _$UpdateAvatarCopyWithImpl<UpdateAvatar>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAvatar&&(identical(other.imageFile, imageFile) || other.imageFile == imageFile));
}


@override
int get hashCode => Object.hash(runtimeType,imageFile);

@override
String toString() {
  return 'UserEvent.updateAvatar(imageFile: $imageFile)';
}


}

/// @nodoc
abstract mixin class $UpdateAvatarCopyWith<$Res> implements $UserEventCopyWith<$Res> {
  factory $UpdateAvatarCopyWith(UpdateAvatar value, $Res Function(UpdateAvatar) _then) = _$UpdateAvatarCopyWithImpl;
@useResult
$Res call({
 XFile imageFile
});




}
/// @nodoc
class _$UpdateAvatarCopyWithImpl<$Res>
    implements $UpdateAvatarCopyWith<$Res> {
  _$UpdateAvatarCopyWithImpl(this._self, this._then);

  final UpdateAvatar _self;
  final $Res Function(UpdateAvatar) _then;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imageFile = null,}) {
  return _then(UpdateAvatar(
null == imageFile ? _self.imageFile : imageFile // ignore: cast_nullable_to_non_nullable
as XFile,
  ));
}


}

/// @nodoc


class SavePost implements UserEvent {
  const SavePost(this.postId);
  

 final  String postId;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavePostCopyWith<SavePost> get copyWith => _$SavePostCopyWithImpl<SavePost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavePost&&(identical(other.postId, postId) || other.postId == postId));
}


@override
int get hashCode => Object.hash(runtimeType,postId);

@override
String toString() {
  return 'UserEvent.savePost(postId: $postId)';
}


}

/// @nodoc
abstract mixin class $SavePostCopyWith<$Res> implements $UserEventCopyWith<$Res> {
  factory $SavePostCopyWith(SavePost value, $Res Function(SavePost) _then) = _$SavePostCopyWithImpl;
@useResult
$Res call({
 String postId
});




}
/// @nodoc
class _$SavePostCopyWithImpl<$Res>
    implements $SavePostCopyWith<$Res> {
  _$SavePostCopyWithImpl(this._self, this._then);

  final SavePost _self;
  final $Res Function(SavePost) _then;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? postId = null,}) {
  return _then(SavePost(
null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UnsavePost implements UserEvent {
  const UnsavePost(this.postId);
  

 final  String postId;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnsavePostCopyWith<UnsavePost> get copyWith => _$UnsavePostCopyWithImpl<UnsavePost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnsavePost&&(identical(other.postId, postId) || other.postId == postId));
}


@override
int get hashCode => Object.hash(runtimeType,postId);

@override
String toString() {
  return 'UserEvent.unsavePost(postId: $postId)';
}


}

/// @nodoc
abstract mixin class $UnsavePostCopyWith<$Res> implements $UserEventCopyWith<$Res> {
  factory $UnsavePostCopyWith(UnsavePost value, $Res Function(UnsavePost) _then) = _$UnsavePostCopyWithImpl;
@useResult
$Res call({
 String postId
});




}
/// @nodoc
class _$UnsavePostCopyWithImpl<$Res>
    implements $UnsavePostCopyWith<$Res> {
  _$UnsavePostCopyWithImpl(this._self, this._then);

  final UnsavePost _self;
  final $Res Function(UnsavePost) _then;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? postId = null,}) {
  return _then(UnsavePost(
null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SavedPostsUpdated implements UserEvent {
  const SavedPostsUpdated(final  List<PostEntity> savedPosts): _savedPosts = savedPosts;
  

 final  List<PostEntity> _savedPosts;
 List<PostEntity> get savedPosts {
  if (_savedPosts is EqualUnmodifiableListView) return _savedPosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_savedPosts);
}


/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedPostsUpdatedCopyWith<SavedPostsUpdated> get copyWith => _$SavedPostsUpdatedCopyWithImpl<SavedPostsUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedPostsUpdated&&const DeepCollectionEquality().equals(other._savedPosts, _savedPosts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_savedPosts));

@override
String toString() {
  return 'UserEvent.savedPostsUpdated(savedPosts: $savedPosts)';
}


}

/// @nodoc
abstract mixin class $SavedPostsUpdatedCopyWith<$Res> implements $UserEventCopyWith<$Res> {
  factory $SavedPostsUpdatedCopyWith(SavedPostsUpdated value, $Res Function(SavedPostsUpdated) _then) = _$SavedPostsUpdatedCopyWithImpl;
@useResult
$Res call({
 List<PostEntity> savedPosts
});




}
/// @nodoc
class _$SavedPostsUpdatedCopyWithImpl<$Res>
    implements $SavedPostsUpdatedCopyWith<$Res> {
  _$SavedPostsUpdatedCopyWithImpl(this._self, this._then);

  final SavedPostsUpdated _self;
  final $Res Function(SavedPostsUpdated) _then;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? savedPosts = null,}) {
  return _then(SavedPostsUpdated(
null == savedPosts ? _self._savedPosts : savedPosts // ignore: cast_nullable_to_non_nullable
as List<PostEntity>,
  ));
}


}

/// @nodoc


class ClearProfile implements UserEvent {
  const ClearProfile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearProfile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserEvent.clearProfile()';
}


}




// dart format on
