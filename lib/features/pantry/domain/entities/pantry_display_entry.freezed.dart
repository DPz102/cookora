// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pantry_display_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PantryDisplayEntry {

 PantryEntry get entry; Ingredient get ingredientInfo;
/// Create a copy of PantryDisplayEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PantryDisplayEntryCopyWith<PantryDisplayEntry> get copyWith => _$PantryDisplayEntryCopyWithImpl<PantryDisplayEntry>(this as PantryDisplayEntry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PantryDisplayEntry&&(identical(other.entry, entry) || other.entry == entry)&&(identical(other.ingredientInfo, ingredientInfo) || other.ingredientInfo == ingredientInfo));
}


@override
int get hashCode => Object.hash(runtimeType,entry,ingredientInfo);

@override
String toString() {
  return 'PantryDisplayEntry(entry: $entry, ingredientInfo: $ingredientInfo)';
}


}

/// @nodoc
abstract mixin class $PantryDisplayEntryCopyWith<$Res>  {
  factory $PantryDisplayEntryCopyWith(PantryDisplayEntry value, $Res Function(PantryDisplayEntry) _then) = _$PantryDisplayEntryCopyWithImpl;
@useResult
$Res call({
 PantryEntry entry, Ingredient ingredientInfo
});


$PantryEntryCopyWith<$Res> get entry;$IngredientCopyWith<$Res> get ingredientInfo;

}
/// @nodoc
class _$PantryDisplayEntryCopyWithImpl<$Res>
    implements $PantryDisplayEntryCopyWith<$Res> {
  _$PantryDisplayEntryCopyWithImpl(this._self, this._then);

  final PantryDisplayEntry _self;
  final $Res Function(PantryDisplayEntry) _then;

/// Create a copy of PantryDisplayEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entry = null,Object? ingredientInfo = null,}) {
  return _then(_self.copyWith(
entry: null == entry ? _self.entry : entry // ignore: cast_nullable_to_non_nullable
as PantryEntry,ingredientInfo: null == ingredientInfo ? _self.ingredientInfo : ingredientInfo // ignore: cast_nullable_to_non_nullable
as Ingredient,
  ));
}
/// Create a copy of PantryDisplayEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PantryEntryCopyWith<$Res> get entry {
  
  return $PantryEntryCopyWith<$Res>(_self.entry, (value) {
    return _then(_self.copyWith(entry: value));
  });
}/// Create a copy of PantryDisplayEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IngredientCopyWith<$Res> get ingredientInfo {
  
  return $IngredientCopyWith<$Res>(_self.ingredientInfo, (value) {
    return _then(_self.copyWith(ingredientInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [PantryDisplayEntry].
extension PantryDisplayEntryPatterns on PantryDisplayEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PantryDisplayEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PantryDisplayEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PantryDisplayEntry value)  $default,){
final _that = this;
switch (_that) {
case _PantryDisplayEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PantryDisplayEntry value)?  $default,){
final _that = this;
switch (_that) {
case _PantryDisplayEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PantryEntry entry,  Ingredient ingredientInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PantryDisplayEntry() when $default != null:
return $default(_that.entry,_that.ingredientInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PantryEntry entry,  Ingredient ingredientInfo)  $default,) {final _that = this;
switch (_that) {
case _PantryDisplayEntry():
return $default(_that.entry,_that.ingredientInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PantryEntry entry,  Ingredient ingredientInfo)?  $default,) {final _that = this;
switch (_that) {
case _PantryDisplayEntry() when $default != null:
return $default(_that.entry,_that.ingredientInfo);case _:
  return null;

}
}

}

/// @nodoc


class _PantryDisplayEntry implements PantryDisplayEntry {
  const _PantryDisplayEntry({required this.entry, required this.ingredientInfo});
  

@override final  PantryEntry entry;
@override final  Ingredient ingredientInfo;

/// Create a copy of PantryDisplayEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PantryDisplayEntryCopyWith<_PantryDisplayEntry> get copyWith => __$PantryDisplayEntryCopyWithImpl<_PantryDisplayEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PantryDisplayEntry&&(identical(other.entry, entry) || other.entry == entry)&&(identical(other.ingredientInfo, ingredientInfo) || other.ingredientInfo == ingredientInfo));
}


@override
int get hashCode => Object.hash(runtimeType,entry,ingredientInfo);

@override
String toString() {
  return 'PantryDisplayEntry(entry: $entry, ingredientInfo: $ingredientInfo)';
}


}

/// @nodoc
abstract mixin class _$PantryDisplayEntryCopyWith<$Res> implements $PantryDisplayEntryCopyWith<$Res> {
  factory _$PantryDisplayEntryCopyWith(_PantryDisplayEntry value, $Res Function(_PantryDisplayEntry) _then) = __$PantryDisplayEntryCopyWithImpl;
@override @useResult
$Res call({
 PantryEntry entry, Ingredient ingredientInfo
});


@override $PantryEntryCopyWith<$Res> get entry;@override $IngredientCopyWith<$Res> get ingredientInfo;

}
/// @nodoc
class __$PantryDisplayEntryCopyWithImpl<$Res>
    implements _$PantryDisplayEntryCopyWith<$Res> {
  __$PantryDisplayEntryCopyWithImpl(this._self, this._then);

  final _PantryDisplayEntry _self;
  final $Res Function(_PantryDisplayEntry) _then;

/// Create a copy of PantryDisplayEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entry = null,Object? ingredientInfo = null,}) {
  return _then(_PantryDisplayEntry(
entry: null == entry ? _self.entry : entry // ignore: cast_nullable_to_non_nullable
as PantryEntry,ingredientInfo: null == ingredientInfo ? _self.ingredientInfo : ingredientInfo // ignore: cast_nullable_to_non_nullable
as Ingredient,
  ));
}

/// Create a copy of PantryDisplayEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PantryEntryCopyWith<$Res> get entry {
  
  return $PantryEntryCopyWith<$Res>(_self.entry, (value) {
    return _then(_self.copyWith(entry: value));
  });
}/// Create a copy of PantryDisplayEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IngredientCopyWith<$Res> get ingredientInfo {
  
  return $IngredientCopyWith<$Res>(_self.ingredientInfo, (value) {
    return _then(_self.copyWith(ingredientInfo: value));
  });
}
}

// dart format on
