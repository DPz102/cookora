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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SubscribeToPantry value)?  subscribeToPantry,TResult Function( PantryUpdated value)?  pantryUpdated,TResult Function( AddLot value)?  addLot,TResult Function( AddMultipleLots value)?  addMultipleLots,TResult Function( UpdateLot value)?  updateLot,TResult Function( DeleteLot value)?  deleteLot,TResult Function( DeleteEntry value)?  deleteEntry,TResult Function( ResetMutationStatus value)?  resetMutationStatus,TResult Function( ClearPantry value)?  clearPantry,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SubscribeToPantry() when subscribeToPantry != null:
return subscribeToPantry(_that);case PantryUpdated() when pantryUpdated != null:
return pantryUpdated(_that);case AddLot() when addLot != null:
return addLot(_that);case AddMultipleLots() when addMultipleLots != null:
return addMultipleLots(_that);case UpdateLot() when updateLot != null:
return updateLot(_that);case DeleteLot() when deleteLot != null:
return deleteLot(_that);case DeleteEntry() when deleteEntry != null:
return deleteEntry(_that);case ResetMutationStatus() when resetMutationStatus != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SubscribeToPantry value)  subscribeToPantry,required TResult Function( PantryUpdated value)  pantryUpdated,required TResult Function( AddLot value)  addLot,required TResult Function( AddMultipleLots value)  addMultipleLots,required TResult Function( UpdateLot value)  updateLot,required TResult Function( DeleteLot value)  deleteLot,required TResult Function( DeleteEntry value)  deleteEntry,required TResult Function( ResetMutationStatus value)  resetMutationStatus,required TResult Function( ClearPantry value)  clearPantry,}){
final _that = this;
switch (_that) {
case SubscribeToPantry():
return subscribeToPantry(_that);case PantryUpdated():
return pantryUpdated(_that);case AddLot():
return addLot(_that);case AddMultipleLots():
return addMultipleLots(_that);case UpdateLot():
return updateLot(_that);case DeleteLot():
return deleteLot(_that);case DeleteEntry():
return deleteEntry(_that);case ResetMutationStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SubscribeToPantry value)?  subscribeToPantry,TResult? Function( PantryUpdated value)?  pantryUpdated,TResult? Function( AddLot value)?  addLot,TResult? Function( AddMultipleLots value)?  addMultipleLots,TResult? Function( UpdateLot value)?  updateLot,TResult? Function( DeleteLot value)?  deleteLot,TResult? Function( DeleteEntry value)?  deleteEntry,TResult? Function( ResetMutationStatus value)?  resetMutationStatus,TResult? Function( ClearPantry value)?  clearPantry,}){
final _that = this;
switch (_that) {
case SubscribeToPantry() when subscribeToPantry != null:
return subscribeToPantry(_that);case PantryUpdated() when pantryUpdated != null:
return pantryUpdated(_that);case AddLot() when addLot != null:
return addLot(_that);case AddMultipleLots() when addMultipleLots != null:
return addMultipleLots(_that);case UpdateLot() when updateLot != null:
return updateLot(_that);case DeleteLot() when deleteLot != null:
return deleteLot(_that);case DeleteEntry() when deleteEntry != null:
return deleteEntry(_that);case ResetMutationStatus() when resetMutationStatus != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String uid)?  subscribeToPantry,TResult Function( List<PantryEntry> entries)?  pantryUpdated,TResult Function( Ingredient ingredient,  Map<String, dynamic> lotData)?  addLot,TResult Function( List<({Ingredient ingredient, Map<String, dynamic> lotData})> items)?  addMultipleLots,TResult Function( String ingredientId,  String lotId,  Map<String, dynamic> lotData)?  updateLot,TResult Function( String ingredientId,  String lotId)?  deleteLot,TResult Function( String ingredientId)?  deleteEntry,TResult Function()?  resetMutationStatus,TResult Function()?  clearPantry,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SubscribeToPantry() when subscribeToPantry != null:
return subscribeToPantry(_that.uid);case PantryUpdated() when pantryUpdated != null:
return pantryUpdated(_that.entries);case AddLot() when addLot != null:
return addLot(_that.ingredient,_that.lotData);case AddMultipleLots() when addMultipleLots != null:
return addMultipleLots(_that.items);case UpdateLot() when updateLot != null:
return updateLot(_that.ingredientId,_that.lotId,_that.lotData);case DeleteLot() when deleteLot != null:
return deleteLot(_that.ingredientId,_that.lotId);case DeleteEntry() when deleteEntry != null:
return deleteEntry(_that.ingredientId);case ResetMutationStatus() when resetMutationStatus != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String uid)  subscribeToPantry,required TResult Function( List<PantryEntry> entries)  pantryUpdated,required TResult Function( Ingredient ingredient,  Map<String, dynamic> lotData)  addLot,required TResult Function( List<({Ingredient ingredient, Map<String, dynamic> lotData})> items)  addMultipleLots,required TResult Function( String ingredientId,  String lotId,  Map<String, dynamic> lotData)  updateLot,required TResult Function( String ingredientId,  String lotId)  deleteLot,required TResult Function( String ingredientId)  deleteEntry,required TResult Function()  resetMutationStatus,required TResult Function()  clearPantry,}) {final _that = this;
switch (_that) {
case SubscribeToPantry():
return subscribeToPantry(_that.uid);case PantryUpdated():
return pantryUpdated(_that.entries);case AddLot():
return addLot(_that.ingredient,_that.lotData);case AddMultipleLots():
return addMultipleLots(_that.items);case UpdateLot():
return updateLot(_that.ingredientId,_that.lotId,_that.lotData);case DeleteLot():
return deleteLot(_that.ingredientId,_that.lotId);case DeleteEntry():
return deleteEntry(_that.ingredientId);case ResetMutationStatus():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String uid)?  subscribeToPantry,TResult? Function( List<PantryEntry> entries)?  pantryUpdated,TResult? Function( Ingredient ingredient,  Map<String, dynamic> lotData)?  addLot,TResult? Function( List<({Ingredient ingredient, Map<String, dynamic> lotData})> items)?  addMultipleLots,TResult? Function( String ingredientId,  String lotId,  Map<String, dynamic> lotData)?  updateLot,TResult? Function( String ingredientId,  String lotId)?  deleteLot,TResult? Function( String ingredientId)?  deleteEntry,TResult? Function()?  resetMutationStatus,TResult? Function()?  clearPantry,}) {final _that = this;
switch (_that) {
case SubscribeToPantry() when subscribeToPantry != null:
return subscribeToPantry(_that.uid);case PantryUpdated() when pantryUpdated != null:
return pantryUpdated(_that.entries);case AddLot() when addLot != null:
return addLot(_that.ingredient,_that.lotData);case AddMultipleLots() when addMultipleLots != null:
return addMultipleLots(_that.items);case UpdateLot() when updateLot != null:
return updateLot(_that.ingredientId,_that.lotId,_that.lotData);case DeleteLot() when deleteLot != null:
return deleteLot(_that.ingredientId,_that.lotId);case DeleteEntry() when deleteEntry != null:
return deleteEntry(_that.ingredientId);case ResetMutationStatus() when resetMutationStatus != null:
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


class PantryUpdated implements PantryEvent {
  const PantryUpdated(final  List<PantryEntry> entries): _entries = entries;
  

 final  List<PantryEntry> _entries;
 List<PantryEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}


/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PantryUpdatedCopyWith<PantryUpdated> get copyWith => _$PantryUpdatedCopyWithImpl<PantryUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PantryUpdated&&const DeepCollectionEquality().equals(other._entries, _entries));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_entries));

@override
String toString() {
  return 'PantryEvent.pantryUpdated(entries: $entries)';
}


}

/// @nodoc
abstract mixin class $PantryUpdatedCopyWith<$Res> implements $PantryEventCopyWith<$Res> {
  factory $PantryUpdatedCopyWith(PantryUpdated value, $Res Function(PantryUpdated) _then) = _$PantryUpdatedCopyWithImpl;
@useResult
$Res call({
 List<PantryEntry> entries
});




}
/// @nodoc
class _$PantryUpdatedCopyWithImpl<$Res>
    implements $PantryUpdatedCopyWith<$Res> {
  _$PantryUpdatedCopyWithImpl(this._self, this._then);

  final PantryUpdated _self;
  final $Res Function(PantryUpdated) _then;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? entries = null,}) {
  return _then(PantryUpdated(
null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<PantryEntry>,
  ));
}


}

/// @nodoc


class AddLot implements PantryEvent {
  const AddLot({required this.ingredient, required final  Map<String, dynamic> lotData}): _lotData = lotData;
  

 final  Ingredient ingredient;
 final  Map<String, dynamic> _lotData;
 Map<String, dynamic> get lotData {
  if (_lotData is EqualUnmodifiableMapView) return _lotData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_lotData);
}


/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddLotCopyWith<AddLot> get copyWith => _$AddLotCopyWithImpl<AddLot>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddLot&&(identical(other.ingredient, ingredient) || other.ingredient == ingredient)&&const DeepCollectionEquality().equals(other._lotData, _lotData));
}


@override
int get hashCode => Object.hash(runtimeType,ingredient,const DeepCollectionEquality().hash(_lotData));

@override
String toString() {
  return 'PantryEvent.addLot(ingredient: $ingredient, lotData: $lotData)';
}


}

/// @nodoc
abstract mixin class $AddLotCopyWith<$Res> implements $PantryEventCopyWith<$Res> {
  factory $AddLotCopyWith(AddLot value, $Res Function(AddLot) _then) = _$AddLotCopyWithImpl;
@useResult
$Res call({
 Ingredient ingredient, Map<String, dynamic> lotData
});


$IngredientCopyWith<$Res> get ingredient;

}
/// @nodoc
class _$AddLotCopyWithImpl<$Res>
    implements $AddLotCopyWith<$Res> {
  _$AddLotCopyWithImpl(this._self, this._then);

  final AddLot _self;
  final $Res Function(AddLot) _then;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ingredient = null,Object? lotData = null,}) {
  return _then(AddLot(
ingredient: null == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as Ingredient,lotData: null == lotData ? _self._lotData : lotData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IngredientCopyWith<$Res> get ingredient {
  
  return $IngredientCopyWith<$Res>(_self.ingredient, (value) {
    return _then(_self.copyWith(ingredient: value));
  });
}
}

/// @nodoc


class AddMultipleLots implements PantryEvent {
  const AddMultipleLots({required final  List<({Ingredient ingredient, Map<String, dynamic> lotData})> items}): _items = items;
  

 final  List<({Ingredient ingredient, Map<String, dynamic> lotData})> _items;
 List<({Ingredient ingredient, Map<String, dynamic> lotData})> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddMultipleLotsCopyWith<AddMultipleLots> get copyWith => _$AddMultipleLotsCopyWithImpl<AddMultipleLots>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddMultipleLots&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'PantryEvent.addMultipleLots(items: $items)';
}


}

/// @nodoc
abstract mixin class $AddMultipleLotsCopyWith<$Res> implements $PantryEventCopyWith<$Res> {
  factory $AddMultipleLotsCopyWith(AddMultipleLots value, $Res Function(AddMultipleLots) _then) = _$AddMultipleLotsCopyWithImpl;
@useResult
$Res call({
 List<({Ingredient ingredient, Map<String, dynamic> lotData})> items
});




}
/// @nodoc
class _$AddMultipleLotsCopyWithImpl<$Res>
    implements $AddMultipleLotsCopyWith<$Res> {
  _$AddMultipleLotsCopyWithImpl(this._self, this._then);

  final AddMultipleLots _self;
  final $Res Function(AddMultipleLots) _then;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(AddMultipleLots(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<({Ingredient ingredient, Map<String, dynamic> lotData})>,
  ));
}


}

/// @nodoc


class UpdateLot implements PantryEvent {
  const UpdateLot({required this.ingredientId, required this.lotId, required final  Map<String, dynamic> lotData}): _lotData = lotData;
  

 final  String ingredientId;
 final  String lotId;
 final  Map<String, dynamic> _lotData;
 Map<String, dynamic> get lotData {
  if (_lotData is EqualUnmodifiableMapView) return _lotData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_lotData);
}


/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateLotCopyWith<UpdateLot> get copyWith => _$UpdateLotCopyWithImpl<UpdateLot>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateLot&&(identical(other.ingredientId, ingredientId) || other.ingredientId == ingredientId)&&(identical(other.lotId, lotId) || other.lotId == lotId)&&const DeepCollectionEquality().equals(other._lotData, _lotData));
}


@override
int get hashCode => Object.hash(runtimeType,ingredientId,lotId,const DeepCollectionEquality().hash(_lotData));

@override
String toString() {
  return 'PantryEvent.updateLot(ingredientId: $ingredientId, lotId: $lotId, lotData: $lotData)';
}


}

/// @nodoc
abstract mixin class $UpdateLotCopyWith<$Res> implements $PantryEventCopyWith<$Res> {
  factory $UpdateLotCopyWith(UpdateLot value, $Res Function(UpdateLot) _then) = _$UpdateLotCopyWithImpl;
@useResult
$Res call({
 String ingredientId, String lotId, Map<String, dynamic> lotData
});




}
/// @nodoc
class _$UpdateLotCopyWithImpl<$Res>
    implements $UpdateLotCopyWith<$Res> {
  _$UpdateLotCopyWithImpl(this._self, this._then);

  final UpdateLot _self;
  final $Res Function(UpdateLot) _then;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ingredientId = null,Object? lotId = null,Object? lotData = null,}) {
  return _then(UpdateLot(
ingredientId: null == ingredientId ? _self.ingredientId : ingredientId // ignore: cast_nullable_to_non_nullable
as String,lotId: null == lotId ? _self.lotId : lotId // ignore: cast_nullable_to_non_nullable
as String,lotData: null == lotData ? _self._lotData : lotData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class DeleteLot implements PantryEvent {
  const DeleteLot({required this.ingredientId, required this.lotId});
  

 final  String ingredientId;
 final  String lotId;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteLotCopyWith<DeleteLot> get copyWith => _$DeleteLotCopyWithImpl<DeleteLot>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteLot&&(identical(other.ingredientId, ingredientId) || other.ingredientId == ingredientId)&&(identical(other.lotId, lotId) || other.lotId == lotId));
}


@override
int get hashCode => Object.hash(runtimeType,ingredientId,lotId);

@override
String toString() {
  return 'PantryEvent.deleteLot(ingredientId: $ingredientId, lotId: $lotId)';
}


}

/// @nodoc
abstract mixin class $DeleteLotCopyWith<$Res> implements $PantryEventCopyWith<$Res> {
  factory $DeleteLotCopyWith(DeleteLot value, $Res Function(DeleteLot) _then) = _$DeleteLotCopyWithImpl;
@useResult
$Res call({
 String ingredientId, String lotId
});




}
/// @nodoc
class _$DeleteLotCopyWithImpl<$Res>
    implements $DeleteLotCopyWith<$Res> {
  _$DeleteLotCopyWithImpl(this._self, this._then);

  final DeleteLot _self;
  final $Res Function(DeleteLot) _then;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ingredientId = null,Object? lotId = null,}) {
  return _then(DeleteLot(
ingredientId: null == ingredientId ? _self.ingredientId : ingredientId // ignore: cast_nullable_to_non_nullable
as String,lotId: null == lotId ? _self.lotId : lotId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DeleteEntry implements PantryEvent {
  const DeleteEntry({required this.ingredientId});
  

 final  String ingredientId;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteEntryCopyWith<DeleteEntry> get copyWith => _$DeleteEntryCopyWithImpl<DeleteEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteEntry&&(identical(other.ingredientId, ingredientId) || other.ingredientId == ingredientId));
}


@override
int get hashCode => Object.hash(runtimeType,ingredientId);

@override
String toString() {
  return 'PantryEvent.deleteEntry(ingredientId: $ingredientId)';
}


}

/// @nodoc
abstract mixin class $DeleteEntryCopyWith<$Res> implements $PantryEventCopyWith<$Res> {
  factory $DeleteEntryCopyWith(DeleteEntry value, $Res Function(DeleteEntry) _then) = _$DeleteEntryCopyWithImpl;
@useResult
$Res call({
 String ingredientId
});




}
/// @nodoc
class _$DeleteEntryCopyWithImpl<$Res>
    implements $DeleteEntryCopyWith<$Res> {
  _$DeleteEntryCopyWithImpl(this._self, this._then);

  final DeleteEntry _self;
  final $Res Function(DeleteEntry) _then;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ingredientId = null,}) {
  return _then(DeleteEntry(
ingredientId: null == ingredientId ? _self.ingredientId : ingredientId // ignore: cast_nullable_to_non_nullable
as String,
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
