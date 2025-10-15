// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pantry_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PantryEntry {

 String get ingredientId; double get totalQuantity; String get unit;@JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) DateTime? get earliestExpiryDate;@JsonKey(fromJson: _lotsFromJson, toJson: _lotsToJson) List<PantryLot> get lots;
/// Create a copy of PantryEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PantryEntryCopyWith<PantryEntry> get copyWith => _$PantryEntryCopyWithImpl<PantryEntry>(this as PantryEntry, _$identity);

  /// Serializes this PantryEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PantryEntry&&(identical(other.ingredientId, ingredientId) || other.ingredientId == ingredientId)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.earliestExpiryDate, earliestExpiryDate) || other.earliestExpiryDate == earliestExpiryDate)&&const DeepCollectionEquality().equals(other.lots, lots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ingredientId,totalQuantity,unit,earliestExpiryDate,const DeepCollectionEquality().hash(lots));

@override
String toString() {
  return 'PantryEntry(ingredientId: $ingredientId, totalQuantity: $totalQuantity, unit: $unit, earliestExpiryDate: $earliestExpiryDate, lots: $lots)';
}


}

/// @nodoc
abstract mixin class $PantryEntryCopyWith<$Res>  {
  factory $PantryEntryCopyWith(PantryEntry value, $Res Function(PantryEntry) _then) = _$PantryEntryCopyWithImpl;
@useResult
$Res call({
 String ingredientId, double totalQuantity, String unit,@JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) DateTime? earliestExpiryDate,@JsonKey(fromJson: _lotsFromJson, toJson: _lotsToJson) List<PantryLot> lots
});




}
/// @nodoc
class _$PantryEntryCopyWithImpl<$Res>
    implements $PantryEntryCopyWith<$Res> {
  _$PantryEntryCopyWithImpl(this._self, this._then);

  final PantryEntry _self;
  final $Res Function(PantryEntry) _then;

/// Create a copy of PantryEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ingredientId = null,Object? totalQuantity = null,Object? unit = null,Object? earliestExpiryDate = freezed,Object? lots = null,}) {
  return _then(_self.copyWith(
ingredientId: null == ingredientId ? _self.ingredientId : ingredientId // ignore: cast_nullable_to_non_nullable
as String,totalQuantity: null == totalQuantity ? _self.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,earliestExpiryDate: freezed == earliestExpiryDate ? _self.earliestExpiryDate : earliestExpiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lots: null == lots ? _self.lots : lots // ignore: cast_nullable_to_non_nullable
as List<PantryLot>,
  ));
}

}


/// Adds pattern-matching-related methods to [PantryEntry].
extension PantryEntryPatterns on PantryEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PantryEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PantryEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PantryEntry value)  $default,){
final _that = this;
switch (_that) {
case _PantryEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PantryEntry value)?  $default,){
final _that = this;
switch (_that) {
case _PantryEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ingredientId,  double totalQuantity,  String unit, @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)  DateTime? earliestExpiryDate, @JsonKey(fromJson: _lotsFromJson, toJson: _lotsToJson)  List<PantryLot> lots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PantryEntry() when $default != null:
return $default(_that.ingredientId,_that.totalQuantity,_that.unit,_that.earliestExpiryDate,_that.lots);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ingredientId,  double totalQuantity,  String unit, @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)  DateTime? earliestExpiryDate, @JsonKey(fromJson: _lotsFromJson, toJson: _lotsToJson)  List<PantryLot> lots)  $default,) {final _that = this;
switch (_that) {
case _PantryEntry():
return $default(_that.ingredientId,_that.totalQuantity,_that.unit,_that.earliestExpiryDate,_that.lots);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ingredientId,  double totalQuantity,  String unit, @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)  DateTime? earliestExpiryDate, @JsonKey(fromJson: _lotsFromJson, toJson: _lotsToJson)  List<PantryLot> lots)?  $default,) {final _that = this;
switch (_that) {
case _PantryEntry() when $default != null:
return $default(_that.ingredientId,_that.totalQuantity,_that.unit,_that.earliestExpiryDate,_that.lots);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PantryEntry implements PantryEntry {
  const _PantryEntry({this.ingredientId = '', this.totalQuantity = 0.0, this.unit = '', @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) this.earliestExpiryDate, @JsonKey(fromJson: _lotsFromJson, toJson: _lotsToJson) final  List<PantryLot> lots = const []}): _lots = lots;
  factory _PantryEntry.fromJson(Map<String, dynamic> json) => _$PantryEntryFromJson(json);

@override@JsonKey() final  String ingredientId;
@override@JsonKey() final  double totalQuantity;
@override@JsonKey() final  String unit;
@override@JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) final  DateTime? earliestExpiryDate;
 final  List<PantryLot> _lots;
@override@JsonKey(fromJson: _lotsFromJson, toJson: _lotsToJson) List<PantryLot> get lots {
  if (_lots is EqualUnmodifiableListView) return _lots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lots);
}


/// Create a copy of PantryEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PantryEntryCopyWith<_PantryEntry> get copyWith => __$PantryEntryCopyWithImpl<_PantryEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PantryEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PantryEntry&&(identical(other.ingredientId, ingredientId) || other.ingredientId == ingredientId)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.earliestExpiryDate, earliestExpiryDate) || other.earliestExpiryDate == earliestExpiryDate)&&const DeepCollectionEquality().equals(other._lots, _lots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ingredientId,totalQuantity,unit,earliestExpiryDate,const DeepCollectionEquality().hash(_lots));

@override
String toString() {
  return 'PantryEntry(ingredientId: $ingredientId, totalQuantity: $totalQuantity, unit: $unit, earliestExpiryDate: $earliestExpiryDate, lots: $lots)';
}


}

/// @nodoc
abstract mixin class _$PantryEntryCopyWith<$Res> implements $PantryEntryCopyWith<$Res> {
  factory _$PantryEntryCopyWith(_PantryEntry value, $Res Function(_PantryEntry) _then) = __$PantryEntryCopyWithImpl;
@override @useResult
$Res call({
 String ingredientId, double totalQuantity, String unit,@JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) DateTime? earliestExpiryDate,@JsonKey(fromJson: _lotsFromJson, toJson: _lotsToJson) List<PantryLot> lots
});




}
/// @nodoc
class __$PantryEntryCopyWithImpl<$Res>
    implements _$PantryEntryCopyWith<$Res> {
  __$PantryEntryCopyWithImpl(this._self, this._then);

  final _PantryEntry _self;
  final $Res Function(_PantryEntry) _then;

/// Create a copy of PantryEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ingredientId = null,Object? totalQuantity = null,Object? unit = null,Object? earliestExpiryDate = freezed,Object? lots = null,}) {
  return _then(_PantryEntry(
ingredientId: null == ingredientId ? _self.ingredientId : ingredientId // ignore: cast_nullable_to_non_nullable
as String,totalQuantity: null == totalQuantity ? _self.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,earliestExpiryDate: freezed == earliestExpiryDate ? _self.earliestExpiryDate : earliestExpiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lots: null == lots ? _self._lots : lots // ignore: cast_nullable_to_non_nullable
as List<PantryLot>,
  ));
}


}

// dart format on
