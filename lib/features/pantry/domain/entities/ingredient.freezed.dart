// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Ingredient {

 String get ingredientId; String get name; String get description; String get category; List<String> get searchKeywords; List<String> get validUnits; int get defaultShelfLifeInDays; String get imageUrl;
/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientCopyWith<Ingredient> get copyWith => _$IngredientCopyWithImpl<Ingredient>(this as Ingredient, _$identity);

  /// Serializes this Ingredient to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ingredient&&(identical(other.ingredientId, ingredientId) || other.ingredientId == ingredientId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.searchKeywords, searchKeywords)&&const DeepCollectionEquality().equals(other.validUnits, validUnits)&&(identical(other.defaultShelfLifeInDays, defaultShelfLifeInDays) || other.defaultShelfLifeInDays == defaultShelfLifeInDays)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ingredientId,name,description,category,const DeepCollectionEquality().hash(searchKeywords),const DeepCollectionEquality().hash(validUnits),defaultShelfLifeInDays,imageUrl);

@override
String toString() {
  return 'Ingredient(ingredientId: $ingredientId, name: $name, description: $description, category: $category, searchKeywords: $searchKeywords, validUnits: $validUnits, defaultShelfLifeInDays: $defaultShelfLifeInDays, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $IngredientCopyWith<$Res>  {
  factory $IngredientCopyWith(Ingredient value, $Res Function(Ingredient) _then) = _$IngredientCopyWithImpl;
@useResult
$Res call({
 String ingredientId, String name, String description, String category, List<String> searchKeywords, List<String> validUnits, int defaultShelfLifeInDays, String imageUrl
});




}
/// @nodoc
class _$IngredientCopyWithImpl<$Res>
    implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._self, this._then);

  final Ingredient _self;
  final $Res Function(Ingredient) _then;

/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ingredientId = null,Object? name = null,Object? description = null,Object? category = null,Object? searchKeywords = null,Object? validUnits = null,Object? defaultShelfLifeInDays = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
ingredientId: null == ingredientId ? _self.ingredientId : ingredientId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,searchKeywords: null == searchKeywords ? _self.searchKeywords : searchKeywords // ignore: cast_nullable_to_non_nullable
as List<String>,validUnits: null == validUnits ? _self.validUnits : validUnits // ignore: cast_nullable_to_non_nullable
as List<String>,defaultShelfLifeInDays: null == defaultShelfLifeInDays ? _self.defaultShelfLifeInDays : defaultShelfLifeInDays // ignore: cast_nullable_to_non_nullable
as int,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Ingredient].
extension IngredientPatterns on Ingredient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Ingredient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Ingredient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Ingredient value)  $default,){
final _that = this;
switch (_that) {
case _Ingredient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Ingredient value)?  $default,){
final _that = this;
switch (_that) {
case _Ingredient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ingredientId,  String name,  String description,  String category,  List<String> searchKeywords,  List<String> validUnits,  int defaultShelfLifeInDays,  String imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Ingredient() when $default != null:
return $default(_that.ingredientId,_that.name,_that.description,_that.category,_that.searchKeywords,_that.validUnits,_that.defaultShelfLifeInDays,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ingredientId,  String name,  String description,  String category,  List<String> searchKeywords,  List<String> validUnits,  int defaultShelfLifeInDays,  String imageUrl)  $default,) {final _that = this;
switch (_that) {
case _Ingredient():
return $default(_that.ingredientId,_that.name,_that.description,_that.category,_that.searchKeywords,_that.validUnits,_that.defaultShelfLifeInDays,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ingredientId,  String name,  String description,  String category,  List<String> searchKeywords,  List<String> validUnits,  int defaultShelfLifeInDays,  String imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _Ingredient() when $default != null:
return $default(_that.ingredientId,_that.name,_that.description,_that.category,_that.searchKeywords,_that.validUnits,_that.defaultShelfLifeInDays,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Ingredient implements Ingredient {
  const _Ingredient({this.ingredientId = '', this.name = '', this.description = '', this.category = '', final  List<String> searchKeywords = const [], final  List<String> validUnits = const [], this.defaultShelfLifeInDays = 3, this.imageUrl = ''}): _searchKeywords = searchKeywords,_validUnits = validUnits;
  factory _Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);

@override@JsonKey() final  String ingredientId;
@override@JsonKey() final  String name;
@override@JsonKey() final  String description;
@override@JsonKey() final  String category;
 final  List<String> _searchKeywords;
@override@JsonKey() List<String> get searchKeywords {
  if (_searchKeywords is EqualUnmodifiableListView) return _searchKeywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchKeywords);
}

 final  List<String> _validUnits;
@override@JsonKey() List<String> get validUnits {
  if (_validUnits is EqualUnmodifiableListView) return _validUnits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_validUnits);
}

@override@JsonKey() final  int defaultShelfLifeInDays;
@override@JsonKey() final  String imageUrl;

/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientCopyWith<_Ingredient> get copyWith => __$IngredientCopyWithImpl<_Ingredient>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IngredientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ingredient&&(identical(other.ingredientId, ingredientId) || other.ingredientId == ingredientId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._searchKeywords, _searchKeywords)&&const DeepCollectionEquality().equals(other._validUnits, _validUnits)&&(identical(other.defaultShelfLifeInDays, defaultShelfLifeInDays) || other.defaultShelfLifeInDays == defaultShelfLifeInDays)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ingredientId,name,description,category,const DeepCollectionEquality().hash(_searchKeywords),const DeepCollectionEquality().hash(_validUnits),defaultShelfLifeInDays,imageUrl);

@override
String toString() {
  return 'Ingredient(ingredientId: $ingredientId, name: $name, description: $description, category: $category, searchKeywords: $searchKeywords, validUnits: $validUnits, defaultShelfLifeInDays: $defaultShelfLifeInDays, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$IngredientCopyWith<$Res> implements $IngredientCopyWith<$Res> {
  factory _$IngredientCopyWith(_Ingredient value, $Res Function(_Ingredient) _then) = __$IngredientCopyWithImpl;
@override @useResult
$Res call({
 String ingredientId, String name, String description, String category, List<String> searchKeywords, List<String> validUnits, int defaultShelfLifeInDays, String imageUrl
});




}
/// @nodoc
class __$IngredientCopyWithImpl<$Res>
    implements _$IngredientCopyWith<$Res> {
  __$IngredientCopyWithImpl(this._self, this._then);

  final _Ingredient _self;
  final $Res Function(_Ingredient) _then;

/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ingredientId = null,Object? name = null,Object? description = null,Object? category = null,Object? searchKeywords = null,Object? validUnits = null,Object? defaultShelfLifeInDays = null,Object? imageUrl = null,}) {
  return _then(_Ingredient(
ingredientId: null == ingredientId ? _self.ingredientId : ingredientId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,searchKeywords: null == searchKeywords ? _self._searchKeywords : searchKeywords // ignore: cast_nullable_to_non_nullable
as List<String>,validUnits: null == validUnits ? _self._validUnits : validUnits // ignore: cast_nullable_to_non_nullable
as List<String>,defaultShelfLifeInDays: null == defaultShelfLifeInDays ? _self.defaultShelfLifeInDays : defaultShelfLifeInDays // ignore: cast_nullable_to_non_nullable
as int,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
