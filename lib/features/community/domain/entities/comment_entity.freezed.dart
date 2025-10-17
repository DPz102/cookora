// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentEntity {

 String? get id; String? get parentId; String get content; String get authorId; String get authorUsername; String get authorAvatarUrl;@JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) DateTime? get createdAt;
/// Create a copy of CommentEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentEntityCopyWith<CommentEntity> get copyWith => _$CommentEntityCopyWithImpl<CommentEntity>(this as CommentEntity, _$identity);

  /// Serializes this CommentEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.content, content) || other.content == content)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.authorUsername, authorUsername) || other.authorUsername == authorUsername)&&(identical(other.authorAvatarUrl, authorAvatarUrl) || other.authorAvatarUrl == authorAvatarUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,parentId,content,authorId,authorUsername,authorAvatarUrl,createdAt);

@override
String toString() {
  return 'CommentEntity(id: $id, parentId: $parentId, content: $content, authorId: $authorId, authorUsername: $authorUsername, authorAvatarUrl: $authorAvatarUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CommentEntityCopyWith<$Res>  {
  factory $CommentEntityCopyWith(CommentEntity value, $Res Function(CommentEntity) _then) = _$CommentEntityCopyWithImpl;
@useResult
$Res call({
 String? id, String? parentId, String content, String authorId, String authorUsername, String authorAvatarUrl,@JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) DateTime? createdAt
});




}
/// @nodoc
class _$CommentEntityCopyWithImpl<$Res>
    implements $CommentEntityCopyWith<$Res> {
  _$CommentEntityCopyWithImpl(this._self, this._then);

  final CommentEntity _self;
  final $Res Function(CommentEntity) _then;

/// Create a copy of CommentEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? parentId = freezed,Object? content = null,Object? authorId = null,Object? authorUsername = null,Object? authorAvatarUrl = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,authorUsername: null == authorUsername ? _self.authorUsername : authorUsername // ignore: cast_nullable_to_non_nullable
as String,authorAvatarUrl: null == authorAvatarUrl ? _self.authorAvatarUrl : authorAvatarUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentEntity].
extension CommentEntityPatterns on CommentEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentEntity value)  $default,){
final _that = this;
switch (_that) {
case _CommentEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CommentEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? parentId,  String content,  String authorId,  String authorUsername,  String authorAvatarUrl, @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentEntity() when $default != null:
return $default(_that.id,_that.parentId,_that.content,_that.authorId,_that.authorUsername,_that.authorAvatarUrl,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? parentId,  String content,  String authorId,  String authorUsername,  String authorAvatarUrl, @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _CommentEntity():
return $default(_that.id,_that.parentId,_that.content,_that.authorId,_that.authorUsername,_that.authorAvatarUrl,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? parentId,  String content,  String authorId,  String authorUsername,  String authorAvatarUrl, @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CommentEntity() when $default != null:
return $default(_that.id,_that.parentId,_that.content,_that.authorId,_that.authorUsername,_that.authorAvatarUrl,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommentEntity implements CommentEntity {
  const _CommentEntity({this.id, this.parentId, required this.content, required this.authorId, this.authorUsername = '', this.authorAvatarUrl = '', @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) this.createdAt});
  factory _CommentEntity.fromJson(Map<String, dynamic> json) => _$CommentEntityFromJson(json);

@override final  String? id;
@override final  String? parentId;
@override final  String content;
@override final  String authorId;
@override@JsonKey() final  String authorUsername;
@override@JsonKey() final  String authorAvatarUrl;
@override@JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) final  DateTime? createdAt;

/// Create a copy of CommentEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentEntityCopyWith<_CommentEntity> get copyWith => __$CommentEntityCopyWithImpl<_CommentEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.content, content) || other.content == content)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.authorUsername, authorUsername) || other.authorUsername == authorUsername)&&(identical(other.authorAvatarUrl, authorAvatarUrl) || other.authorAvatarUrl == authorAvatarUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,parentId,content,authorId,authorUsername,authorAvatarUrl,createdAt);

@override
String toString() {
  return 'CommentEntity(id: $id, parentId: $parentId, content: $content, authorId: $authorId, authorUsername: $authorUsername, authorAvatarUrl: $authorAvatarUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CommentEntityCopyWith<$Res> implements $CommentEntityCopyWith<$Res> {
  factory _$CommentEntityCopyWith(_CommentEntity value, $Res Function(_CommentEntity) _then) = __$CommentEntityCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? parentId, String content, String authorId, String authorUsername, String authorAvatarUrl,@JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) DateTime? createdAt
});




}
/// @nodoc
class __$CommentEntityCopyWithImpl<$Res>
    implements _$CommentEntityCopyWith<$Res> {
  __$CommentEntityCopyWithImpl(this._self, this._then);

  final _CommentEntity _self;
  final $Res Function(_CommentEntity) _then;

/// Create a copy of CommentEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? parentId = freezed,Object? content = null,Object? authorId = null,Object? authorUsername = null,Object? authorAvatarUrl = null,Object? createdAt = freezed,}) {
  return _then(_CommentEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,authorUsername: null == authorUsername ? _self.authorUsername : authorUsername // ignore: cast_nullable_to_non_nullable
as String,authorAvatarUrl: null == authorAvatarUrl ? _self.authorAvatarUrl : authorAvatarUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
