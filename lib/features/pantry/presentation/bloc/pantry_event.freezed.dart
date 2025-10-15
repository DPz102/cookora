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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SubscribeToPantry value)?  subscribeToPantry,TResult Function( AddLot value)?  addLot,TResult Function( UpdateLot value)?  updateLot,TResult Function( DeleteLot value)?  deleteLot,TResult Function( DeletePantryEntry value)?  deletePantryEntry,TResult Function( PantryUpdated value)?  pantryUpdated,TResult Function( ResetMutationStatus value)?  resetMutationStatus,TResult Function( ClearPantry value)?  clearPantry,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SubscribeToPantry() when subscribeToPantry != null:
return subscribeToPantry(_that);case AddLot() when addLot != null:
return addLot(_that);case UpdateLot() when updateLot != null:
return updateLot(_that);case DeleteLot() when deleteLot != null:
return deleteLot(_that);case DeletePantryEntry() when deletePantryEntry != null:
return deletePantryEntry(_that);case PantryUpdated() when pantryUpdated != null:
return pantryUpdated(_that);case ResetMutationStatus() when resetMutationStatus != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SubscribeToPantry value)  subscribeToPantry,required TResult Function( AddLot value)  addLot,required TResult Function( UpdateLot value)  updateLot,required TResult Function( DeleteLot value)  deleteLot,required TResult Function( DeletePantryEntry value)  deletePantryEntry,required TResult Function( PantryUpdated value)  pantryUpdated,required TResult Function( ResetMutationStatus value)  resetMutationStatus,required TResult Function( ClearPantry value)  clearPantry,}){
final _that = this;
switch (_that) {
case SubscribeToPantry():
return subscribeToPantry(_that);case AddLot():
return addLot(_that);case UpdateLot():
return updateLot(_that);case DeleteLot():
return deleteLot(_that);case DeletePantryEntry():
return deletePantryEntry(_that);case PantryUpdated():
return pantryUpdated(_that);case ResetMutationStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SubscribeToPantry value)?  subscribeToPantry,TResult? Function( AddLot value)?  addLot,TResult? Function( UpdateLot value)?  updateLot,TResult? Function( DeleteLot value)?  deleteLot,TResult? Function( DeletePantryEntry value)?  deletePantryEntry,TResult? Function( PantryUpdated value)?  pantryUpdated,TResult? Function( ResetMutationStatus value)?  resetMutationStatus,TResult? Function( ClearPantry value)?  clearPantry,}){
final _that = this;
switch (_that) {
case SubscribeToPantry() when subscribeToPantry != null:
return subscribeToPantry(_that);case AddLot() when addLot != null:
return addLot(_that);case UpdateLot() when updateLot != null:
return updateLot(_that);case DeleteLot() when deleteLot != null:
return deleteLot(_that);case DeletePantryEntry() when deletePantryEntry != null:
return deletePantryEntry(_that);case PantryUpdated() when pantryUpdated != null:
return pantryUpdated(_that);case ResetMutationStatus() when resetMutationStatus != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String uid)?  subscribeToPantry,TResult Function( PantryLot lot)?  addLot,TResult Function( PantryLot lot)?  updateLot,TResult Function( String ingredientId,  String lotId)?  deleteLot,TResult Function( String ingredientId)?  deletePantryEntry,TResult Function( List<PantryEntry> entries)?  pantryUpdated,TResult Function()?  resetMutationStatus,TResult Function()?  clearPantry,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SubscribeToPantry() when subscribeToPantry != null:
return subscribeToPantry(_that.uid);case AddLot() when addLot != null:
return addLot(_that.lot);case UpdateLot() when updateLot != null:
return updateLot(_that.lot);case DeleteLot() when deleteLot != null:
return deleteLot(_that.ingredientId,_that.lotId);case DeletePantryEntry() when deletePantryEntry != null:
return deletePantryEntry(_that.ingredientId);case PantryUpdated() when pantryUpdated != null:
return pantryUpdated(_that.entries);case ResetMutationStatus() when resetMutationStatus != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String uid)  subscribeToPantry,required TResult Function( PantryLot lot)  addLot,required TResult Function( PantryLot lot)  updateLot,required TResult Function( String ingredientId,  String lotId)  deleteLot,required TResult Function( String ingredientId)  deletePantryEntry,required TResult Function( List<PantryEntry> entries)  pantryUpdated,required TResult Function()  resetMutationStatus,required TResult Function()  clearPantry,}) {final _that = this;
switch (_that) {
case SubscribeToPantry():
return subscribeToPantry(_that.uid);case AddLot():
return addLot(_that.lot);case UpdateLot():
return updateLot(_that.lot);case DeleteLot():
return deleteLot(_that.ingredientId,_that.lotId);case DeletePantryEntry():
return deletePantryEntry(_that.ingredientId);case PantryUpdated():
return pantryUpdated(_that.entries);case ResetMutationStatus():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String uid)?  subscribeToPantry,TResult? Function( PantryLot lot)?  addLot,TResult? Function( PantryLot lot)?  updateLot,TResult? Function( String ingredientId,  String lotId)?  deleteLot,TResult? Function( String ingredientId)?  deletePantryEntry,TResult? Function( List<PantryEntry> entries)?  pantryUpdated,TResult? Function()?  resetMutationStatus,TResult? Function()?  clearPantry,}) {final _that = this;
switch (_that) {
case SubscribeToPantry() when subscribeToPantry != null:
return subscribeToPantry(_that.uid);case AddLot() when addLot != null:
return addLot(_that.lot);case UpdateLot() when updateLot != null:
return updateLot(_that.lot);case DeleteLot() when deleteLot != null:
return deleteLot(_that.ingredientId,_that.lotId);case DeletePantryEntry() when deletePantryEntry != null:
return deletePantryEntry(_that.ingredientId);case PantryUpdated() when pantryUpdated != null:
return pantryUpdated(_that.entries);case ResetMutationStatus() when resetMutationStatus != null:
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


class AddLot implements PantryEvent {
  const AddLot({required this.lot});
  

 final  PantryLot lot;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddLotCopyWith<AddLot> get copyWith => _$AddLotCopyWithImpl<AddLot>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddLot&&(identical(other.lot, lot) || other.lot == lot));
}


@override
int get hashCode => Object.hash(runtimeType,lot);

@override
String toString() {
  return 'PantryEvent.addLot(lot: $lot)';
}


}

/// @nodoc
abstract mixin class $AddLotCopyWith<$Res> implements $PantryEventCopyWith<$Res> {
  factory $AddLotCopyWith(AddLot value, $Res Function(AddLot) _then) = _$AddLotCopyWithImpl;
@useResult
$Res call({
 PantryLot lot
});


$PantryLotCopyWith<$Res> get lot;

}
/// @nodoc
class _$AddLotCopyWithImpl<$Res>
    implements $AddLotCopyWith<$Res> {
  _$AddLotCopyWithImpl(this._self, this._then);

  final AddLot _self;
  final $Res Function(AddLot) _then;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lot = null,}) {
  return _then(AddLot(
lot: null == lot ? _self.lot : lot // ignore: cast_nullable_to_non_nullable
as PantryLot,
  ));
}

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PantryLotCopyWith<$Res> get lot {
  
  return $PantryLotCopyWith<$Res>(_self.lot, (value) {
    return _then(_self.copyWith(lot: value));
  });
}
}

/// @nodoc


class UpdateLot implements PantryEvent {
  const UpdateLot({required this.lot});
  

 final  PantryLot lot;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateLotCopyWith<UpdateLot> get copyWith => _$UpdateLotCopyWithImpl<UpdateLot>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateLot&&(identical(other.lot, lot) || other.lot == lot));
}


@override
int get hashCode => Object.hash(runtimeType,lot);

@override
String toString() {
  return 'PantryEvent.updateLot(lot: $lot)';
}


}

/// @nodoc
abstract mixin class $UpdateLotCopyWith<$Res> implements $PantryEventCopyWith<$Res> {
  factory $UpdateLotCopyWith(UpdateLot value, $Res Function(UpdateLot) _then) = _$UpdateLotCopyWithImpl;
@useResult
$Res call({
 PantryLot lot
});


$PantryLotCopyWith<$Res> get lot;

}
/// @nodoc
class _$UpdateLotCopyWithImpl<$Res>
    implements $UpdateLotCopyWith<$Res> {
  _$UpdateLotCopyWithImpl(this._self, this._then);

  final UpdateLot _self;
  final $Res Function(UpdateLot) _then;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lot = null,}) {
  return _then(UpdateLot(
lot: null == lot ? _self.lot : lot // ignore: cast_nullable_to_non_nullable
as PantryLot,
  ));
}

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PantryLotCopyWith<$Res> get lot {
  
  return $PantryLotCopyWith<$Res>(_self.lot, (value) {
    return _then(_self.copyWith(lot: value));
  });
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


class DeletePantryEntry implements PantryEvent {
  const DeletePantryEntry({required this.ingredientId});
  

 final  String ingredientId;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletePantryEntryCopyWith<DeletePantryEntry> get copyWith => _$DeletePantryEntryCopyWithImpl<DeletePantryEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletePantryEntry&&(identical(other.ingredientId, ingredientId) || other.ingredientId == ingredientId));
}


@override
int get hashCode => Object.hash(runtimeType,ingredientId);

@override
String toString() {
  return 'PantryEvent.deletePantryEntry(ingredientId: $ingredientId)';
}


}

/// @nodoc
abstract mixin class $DeletePantryEntryCopyWith<$Res> implements $PantryEventCopyWith<$Res> {
  factory $DeletePantryEntryCopyWith(DeletePantryEntry value, $Res Function(DeletePantryEntry) _then) = _$DeletePantryEntryCopyWithImpl;
@useResult
$Res call({
 String ingredientId
});




}
/// @nodoc
class _$DeletePantryEntryCopyWithImpl<$Res>
    implements $DeletePantryEntryCopyWith<$Res> {
  _$DeletePantryEntryCopyWithImpl(this._self, this._then);

  final DeletePantryEntry _self;
  final $Res Function(DeletePantryEntry) _then;

/// Create a copy of PantryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ingredientId = null,}) {
  return _then(DeletePantryEntry(
ingredientId: null == ingredientId ? _self.ingredientId : ingredientId // ignore: cast_nullable_to_non_nullable
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
