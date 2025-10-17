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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SubscribeToCommunityFeed value)?  subscribeToCommunityFeed,TResult Function( SubscribeToComments value)?  subscribeToComments,TResult Function( CreatePost value)?  createPost,TResult Function( ResetCreatePostStatus value)?  resetCreatePostStatus,TResult Function( LikePost value)?  likePost,TResult Function( UnlikePost value)?  unlikePost,TResult Function( FeedUpdated value)?  feedUpdated,TResult Function( CommentsUpdated value)?  commentsUpdated,TResult Function( AddComment value)?  addComment,TResult Function( UpdateComment value)?  updateComment,TResult Function( DeleteComment value)?  deleteComment,TResult Function( ClearComments value)?  clearComments,TResult Function( ClearFeed value)?  clearFeed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SubscribeToCommunityFeed() when subscribeToCommunityFeed != null:
return subscribeToCommunityFeed(_that);case SubscribeToComments() when subscribeToComments != null:
return subscribeToComments(_that);case CreatePost() when createPost != null:
return createPost(_that);case ResetCreatePostStatus() when resetCreatePostStatus != null:
return resetCreatePostStatus(_that);case LikePost() when likePost != null:
return likePost(_that);case UnlikePost() when unlikePost != null:
return unlikePost(_that);case FeedUpdated() when feedUpdated != null:
return feedUpdated(_that);case CommentsUpdated() when commentsUpdated != null:
return commentsUpdated(_that);case AddComment() when addComment != null:
return addComment(_that);case UpdateComment() when updateComment != null:
return updateComment(_that);case DeleteComment() when deleteComment != null:
return deleteComment(_that);case ClearComments() when clearComments != null:
return clearComments(_that);case ClearFeed() when clearFeed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SubscribeToCommunityFeed value)  subscribeToCommunityFeed,required TResult Function( SubscribeToComments value)  subscribeToComments,required TResult Function( CreatePost value)  createPost,required TResult Function( ResetCreatePostStatus value)  resetCreatePostStatus,required TResult Function( LikePost value)  likePost,required TResult Function( UnlikePost value)  unlikePost,required TResult Function( FeedUpdated value)  feedUpdated,required TResult Function( CommentsUpdated value)  commentsUpdated,required TResult Function( AddComment value)  addComment,required TResult Function( UpdateComment value)  updateComment,required TResult Function( DeleteComment value)  deleteComment,required TResult Function( ClearComments value)  clearComments,required TResult Function( ClearFeed value)  clearFeed,}){
final _that = this;
switch (_that) {
case SubscribeToCommunityFeed():
return subscribeToCommunityFeed(_that);case SubscribeToComments():
return subscribeToComments(_that);case CreatePost():
return createPost(_that);case ResetCreatePostStatus():
return resetCreatePostStatus(_that);case LikePost():
return likePost(_that);case UnlikePost():
return unlikePost(_that);case FeedUpdated():
return feedUpdated(_that);case CommentsUpdated():
return commentsUpdated(_that);case AddComment():
return addComment(_that);case UpdateComment():
return updateComment(_that);case DeleteComment():
return deleteComment(_that);case ClearComments():
return clearComments(_that);case ClearFeed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SubscribeToCommunityFeed value)?  subscribeToCommunityFeed,TResult? Function( SubscribeToComments value)?  subscribeToComments,TResult? Function( CreatePost value)?  createPost,TResult? Function( ResetCreatePostStatus value)?  resetCreatePostStatus,TResult? Function( LikePost value)?  likePost,TResult? Function( UnlikePost value)?  unlikePost,TResult? Function( FeedUpdated value)?  feedUpdated,TResult? Function( CommentsUpdated value)?  commentsUpdated,TResult? Function( AddComment value)?  addComment,TResult? Function( UpdateComment value)?  updateComment,TResult? Function( DeleteComment value)?  deleteComment,TResult? Function( ClearComments value)?  clearComments,TResult? Function( ClearFeed value)?  clearFeed,}){
final _that = this;
switch (_that) {
case SubscribeToCommunityFeed() when subscribeToCommunityFeed != null:
return subscribeToCommunityFeed(_that);case SubscribeToComments() when subscribeToComments != null:
return subscribeToComments(_that);case CreatePost() when createPost != null:
return createPost(_that);case ResetCreatePostStatus() when resetCreatePostStatus != null:
return resetCreatePostStatus(_that);case LikePost() when likePost != null:
return likePost(_that);case UnlikePost() when unlikePost != null:
return unlikePost(_that);case FeedUpdated() when feedUpdated != null:
return feedUpdated(_that);case CommentsUpdated() when commentsUpdated != null:
return commentsUpdated(_that);case AddComment() when addComment != null:
return addComment(_that);case UpdateComment() when updateComment != null:
return updateComment(_that);case DeleteComment() when deleteComment != null:
return deleteComment(_that);case ClearComments() when clearComments != null:
return clearComments(_that);case ClearFeed() when clearFeed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String uid)?  subscribeToCommunityFeed,TResult Function( String postId)?  subscribeToComments,TResult Function( File imageFile,  String caption)?  createPost,TResult Function()?  resetCreatePostStatus,TResult Function( String postId)?  likePost,TResult Function( String postId)?  unlikePost,TResult Function( List<PostEntity> posts)?  feedUpdated,TResult Function( List<CommentEntity> comments)?  commentsUpdated,TResult Function( String postId,  String content,  String? parentId)?  addComment,TResult Function( String postId,  String commentId,  String content)?  updateComment,TResult Function( String postId,  String commentId)?  deleteComment,TResult Function()?  clearComments,TResult Function()?  clearFeed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SubscribeToCommunityFeed() when subscribeToCommunityFeed != null:
return subscribeToCommunityFeed(_that.uid);case SubscribeToComments() when subscribeToComments != null:
return subscribeToComments(_that.postId);case CreatePost() when createPost != null:
return createPost(_that.imageFile,_that.caption);case ResetCreatePostStatus() when resetCreatePostStatus != null:
return resetCreatePostStatus();case LikePost() when likePost != null:
return likePost(_that.postId);case UnlikePost() when unlikePost != null:
return unlikePost(_that.postId);case FeedUpdated() when feedUpdated != null:
return feedUpdated(_that.posts);case CommentsUpdated() when commentsUpdated != null:
return commentsUpdated(_that.comments);case AddComment() when addComment != null:
return addComment(_that.postId,_that.content,_that.parentId);case UpdateComment() when updateComment != null:
return updateComment(_that.postId,_that.commentId,_that.content);case DeleteComment() when deleteComment != null:
return deleteComment(_that.postId,_that.commentId);case ClearComments() when clearComments != null:
return clearComments();case ClearFeed() when clearFeed != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String uid)  subscribeToCommunityFeed,required TResult Function( String postId)  subscribeToComments,required TResult Function( File imageFile,  String caption)  createPost,required TResult Function()  resetCreatePostStatus,required TResult Function( String postId)  likePost,required TResult Function( String postId)  unlikePost,required TResult Function( List<PostEntity> posts)  feedUpdated,required TResult Function( List<CommentEntity> comments)  commentsUpdated,required TResult Function( String postId,  String content,  String? parentId)  addComment,required TResult Function( String postId,  String commentId,  String content)  updateComment,required TResult Function( String postId,  String commentId)  deleteComment,required TResult Function()  clearComments,required TResult Function()  clearFeed,}) {final _that = this;
switch (_that) {
case SubscribeToCommunityFeed():
return subscribeToCommunityFeed(_that.uid);case SubscribeToComments():
return subscribeToComments(_that.postId);case CreatePost():
return createPost(_that.imageFile,_that.caption);case ResetCreatePostStatus():
return resetCreatePostStatus();case LikePost():
return likePost(_that.postId);case UnlikePost():
return unlikePost(_that.postId);case FeedUpdated():
return feedUpdated(_that.posts);case CommentsUpdated():
return commentsUpdated(_that.comments);case AddComment():
return addComment(_that.postId,_that.content,_that.parentId);case UpdateComment():
return updateComment(_that.postId,_that.commentId,_that.content);case DeleteComment():
return deleteComment(_that.postId,_that.commentId);case ClearComments():
return clearComments();case ClearFeed():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String uid)?  subscribeToCommunityFeed,TResult? Function( String postId)?  subscribeToComments,TResult? Function( File imageFile,  String caption)?  createPost,TResult? Function()?  resetCreatePostStatus,TResult? Function( String postId)?  likePost,TResult? Function( String postId)?  unlikePost,TResult? Function( List<PostEntity> posts)?  feedUpdated,TResult? Function( List<CommentEntity> comments)?  commentsUpdated,TResult? Function( String postId,  String content,  String? parentId)?  addComment,TResult? Function( String postId,  String commentId,  String content)?  updateComment,TResult? Function( String postId,  String commentId)?  deleteComment,TResult? Function()?  clearComments,TResult? Function()?  clearFeed,}) {final _that = this;
switch (_that) {
case SubscribeToCommunityFeed() when subscribeToCommunityFeed != null:
return subscribeToCommunityFeed(_that.uid);case SubscribeToComments() when subscribeToComments != null:
return subscribeToComments(_that.postId);case CreatePost() when createPost != null:
return createPost(_that.imageFile,_that.caption);case ResetCreatePostStatus() when resetCreatePostStatus != null:
return resetCreatePostStatus();case LikePost() when likePost != null:
return likePost(_that.postId);case UnlikePost() when unlikePost != null:
return unlikePost(_that.postId);case FeedUpdated() when feedUpdated != null:
return feedUpdated(_that.posts);case CommentsUpdated() when commentsUpdated != null:
return commentsUpdated(_that.comments);case AddComment() when addComment != null:
return addComment(_that.postId,_that.content,_that.parentId);case UpdateComment() when updateComment != null:
return updateComment(_that.postId,_that.commentId,_that.content);case DeleteComment() when deleteComment != null:
return deleteComment(_that.postId,_that.commentId);case ClearComments() when clearComments != null:
return clearComments();case ClearFeed() when clearFeed != null:
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


class SubscribeToComments implements CommunityEvent {
  const SubscribeToComments({required this.postId});
  

 final  String postId;

/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscribeToCommentsCopyWith<SubscribeToComments> get copyWith => _$SubscribeToCommentsCopyWithImpl<SubscribeToComments>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscribeToComments&&(identical(other.postId, postId) || other.postId == postId));
}


@override
int get hashCode => Object.hash(runtimeType,postId);

@override
String toString() {
  return 'CommunityEvent.subscribeToComments(postId: $postId)';
}


}

/// @nodoc
abstract mixin class $SubscribeToCommentsCopyWith<$Res> implements $CommunityEventCopyWith<$Res> {
  factory $SubscribeToCommentsCopyWith(SubscribeToComments value, $Res Function(SubscribeToComments) _then) = _$SubscribeToCommentsCopyWithImpl;
@useResult
$Res call({
 String postId
});




}
/// @nodoc
class _$SubscribeToCommentsCopyWithImpl<$Res>
    implements $SubscribeToCommentsCopyWith<$Res> {
  _$SubscribeToCommentsCopyWithImpl(this._self, this._then);

  final SubscribeToComments _self;
  final $Res Function(SubscribeToComments) _then;

/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? postId = null,}) {
  return _then(SubscribeToComments(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
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


class CommentsUpdated implements CommunityEvent {
  const CommentsUpdated(final  List<CommentEntity> comments): _comments = comments;
  

 final  List<CommentEntity> _comments;
 List<CommentEntity> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}


/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentsUpdatedCopyWith<CommentsUpdated> get copyWith => _$CommentsUpdatedCopyWithImpl<CommentsUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentsUpdated&&const DeepCollectionEquality().equals(other._comments, _comments));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_comments));

@override
String toString() {
  return 'CommunityEvent.commentsUpdated(comments: $comments)';
}


}

/// @nodoc
abstract mixin class $CommentsUpdatedCopyWith<$Res> implements $CommunityEventCopyWith<$Res> {
  factory $CommentsUpdatedCopyWith(CommentsUpdated value, $Res Function(CommentsUpdated) _then) = _$CommentsUpdatedCopyWithImpl;
@useResult
$Res call({
 List<CommentEntity> comments
});




}
/// @nodoc
class _$CommentsUpdatedCopyWithImpl<$Res>
    implements $CommentsUpdatedCopyWith<$Res> {
  _$CommentsUpdatedCopyWithImpl(this._self, this._then);

  final CommentsUpdated _self;
  final $Res Function(CommentsUpdated) _then;

/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? comments = null,}) {
  return _then(CommentsUpdated(
null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentEntity>,
  ));
}


}

/// @nodoc


class AddComment implements CommunityEvent {
  const AddComment({required this.postId, required this.content, this.parentId});
  

 final  String postId;
 final  String content;
 final  String? parentId;

/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddCommentCopyWith<AddComment> get copyWith => _$AddCommentCopyWithImpl<AddComment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddComment&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.content, content) || other.content == content)&&(identical(other.parentId, parentId) || other.parentId == parentId));
}


@override
int get hashCode => Object.hash(runtimeType,postId,content,parentId);

@override
String toString() {
  return 'CommunityEvent.addComment(postId: $postId, content: $content, parentId: $parentId)';
}


}

/// @nodoc
abstract mixin class $AddCommentCopyWith<$Res> implements $CommunityEventCopyWith<$Res> {
  factory $AddCommentCopyWith(AddComment value, $Res Function(AddComment) _then) = _$AddCommentCopyWithImpl;
@useResult
$Res call({
 String postId, String content, String? parentId
});




}
/// @nodoc
class _$AddCommentCopyWithImpl<$Res>
    implements $AddCommentCopyWith<$Res> {
  _$AddCommentCopyWithImpl(this._self, this._then);

  final AddComment _self;
  final $Res Function(AddComment) _then;

/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? postId = null,Object? content = null,Object? parentId = freezed,}) {
  return _then(AddComment(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class UpdateComment implements CommunityEvent {
  const UpdateComment({required this.postId, required this.commentId, required this.content});
  

 final  String postId;
 final  String commentId;
 final  String content;

/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateCommentCopyWith<UpdateComment> get copyWith => _$UpdateCommentCopyWithImpl<UpdateComment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateComment&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.commentId, commentId) || other.commentId == commentId)&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,postId,commentId,content);

@override
String toString() {
  return 'CommunityEvent.updateComment(postId: $postId, commentId: $commentId, content: $content)';
}


}

/// @nodoc
abstract mixin class $UpdateCommentCopyWith<$Res> implements $CommunityEventCopyWith<$Res> {
  factory $UpdateCommentCopyWith(UpdateComment value, $Res Function(UpdateComment) _then) = _$UpdateCommentCopyWithImpl;
@useResult
$Res call({
 String postId, String commentId, String content
});




}
/// @nodoc
class _$UpdateCommentCopyWithImpl<$Res>
    implements $UpdateCommentCopyWith<$Res> {
  _$UpdateCommentCopyWithImpl(this._self, this._then);

  final UpdateComment _self;
  final $Res Function(UpdateComment) _then;

/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? postId = null,Object? commentId = null,Object? content = null,}) {
  return _then(UpdateComment(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,commentId: null == commentId ? _self.commentId : commentId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DeleteComment implements CommunityEvent {
  const DeleteComment({required this.postId, required this.commentId});
  

 final  String postId;
 final  String commentId;

/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteCommentCopyWith<DeleteComment> get copyWith => _$DeleteCommentCopyWithImpl<DeleteComment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteComment&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.commentId, commentId) || other.commentId == commentId));
}


@override
int get hashCode => Object.hash(runtimeType,postId,commentId);

@override
String toString() {
  return 'CommunityEvent.deleteComment(postId: $postId, commentId: $commentId)';
}


}

/// @nodoc
abstract mixin class $DeleteCommentCopyWith<$Res> implements $CommunityEventCopyWith<$Res> {
  factory $DeleteCommentCopyWith(DeleteComment value, $Res Function(DeleteComment) _then) = _$DeleteCommentCopyWithImpl;
@useResult
$Res call({
 String postId, String commentId
});




}
/// @nodoc
class _$DeleteCommentCopyWithImpl<$Res>
    implements $DeleteCommentCopyWith<$Res> {
  _$DeleteCommentCopyWithImpl(this._self, this._then);

  final DeleteComment _self;
  final $Res Function(DeleteComment) _then;

/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? postId = null,Object? commentId = null,}) {
  return _then(DeleteComment(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,commentId: null == commentId ? _self.commentId : commentId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClearComments implements CommunityEvent {
  const ClearComments();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearComments);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommunityEvent.clearComments()';
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
