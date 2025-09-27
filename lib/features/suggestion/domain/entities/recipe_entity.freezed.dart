// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeEntity {

// --- Dữ liệu cốt lỗi ---
 String get id; String get name; String get description; List<String> get requiredIngredients; List<String> get optionalIngredients; List<String> get instructions;// --- Siêu dữ liệu (Metadata) ---
 RecipeSource get source;@JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) DateTime? get createdAt; bool get isUserFavorite;// -- Các trường dự trù cho tương lai
 int get servingSize;// Suất ăn cho mấy người
 int get cookTimeInMinutes;// Thời gian nấu (phút)
 String get difficulty;
/// Create a copy of RecipeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeEntityCopyWith<RecipeEntity> get copyWith => _$RecipeEntityCopyWithImpl<RecipeEntity>(this as RecipeEntity, _$identity);

  /// Serializes this RecipeEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.requiredIngredients, requiredIngredients)&&const DeepCollectionEquality().equals(other.optionalIngredients, optionalIngredients)&&const DeepCollectionEquality().equals(other.instructions, instructions)&&(identical(other.source, source) || other.source == source)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isUserFavorite, isUserFavorite) || other.isUserFavorite == isUserFavorite)&&(identical(other.servingSize, servingSize) || other.servingSize == servingSize)&&(identical(other.cookTimeInMinutes, cookTimeInMinutes) || other.cookTimeInMinutes == cookTimeInMinutes)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(requiredIngredients),const DeepCollectionEquality().hash(optionalIngredients),const DeepCollectionEquality().hash(instructions),source,createdAt,isUserFavorite,servingSize,cookTimeInMinutes,difficulty);

@override
String toString() {
  return 'RecipeEntity(id: $id, name: $name, description: $description, requiredIngredients: $requiredIngredients, optionalIngredients: $optionalIngredients, instructions: $instructions, source: $source, createdAt: $createdAt, isUserFavorite: $isUserFavorite, servingSize: $servingSize, cookTimeInMinutes: $cookTimeInMinutes, difficulty: $difficulty)';
}


}

/// @nodoc
abstract mixin class $RecipeEntityCopyWith<$Res>  {
  factory $RecipeEntityCopyWith(RecipeEntity value, $Res Function(RecipeEntity) _then) = _$RecipeEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, List<String> requiredIngredients, List<String> optionalIngredients, List<String> instructions, RecipeSource source,@JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) DateTime? createdAt, bool isUserFavorite, int servingSize, int cookTimeInMinutes, String difficulty
});




}
/// @nodoc
class _$RecipeEntityCopyWithImpl<$Res>
    implements $RecipeEntityCopyWith<$Res> {
  _$RecipeEntityCopyWithImpl(this._self, this._then);

  final RecipeEntity _self;
  final $Res Function(RecipeEntity) _then;

/// Create a copy of RecipeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? requiredIngredients = null,Object? optionalIngredients = null,Object? instructions = null,Object? source = null,Object? createdAt = freezed,Object? isUserFavorite = null,Object? servingSize = null,Object? cookTimeInMinutes = null,Object? difficulty = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,requiredIngredients: null == requiredIngredients ? _self.requiredIngredients : requiredIngredients // ignore: cast_nullable_to_non_nullable
as List<String>,optionalIngredients: null == optionalIngredients ? _self.optionalIngredients : optionalIngredients // ignore: cast_nullable_to_non_nullable
as List<String>,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as List<String>,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as RecipeSource,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isUserFavorite: null == isUserFavorite ? _self.isUserFavorite : isUserFavorite // ignore: cast_nullable_to_non_nullable
as bool,servingSize: null == servingSize ? _self.servingSize : servingSize // ignore: cast_nullable_to_non_nullable
as int,cookTimeInMinutes: null == cookTimeInMinutes ? _self.cookTimeInMinutes : cookTimeInMinutes // ignore: cast_nullable_to_non_nullable
as int,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeEntity].
extension RecipeEntityPatterns on RecipeEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeEntity value)  $default,){
final _that = this;
switch (_that) {
case _RecipeEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeEntity value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  List<String> requiredIngredients,  List<String> optionalIngredients,  List<String> instructions,  RecipeSource source, @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)  DateTime? createdAt,  bool isUserFavorite,  int servingSize,  int cookTimeInMinutes,  String difficulty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.requiredIngredients,_that.optionalIngredients,_that.instructions,_that.source,_that.createdAt,_that.isUserFavorite,_that.servingSize,_that.cookTimeInMinutes,_that.difficulty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  List<String> requiredIngredients,  List<String> optionalIngredients,  List<String> instructions,  RecipeSource source, @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)  DateTime? createdAt,  bool isUserFavorite,  int servingSize,  int cookTimeInMinutes,  String difficulty)  $default,) {final _that = this;
switch (_that) {
case _RecipeEntity():
return $default(_that.id,_that.name,_that.description,_that.requiredIngredients,_that.optionalIngredients,_that.instructions,_that.source,_that.createdAt,_that.isUserFavorite,_that.servingSize,_that.cookTimeInMinutes,_that.difficulty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  List<String> requiredIngredients,  List<String> optionalIngredients,  List<String> instructions,  RecipeSource source, @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)  DateTime? createdAt,  bool isUserFavorite,  int servingSize,  int cookTimeInMinutes,  String difficulty)?  $default,) {final _that = this;
switch (_that) {
case _RecipeEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.requiredIngredients,_that.optionalIngredients,_that.instructions,_that.source,_that.createdAt,_that.isUserFavorite,_that.servingSize,_that.cookTimeInMinutes,_that.difficulty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecipeEntity implements RecipeEntity {
  const _RecipeEntity({this.id = '', this.name = '', this.description = '', final  List<String> requiredIngredients = const [], final  List<String> optionalIngredients = const [], final  List<String> instructions = const [], this.source = RecipeSource.unknown, @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) this.createdAt, this.isUserFavorite = false, this.servingSize = 2, this.cookTimeInMinutes = 20, this.difficulty = 'Dễ'}): _requiredIngredients = requiredIngredients,_optionalIngredients = optionalIngredients,_instructions = instructions;
  factory _RecipeEntity.fromJson(Map<String, dynamic> json) => _$RecipeEntityFromJson(json);

// --- Dữ liệu cốt lỗi ---
@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String description;
 final  List<String> _requiredIngredients;
@override@JsonKey() List<String> get requiredIngredients {
  if (_requiredIngredients is EqualUnmodifiableListView) return _requiredIngredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requiredIngredients);
}

 final  List<String> _optionalIngredients;
@override@JsonKey() List<String> get optionalIngredients {
  if (_optionalIngredients is EqualUnmodifiableListView) return _optionalIngredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_optionalIngredients);
}

 final  List<String> _instructions;
@override@JsonKey() List<String> get instructions {
  if (_instructions is EqualUnmodifiableListView) return _instructions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_instructions);
}

// --- Siêu dữ liệu (Metadata) ---
@override@JsonKey() final  RecipeSource source;
@override@JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) final  DateTime? createdAt;
@override@JsonKey() final  bool isUserFavorite;
// -- Các trường dự trù cho tương lai
@override@JsonKey() final  int servingSize;
// Suất ăn cho mấy người
@override@JsonKey() final  int cookTimeInMinutes;
// Thời gian nấu (phút)
@override@JsonKey() final  String difficulty;

/// Create a copy of RecipeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeEntityCopyWith<_RecipeEntity> get copyWith => __$RecipeEntityCopyWithImpl<_RecipeEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._requiredIngredients, _requiredIngredients)&&const DeepCollectionEquality().equals(other._optionalIngredients, _optionalIngredients)&&const DeepCollectionEquality().equals(other._instructions, _instructions)&&(identical(other.source, source) || other.source == source)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isUserFavorite, isUserFavorite) || other.isUserFavorite == isUserFavorite)&&(identical(other.servingSize, servingSize) || other.servingSize == servingSize)&&(identical(other.cookTimeInMinutes, cookTimeInMinutes) || other.cookTimeInMinutes == cookTimeInMinutes)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(_requiredIngredients),const DeepCollectionEquality().hash(_optionalIngredients),const DeepCollectionEquality().hash(_instructions),source,createdAt,isUserFavorite,servingSize,cookTimeInMinutes,difficulty);

@override
String toString() {
  return 'RecipeEntity(id: $id, name: $name, description: $description, requiredIngredients: $requiredIngredients, optionalIngredients: $optionalIngredients, instructions: $instructions, source: $source, createdAt: $createdAt, isUserFavorite: $isUserFavorite, servingSize: $servingSize, cookTimeInMinutes: $cookTimeInMinutes, difficulty: $difficulty)';
}


}

/// @nodoc
abstract mixin class _$RecipeEntityCopyWith<$Res> implements $RecipeEntityCopyWith<$Res> {
  factory _$RecipeEntityCopyWith(_RecipeEntity value, $Res Function(_RecipeEntity) _then) = __$RecipeEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, List<String> requiredIngredients, List<String> optionalIngredients, List<String> instructions, RecipeSource source,@JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) DateTime? createdAt, bool isUserFavorite, int servingSize, int cookTimeInMinutes, String difficulty
});




}
/// @nodoc
class __$RecipeEntityCopyWithImpl<$Res>
    implements _$RecipeEntityCopyWith<$Res> {
  __$RecipeEntityCopyWithImpl(this._self, this._then);

  final _RecipeEntity _self;
  final $Res Function(_RecipeEntity) _then;

/// Create a copy of RecipeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? requiredIngredients = null,Object? optionalIngredients = null,Object? instructions = null,Object? source = null,Object? createdAt = freezed,Object? isUserFavorite = null,Object? servingSize = null,Object? cookTimeInMinutes = null,Object? difficulty = null,}) {
  return _then(_RecipeEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,requiredIngredients: null == requiredIngredients ? _self._requiredIngredients : requiredIngredients // ignore: cast_nullable_to_non_nullable
as List<String>,optionalIngredients: null == optionalIngredients ? _self._optionalIngredients : optionalIngredients // ignore: cast_nullable_to_non_nullable
as List<String>,instructions: null == instructions ? _self._instructions : instructions // ignore: cast_nullable_to_non_nullable
as List<String>,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as RecipeSource,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isUserFavorite: null == isUserFavorite ? _self.isUserFavorite : isUserFavorite // ignore: cast_nullable_to_non_nullable
as bool,servingSize: null == servingSize ? _self.servingSize : servingSize // ignore: cast_nullable_to_non_nullable
as int,cookTimeInMinutes: null == cookTimeInMinutes ? _self.cookTimeInMinutes : cookTimeInMinutes // ignore: cast_nullable_to_non_nullable
as int,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
