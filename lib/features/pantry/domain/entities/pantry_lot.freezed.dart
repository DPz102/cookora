// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pantry_lot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PantryLot {

 String get id; double get quantity; String get unit;@JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) DateTime? get purchaseDate;@JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) DateTime? get expiryDate;
/// Create a copy of PantryLot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PantryLotCopyWith<PantryLot> get copyWith => _$PantryLotCopyWithImpl<PantryLot>(this as PantryLot, _$identity);

  /// Serializes this PantryLot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PantryLot&&(identical(other.id, id) || other.id == id)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.purchaseDate, purchaseDate) || other.purchaseDate == purchaseDate)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,quantity,unit,purchaseDate,expiryDate);

@override
String toString() {
  return 'PantryLot(id: $id, quantity: $quantity, unit: $unit, purchaseDate: $purchaseDate, expiryDate: $expiryDate)';
}


}

/// @nodoc
abstract mixin class $PantryLotCopyWith<$Res>  {
  factory $PantryLotCopyWith(PantryLot value, $Res Function(PantryLot) _then) = _$PantryLotCopyWithImpl;
@useResult
$Res call({
 String id, double quantity, String unit,@JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) DateTime? purchaseDate,@JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) DateTime? expiryDate
});




}
/// @nodoc
class _$PantryLotCopyWithImpl<$Res>
    implements $PantryLotCopyWith<$Res> {
  _$PantryLotCopyWithImpl(this._self, this._then);

  final PantryLot _self;
  final $Res Function(PantryLot) _then;

/// Create a copy of PantryLot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? quantity = null,Object? unit = null,Object? purchaseDate = freezed,Object? expiryDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,purchaseDate: freezed == purchaseDate ? _self.purchaseDate : purchaseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PantryLot].
extension PantryLotPatterns on PantryLot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PantryLot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PantryLot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PantryLot value)  $default,){
final _that = this;
switch (_that) {
case _PantryLot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PantryLot value)?  $default,){
final _that = this;
switch (_that) {
case _PantryLot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double quantity,  String unit, @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)  DateTime? purchaseDate, @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)  DateTime? expiryDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PantryLot() when $default != null:
return $default(_that.id,_that.quantity,_that.unit,_that.purchaseDate,_that.expiryDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double quantity,  String unit, @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)  DateTime? purchaseDate, @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)  DateTime? expiryDate)  $default,) {final _that = this;
switch (_that) {
case _PantryLot():
return $default(_that.id,_that.quantity,_that.unit,_that.purchaseDate,_that.expiryDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double quantity,  String unit, @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)  DateTime? purchaseDate, @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)  DateTime? expiryDate)?  $default,) {final _that = this;
switch (_that) {
case _PantryLot() when $default != null:
return $default(_that.id,_that.quantity,_that.unit,_that.purchaseDate,_that.expiryDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PantryLot implements PantryLot {
  const _PantryLot({this.id = '', this.quantity = 0.0, this.unit = '', @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) this.purchaseDate, @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) this.expiryDate});
  factory _PantryLot.fromJson(Map<String, dynamic> json) => _$PantryLotFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  double quantity;
@override@JsonKey() final  String unit;
@override@JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) final  DateTime? purchaseDate;
@override@JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) final  DateTime? expiryDate;

/// Create a copy of PantryLot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PantryLotCopyWith<_PantryLot> get copyWith => __$PantryLotCopyWithImpl<_PantryLot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PantryLotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PantryLot&&(identical(other.id, id) || other.id == id)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.purchaseDate, purchaseDate) || other.purchaseDate == purchaseDate)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,quantity,unit,purchaseDate,expiryDate);

@override
String toString() {
  return 'PantryLot(id: $id, quantity: $quantity, unit: $unit, purchaseDate: $purchaseDate, expiryDate: $expiryDate)';
}


}

/// @nodoc
abstract mixin class _$PantryLotCopyWith<$Res> implements $PantryLotCopyWith<$Res> {
  factory _$PantryLotCopyWith(_PantryLot value, $Res Function(_PantryLot) _then) = __$PantryLotCopyWithImpl;
@override @useResult
$Res call({
 String id, double quantity, String unit,@JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) DateTime? purchaseDate,@JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp) DateTime? expiryDate
});




}
/// @nodoc
class __$PantryLotCopyWithImpl<$Res>
    implements _$PantryLotCopyWith<$Res> {
  __$PantryLotCopyWithImpl(this._self, this._then);

  final _PantryLot _self;
  final $Res Function(_PantryLot) _then;

/// Create a copy of PantryLot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? quantity = null,Object? unit = null,Object? purchaseDate = freezed,Object? expiryDate = freezed,}) {
  return _then(_PantryLot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,purchaseDate: freezed == purchaseDate ? _self.purchaseDate : purchaseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
