// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pantry_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PantryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PantryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PantryEvent()';
}


}

/// @nodoc
class $PantryEventCopyWith<$Res>  {
$PantryEventCopyWith(PantryEvent _, $Res Function(PantryEvent) __);
}


/// Adds pattern-matching-related methods to [PantryEvent].
extension PantryEventPatterns on PantryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SubscribeToPantry value)?  subscribeToPantry,TResult Function( AddIngredient value)?  addIngredient,TResult Function( UpdateIngredient value)?  updateIngredient,TResult Function( DeleteIngredient value)?  deleteIngredient,TResult Function( PantryStreamUpdated value)?  pantryStreamUpdated,TResult Function( ResetMutationStatus value)?  resetMutationStatus,TResult Function( ClearPantry value)?  clearPantry,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SubscribeToPantry() when subscribeToPantry != null:
return subscribeToPantry(_that);case AddIngredient() when addIngredient != null:
return addIngredient(_that);case UpdateIngredient() when updateIngredient != null:
return updateIngredient(_that);case DeleteIngredient() when deleteIngredient != null:
return deleteIngredient(_that);case PantryStreamUpdated() when pantryStreamUpdated != null:
return pantryStreamUpdated(_that);case ResetMutationStatus() when resetMutationStatus != null:
return resetMutationStatus(_that);case ClearPantry() when clearPantry != null:
return clearPantry(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SubscribeToPantry value)  subscribeToPantry,required TResult Function( AddIngredient value)  addIngredient,required TResult Function( UpdateIngredient value)  updateIngredient,required TResult Function( DeleteIngredient value)  deleteIngredient,required TResult Function( PantryStreamUpdated value)  pantryStreamUpdated,required TResult Function( ResetMutationStatus value)  resetMutationStatus,required TResult Function( ClearPantry value)  clearPantry,}){
final _that = this;
switch (_that) {
case SubscribeToPantry():
return subscribeToPantry(_that);case AddIngredient():
return addIngredient(_that);case UpdateIngredient():
return updateIngredient(_that);case DeleteIngredient():
return deleteIngredient(_that);case PantryStreamUpdated():
return pantryStreamUpdated(_that);case ResetMutationStatus():
return resetMutationStatus(_that);case ClearPantry():
return clearPantry(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SubscribeToPantry value)?  subscribeToPantry,TResult? Function( AddIngredient value)?  addIngredient,TResult? Function( UpdateIngredient value)?  updateIngredient,TResult? Function( DeleteIngredient value)?  deleteIngredient,TResult? Function( PantryStreamUpdated value)?  pantryStreamUpdated,TResult? Function( ResetMutationStatus value)?  resetMutationStatus,TResult? Function( ClearPantry value)?  clearPantry,}){
final _that = this;
switch (_that) {
case SubscribeToPantry() when subscribeToPantry != null:
return subscribeToPantry(_that);case AddIngredient() when addIngredient != null:
return addIngredient(_that);case UpdateIngredient() when updateIngredient != null:
return updateIngredient(_that);case DeleteIngredient() when deleteIngredient != null:
return deleteIngredient(_that);case PantryStreamUpdated() when pantryStreamUpdated != null:
return pantryStreamUpdated(_that);case ResetMutationStatus() when resetMutationStatus != null:
return resetMutationStatus(_that);case ClearPantry() when clearPantry != null:
return clearPantry(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String uid)?  subscribeToPantry,TResult Function( IngredientEntity ingredient)?  addIngredient,TResult Function( IngredientEntity ingredient)?  updateIngredient,TResult Function( String ingredientId)?  deleteIngredient,TResult Function( List<IngredientEntity> ingredients)?  pantryStreamUpdated,TResult Function()?  resetMutationStatus,TResult Function()?  clearPantry,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SubscribeToPantry() when subscribeToPantry != null:
return subscribeToPantry(_that.uid);case AddIngredient() when addIngredient != null:
return addIngredient(_that.ingredient);case UpdateIngredient() when updateIngredient != null:
return updateIngredient(_that.ingredient);case DeleteIngredient() when deleteIngredient != null:
return deleteIngredient(_that.ingredientId);case PantryStreamUpdated() when pantryStreamUpdated != null:
return pantryStreamUpdated(_that.ingredients);case ResetMutationStatus() when resetMutationStatus != null:
return resetMutationStatus();case ClearPantry() when clearPantry != null:
return clearPantry();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String uid)  subscribeToPantry,required TResult Function( IngredientEntity ingredient)  addIngredient,required TResult Function( IngredientEntity ingredient)  updateIngredient,required TResult Function( String ingredientId)  deleteIngredient,required TResult Function( List<IngredientEntity> ingredients)  pantryStreamUpdated,required TResult Function()  resetMutationStatus,required TResult Function()  clearPantry,}) {final _that = this;
switch (_that) {
case SubscribeToPantry():
return subscribeToPantry(_that.uid);case AddIngredient():
return addIngredient(_that.ingredient);case UpdateIngredient():
return updateIngredient(_that.ingredient);case DeleteIngredient():
return deleteIngredient(_that.ingredientId);case PantryStreamUpdated():
return pantryStreamUpdated(_that.ingredients);case ResetMutationStatus():
return resetMutationStatus();case ClearPantry():
return clearPantry();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String uid)?  subscribeToPantry,TResult? Function( IngredientEntity ingredient)?  addIngredient,TResult? Function( IngredientEntity ingredient)?  updateIngredient,TResult? Function( String ingredientId)?  deleteIngredient,TResult? Function( List<IngredientEntity> ingredients)?  pantryStreamUpdated,TResult? Function()?  resetMutationStatus,TResult? Function()?  clearPantry,}) {final _that = this;
switch (_that) {
case SubscribeToPantry() when subscribeToPantry != null:
return subscribeToPantry(_that.uid);case AddIngredient() when addIngredient != null:
return addIngredient(_that.ingredient);case UpdateIngredient() when updateIngredient != null:
return updateIngredient(_that.ingredient);case DeleteIngredient() when deleteIngredient != null:
return deleteIngredient(_that.ingredientId);case PantryStreamUpdated() when pantryStreamUpdated != null:
return pantryStreamUpdated(_that.ingredients);case ResetMutationStatus() when resetMutationStatus != null:
return resetMutationStatus();case ClearPantry() when clearPantry != null:
return clearPantry();case _:
  return null;

}
}

}

/// @nodoc


class SubscribeToPantry implements PantryEvent {
  const SubscribeToPantry({required this.uid});
  

 final  String uid;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscribeToPantryCopyWith<SubscribeToPantry> get copyWith => _$SubscribeToPantryCopyWithImpl<SubscribeToPantry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscribeToPantry&&(identical(other.uid, uid) || other.uid == uid));
}


@override
int get hashCode => Object.hash(runtimeType,uid);

@override
String toString() {
  return 'PantryEvent.subscribeToPantry(uid: $uid)';
}


}

/// @nodoc
abstract mixin class $SubscribeToPantryCopyWith<$Res> implements $PantryEventCopyWith<$Res> {
  factory $SubscribeToPantryCopyWith(SubscribeToPantry value, $Res Function(SubscribeToPantry) _then) = _$SubscribeToPantryCopyWithImpl;
@useResult
$Res call({
 String uid
});




}
/// @nodoc
class _$SubscribeToPantryCopyWithImpl<$Res>
    implements $SubscribeToPantryCopyWith<$Res> {
  _$SubscribeToPantryCopyWithImpl(this._self, this._then);

  final SubscribeToPantry _self;
  final $Res Function(SubscribeToPantry) _then;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uid = null,}) {
  return _then(SubscribeToPantry(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddIngredient implements PantryEvent {
  const AddIngredient({required this.ingredient});
  

 final  IngredientEntity ingredient;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddIngredientCopyWith<AddIngredient> get copyWith => _$AddIngredientCopyWithImpl<AddIngredient>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddIngredient&&(identical(other.ingredient, ingredient) || other.ingredient == ingredient));
}


@override
int get hashCode => Object.hash(runtimeType,ingredient);

@override
String toString() {
  return 'PantryEvent.addIngredient(ingredient: $ingredient)';
}


}

/// @nodoc
abstract mixin class $AddIngredientCopyWith<$Res> implements $PantryEventCopyWith<$Res> {
  factory $AddIngredientCopyWith(AddIngredient value, $Res Function(AddIngredient) _then) = _$AddIngredientCopyWithImpl;
@useResult
$Res call({
 IngredientEntity ingredient
});


$IngredientEntityCopyWith<$Res> get ingredient;

}
/// @nodoc
class _$AddIngredientCopyWithImpl<$Res>
    implements $AddIngredientCopyWith<$Res> {
  _$AddIngredientCopyWithImpl(this._self, this._then);

  final AddIngredient _self;
  final $Res Function(AddIngredient) _then;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ingredient = null,}) {
  return _then(AddIngredient(
ingredient: null == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as IngredientEntity,
  ));
}

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IngredientEntityCopyWith<$Res> get ingredient {
  
  return $IngredientEntityCopyWith<$Res>(_self.ingredient, (value) {
    return _then(_self.copyWith(ingredient: value));
  });
}
}

/// @nodoc


class UpdateIngredient implements PantryEvent {
  const UpdateIngredient(this.ingredient);
  

 final  IngredientEntity ingredient;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateIngredientCopyWith<UpdateIngredient> get copyWith => _$UpdateIngredientCopyWithImpl<UpdateIngredient>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateIngredient&&(identical(other.ingredient, ingredient) || other.ingredient == ingredient));
}


@override
int get hashCode => Object.hash(runtimeType,ingredient);

@override
String toString() {
  return 'PantryEvent.updateIngredient(ingredient: $ingredient)';
}


}

/// @nodoc
abstract mixin class $UpdateIngredientCopyWith<$Res> implements $PantryEventCopyWith<$Res> {
  factory $UpdateIngredientCopyWith(UpdateIngredient value, $Res Function(UpdateIngredient) _then) = _$UpdateIngredientCopyWithImpl;
@useResult
$Res call({
 IngredientEntity ingredient
});


$IngredientEntityCopyWith<$Res> get ingredient;

}
/// @nodoc
class _$UpdateIngredientCopyWithImpl<$Res>
    implements $UpdateIngredientCopyWith<$Res> {
  _$UpdateIngredientCopyWithImpl(this._self, this._then);

  final UpdateIngredient _self;
  final $Res Function(UpdateIngredient) _then;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ingredient = null,}) {
  return _then(UpdateIngredient(
null == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as IngredientEntity,
  ));
}

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IngredientEntityCopyWith<$Res> get ingredient {
  
  return $IngredientEntityCopyWith<$Res>(_self.ingredient, (value) {
    return _then(_self.copyWith(ingredient: value));
  });
}
}

/// @nodoc


class DeleteIngredient implements PantryEvent {
  const DeleteIngredient(this.ingredientId);
  

 final  String ingredientId;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteIngredientCopyWith<DeleteIngredient> get copyWith => _$DeleteIngredientCopyWithImpl<DeleteIngredient>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteIngredient&&(identical(other.ingredientId, ingredientId) || other.ingredientId == ingredientId));
}


@override
int get hashCode => Object.hash(runtimeType,ingredientId);

@override
String toString() {
  return 'PantryEvent.deleteIngredient(ingredientId: $ingredientId)';
}


}

/// @nodoc
abstract mixin class $DeleteIngredientCopyWith<$Res> implements $PantryEventCopyWith<$Res> {
  factory $DeleteIngredientCopyWith(DeleteIngredient value, $Res Function(DeleteIngredient) _then) = _$DeleteIngredientCopyWithImpl;
@useResult
$Res call({
 String ingredientId
});




}
/// @nodoc
class _$DeleteIngredientCopyWithImpl<$Res>
    implements $DeleteIngredientCopyWith<$Res> {
  _$DeleteIngredientCopyWithImpl(this._self, this._then);

  final DeleteIngredient _self;
  final $Res Function(DeleteIngredient) _then;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ingredientId = null,}) {
  return _then(DeleteIngredient(
null == ingredientId ? _self.ingredientId : ingredientId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PantryStreamUpdated implements PantryEvent {
  const PantryStreamUpdated(final  List<IngredientEntity> ingredients): _ingredients = ingredients;
  

 final  List<IngredientEntity> _ingredients;
 List<IngredientEntity> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}


/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PantryStreamUpdatedCopyWith<PantryStreamUpdated> get copyWith => _$PantryStreamUpdatedCopyWithImpl<PantryStreamUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PantryStreamUpdated&&const DeepCollectionEquality().equals(other._ingredients, _ingredients));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_ingredients));

@override
String toString() {
  return 'PantryEvent.pantryStreamUpdated(ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class $PantryStreamUpdatedCopyWith<$Res> implements $PantryEventCopyWith<$Res> {
  factory $PantryStreamUpdatedCopyWith(PantryStreamUpdated value, $Res Function(PantryStreamUpdated) _then) = _$PantryStreamUpdatedCopyWithImpl;
@useResult
$Res call({
 List<IngredientEntity> ingredients
});




}
/// @nodoc
class _$PantryStreamUpdatedCopyWithImpl<$Res>
    implements $PantryStreamUpdatedCopyWith<$Res> {
  _$PantryStreamUpdatedCopyWithImpl(this._self, this._then);

  final PantryStreamUpdated _self;
  final $Res Function(PantryStreamUpdated) _then;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ingredients = null,}) {
  return _then(PantryStreamUpdated(
null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientEntity>,
  ));
}


}

/// @nodoc


class ResetMutationStatus implements PantryEvent {
  const ResetMutationStatus();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetMutationStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PantryEvent.resetMutationStatus()';
}


}




/// @nodoc


class ClearPantry implements PantryEvent {
  const ClearPantry();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearPantry);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PantryEvent.clearPantry()';
}


}




// dart format on
