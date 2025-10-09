// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommunityEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommunityEvent()';
}


}

/// @nodoc
class $CommunityEventCopyWith<$Res>  {
$CommunityEventCopyWith(CommunityEvent _, $Res Function(CommunityEvent) __);
}


/// Adds pattern-matching-related methods to [CommunityEvent].
extension CommunityEventPatterns on CommunityEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SubscribeToCommunityFeed value)?  subscribeToCommunityFeed,TResult Function( CreatePost value)?  createPost,TResult Function( ResetCreatePostStatus value)?  resetCreatePostStatus,TResult Function( LikePost value)?  likePost,TResult Function( UnlikePost value)?  unlikePost,TResult Function( FeedUpdated value)?  feedUpdated,TResult Function( ClearFeed value)?  clearFeed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SubscribeToCommunityFeed() when subscribeToCommunityFeed != null:
return subscribeToCommunityFeed(_that);case CreatePost() when createPost != null:
return createPost(_that);case ResetCreatePostStatus() when resetCreatePostStatus != null:
return resetCreatePostStatus(_that);case LikePost() when likePost != null:
return likePost(_that);case UnlikePost() when unlikePost != null:
return unlikePost(_that);case FeedUpdated() when feedUpdated != null:
return feedUpdated(_that);case ClearFeed() when clearFeed != null:
return clearFeed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SubscribeToCommunityFeed value)  subscribeToCommunityFeed,required TResult Function( CreatePost value)  createPost,required TResult Function( ResetCreatePostStatus value)  resetCreatePostStatus,required TResult Function( LikePost value)  likePost,required TResult Function( UnlikePost value)  unlikePost,required TResult Function( FeedUpdated value)  feedUpdated,required TResult Function( ClearFeed value)  clearFeed,}){
final _that = this;
switch (_that) {
case SubscribeToCommunityFeed():
return subscribeToCommunityFeed(_that);case CreatePost():
return createPost(_that);case ResetCreatePostStatus():
return resetCreatePostStatus(_that);case LikePost():
return likePost(_that);case UnlikePost():
return unlikePost(_that);case FeedUpdated():
return feedUpdated(_that);case ClearFeed():
return clearFeed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SubscribeToCommunityFeed value)?  subscribeToCommunityFeed,TResult? Function( CreatePost value)?  createPost,TResult? Function( ResetCreatePostStatus value)?  resetCreatePostStatus,TResult? Function( LikePost value)?  likePost,TResult? Function( UnlikePost value)?  unlikePost,TResult? Function( FeedUpdated value)?  feedUpdated,TResult? Function( ClearFeed value)?  clearFeed,}){
final _that = this;
switch (_that) {
case SubscribeToCommunityFeed() when subscribeToCommunityFeed != null:
return subscribeToCommunityFeed(_that);case CreatePost() when createPost != null:
return createPost(_that);case ResetCreatePostStatus() when resetCreatePostStatus != null:
return resetCreatePostStatus(_that);case LikePost() when likePost != null:
return likePost(_that);case UnlikePost() when unlikePost != null:
return unlikePost(_that);case FeedUpdated() when feedUpdated != null:
return feedUpdated(_that);case ClearFeed() when clearFeed != null:
return clearFeed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String uid)?  subscribeToCommunityFeed,TResult Function( File imageFile,  String caption)?  createPost,TResult Function()?  resetCreatePostStatus,TResult Function( String postId)?  likePost,TResult Function( String postId)?  unlikePost,TResult Function( List<PostEntity> posts)?  feedUpdated,TResult Function()?  clearFeed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SubscribeToCommunityFeed() when subscribeToCommunityFeed != null:
return subscribeToCommunityFeed(_that.uid);case CreatePost() when createPost != null:
return createPost(_that.imageFile,_that.caption);case ResetCreatePostStatus() when resetCreatePostStatus != null:
return resetCreatePostStatus();case LikePost() when likePost != null:
return likePost(_that.postId);case UnlikePost() when unlikePost != null:
return unlikePost(_that.postId);case FeedUpdated() when feedUpdated != null:
return feedUpdated(_that.posts);case ClearFeed() when clearFeed != null:
return clearFeed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String uid)  subscribeToCommunityFeed,required TResult Function( File imageFile,  String caption)  createPost,required TResult Function()  resetCreatePostStatus,required TResult Function( String postId)  likePost,required TResult Function( String postId)  unlikePost,required TResult Function( List<PostEntity> posts)  feedUpdated,required TResult Function()  clearFeed,}) {final _that = this;
switch (_that) {
case SubscribeToCommunityFeed():
return subscribeToCommunityFeed(_that.uid);case CreatePost():
return createPost(_that.imageFile,_that.caption);case ResetCreatePostStatus():
return resetCreatePostStatus();case LikePost():
return likePost(_that.postId);case UnlikePost():
return unlikePost(_that.postId);case FeedUpdated():
return feedUpdated(_that.posts);case ClearFeed():
return clearFeed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String uid)?  subscribeToCommunityFeed,TResult? Function( File imageFile,  String caption)?  createPost,TResult? Function()?  resetCreatePostStatus,TResult? Function( String postId)?  likePost,TResult? Function( String postId)?  unlikePost,TResult? Function( List<PostEntity> posts)?  feedUpdated,TResult? Function()?  clearFeed,}) {final _that = this;
switch (_that) {
case SubscribeToCommunityFeed() when subscribeToCommunityFeed != null:
return subscribeToCommunityFeed(_that.uid);case CreatePost() when createPost != null:
return createPost(_that.imageFile,_that.caption);case ResetCreatePostStatus() when resetCreatePostStatus != null:
return resetCreatePostStatus();case LikePost() when likePost != null:
return likePost(_that.postId);case UnlikePost() when unlikePost != null:
return unlikePost(_that.postId);case FeedUpdated() when feedUpdated != null:
return feedUpdated(_that.posts);case ClearFeed() when clearFeed != null:
return clearFeed();case _:
  return null;

}
}

}

/// @nodoc


class SubscribeToCommunityFeed implements CommunityEvent {
  const SubscribeToCommunityFeed({required this.uid});
  

 final  String uid;

/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscribeToCommunityFeedCopyWith<SubscribeToCommunityFeed> get copyWith => _$SubscribeToCommunityFeedCopyWithImpl<SubscribeToCommunityFeed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscribeToCommunityFeed&&(identical(other.uid, uid) || other.uid == uid));
}


@override
int get hashCode => Object.hash(runtimeType,uid);

@override
String toString() {
  return 'CommunityEvent.subscribeToCommunityFeed(uid: $uid)';
}


}

/// @nodoc
abstract mixin class $SubscribeToCommunityFeedCopyWith<$Res> implements $CommunityEventCopyWith<$Res> {
  factory $SubscribeToCommunityFeedCopyWith(SubscribeToCommunityFeed value, $Res Function(SubscribeToCommunityFeed) _then) = _$SubscribeToCommunityFeedCopyWithImpl;
@useResult
$Res call({
 String uid
});




}
/// @nodoc
class _$SubscribeToCommunityFeedCopyWithImpl<$Res>
    implements $SubscribeToCommunityFeedCopyWith<$Res> {
  _$SubscribeToCommunityFeedCopyWithImpl(this._self, this._then);

  final SubscribeToCommunityFeed _self;
  final $Res Function(SubscribeToCommunityFeed) _then;

/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uid = null,}) {
  return _then(SubscribeToCommunityFeed(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CreatePost implements CommunityEvent {
  const CreatePost({required this.imageFile, required this.caption});
  

 final  File imageFile;
 final  String caption;

/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePostCopyWith<CreatePost> get copyWith => _$CreatePostCopyWithImpl<CreatePost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePost&&(identical(other.imageFile, imageFile) || other.imageFile == imageFile)&&(identical(other.caption, caption) || other.caption == caption));
}


@override
int get hashCode => Object.hash(runtimeType,imageFile,caption);

@override
String toString() {
  return 'CommunityEvent.createPost(imageFile: $imageFile, caption: $caption)';
}


}

/// @nodoc
abstract mixin class $CreatePostCopyWith<$Res> implements $CommunityEventCopyWith<$Res> {
  factory $CreatePostCopyWith(CreatePost value, $Res Function(CreatePost) _then) = _$CreatePostCopyWithImpl;
@useResult
$Res call({
 File imageFile, String caption
});




}
/// @nodoc
class _$CreatePostCopyWithImpl<$Res>
    implements $CreatePostCopyWith<$Res> {
  _$CreatePostCopyWithImpl(this._self, this._then);

  final CreatePost _self;
  final $Res Function(CreatePost) _then;

/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imageFile = null,Object? caption = null,}) {
  return _then(CreatePost(
imageFile: null == imageFile ? _self.imageFile : imageFile // ignore: cast_nullable_to_non_nullable
as File,caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ResetCreatePostStatus implements CommunityEvent {
  const ResetCreatePostStatus();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetCreatePostStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommunityEvent.resetCreatePostStatus()';
}


}




/// @nodoc


class LikePost implements CommunityEvent {
  const LikePost(this.postId);
  

 final  String postId;

/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikePostCopyWith<LikePost> get copyWith => _$LikePostCopyWithImpl<LikePost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikePost&&(identical(other.postId, postId) || other.postId == postId));
}


@override
int get hashCode => Object.hash(runtimeType,postId);

@override
String toString() {
  return 'CommunityEvent.likePost(postId: $postId)';
}


}

/// @nodoc
abstract mixin class $LikePostCopyWith<$Res> implements $CommunityEventCopyWith<$Res> {
  factory $LikePostCopyWith(LikePost value, $Res Function(LikePost) _then) = _$LikePostCopyWithImpl;
@useResult
$Res call({
 String postId
});




}
/// @nodoc
class _$LikePostCopyWithImpl<$Res>
    implements $LikePostCopyWith<$Res> {
  _$LikePostCopyWithImpl(this._self, this._then);

  final LikePost _self;
  final $Res Function(LikePost) _then;

/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? postId = null,}) {
  return _then(LikePost(
null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UnlikePost implements CommunityEvent {
  const UnlikePost(this.postId);
  

 final  String postId;

/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnlikePostCopyWith<UnlikePost> get copyWith => _$UnlikePostCopyWithImpl<UnlikePost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnlikePost&&(identical(other.postId, postId) || other.postId == postId));
}


@override
int get hashCode => Object.hash(runtimeType,postId);

@override
String toString() {
  return 'CommunityEvent.unlikePost(postId: $postId)';
}


}

/// @nodoc
abstract mixin class $UnlikePostCopyWith<$Res> implements $CommunityEventCopyWith<$Res> {
  factory $UnlikePostCopyWith(UnlikePost value, $Res Function(UnlikePost) _then) = _$UnlikePostCopyWithImpl;
@useResult
$Res call({
 String postId
});




}
/// @nodoc
class _$UnlikePostCopyWithImpl<$Res>
    implements $UnlikePostCopyWith<$Res> {
  _$UnlikePostCopyWithImpl(this._self, this._then);

  final UnlikePost _self;
  final $Res Function(UnlikePost) _then;

/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? postId = null,}) {
  return _then(UnlikePost(
null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FeedUpdated implements CommunityEvent {
  const FeedUpdated(final  List<PostEntity> posts): _posts = posts;
  

 final  List<PostEntity> _posts;
 List<PostEntity> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedUpdatedCopyWith<FeedUpdated> get copyWith => _$FeedUpdatedCopyWithImpl<FeedUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedUpdated&&const DeepCollectionEquality().equals(other._posts, _posts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'CommunityEvent.feedUpdated(posts: $posts)';
}


}

/// @nodoc
abstract mixin class $FeedUpdatedCopyWith<$Res> implements $CommunityEventCopyWith<$Res> {
  factory $FeedUpdatedCopyWith(FeedUpdated value, $Res Function(FeedUpdated) _then) = _$FeedUpdatedCopyWithImpl;
@useResult
$Res call({
 List<PostEntity> posts
});




}
/// @nodoc
class _$FeedUpdatedCopyWithImpl<$Res>
    implements $FeedUpdatedCopyWith<$Res> {
  _$FeedUpdatedCopyWithImpl(this._self, this._then);

  final FeedUpdated _self;
  final $Res Function(FeedUpdated) _then;

/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? posts = null,}) {
  return _then(FeedUpdated(
null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostEntity>,
  ));
}


}

/// @nodoc


class ClearFeed implements CommunityEvent {
  const ClearFeed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearFeed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommunityEvent.clearFeed()';
}


}




// dart format on
