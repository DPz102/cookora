// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScanResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScanResult()';
}


}

/// @nodoc
class $ScanResultCopyWith<$Res>  {
$ScanResultCopyWith(ScanResult _, $Res Function(ScanResult) __);
}


/// Adds pattern-matching-related methods to [ScanResult].
extension ScanResultPatterns on ScanResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DishScanResult value)?  dish,TResult Function( IngredientsScanResults value)?  ingredients,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DishScanResult() when dish != null:
return dish(_that);case IngredientsScanResults() when ingredients != null:
return ingredients(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DishScanResult value)  dish,required TResult Function( IngredientsScanResults value)  ingredients,}){
final _that = this;
switch (_that) {
case DishScanResult():
return dish(_that);case IngredientsScanResults():
return ingredients(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DishScanResult value)?  dish,TResult? Function( IngredientsScanResults value)?  ingredients,}){
final _that = this;
switch (_that) {
case DishScanResult() when dish != null:
return dish(_that);case IngredientsScanResults() when ingredients != null:
return ingredients(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( RecipeEntity recipe)?  dish,TResult Function( List<Ingredient> results)?  ingredients,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DishScanResult() when dish != null:
return dish(_that.recipe);case IngredientsScanResults() when ingredients != null:
return ingredients(_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( RecipeEntity recipe)  dish,required TResult Function( List<Ingredient> results)  ingredients,}) {final _that = this;
switch (_that) {
case DishScanResult():
return dish(_that.recipe);case IngredientsScanResults():
return ingredients(_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( RecipeEntity recipe)?  dish,TResult? Function( List<Ingredient> results)?  ingredients,}) {final _that = this;
switch (_that) {
case DishScanResult() when dish != null:
return dish(_that.recipe);case IngredientsScanResults() when ingredients != null:
return ingredients(_that.results);case _:
  return null;

}
}

}

/// @nodoc


class DishScanResult implements ScanResult {
  const DishScanResult({required this.recipe});
  

 final  RecipeEntity recipe;

/// Create a copy of ScanResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DishScanResultCopyWith<DishScanResult> get copyWith => _$DishScanResultCopyWithImpl<DishScanResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DishScanResult&&(identical(other.recipe, recipe) || other.recipe == recipe));
}


@override
int get hashCode => Object.hash(runtimeType,recipe);

@override
String toString() {
  return 'ScanResult.dish(recipe: $recipe)';
}


}

/// @nodoc
abstract mixin class $DishScanResultCopyWith<$Res> implements $ScanResultCopyWith<$Res> {
  factory $DishScanResultCopyWith(DishScanResult value, $Res Function(DishScanResult) _then) = _$DishScanResultCopyWithImpl;
@useResult
$Res call({
 RecipeEntity recipe
});


$RecipeEntityCopyWith<$Res> get recipe;

}
/// @nodoc
class _$DishScanResultCopyWithImpl<$Res>
    implements $DishScanResultCopyWith<$Res> {
  _$DishScanResultCopyWithImpl(this._self, this._then);

  final DishScanResult _self;
  final $Res Function(DishScanResult) _then;

/// Create a copy of ScanResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? recipe = null,}) {
  return _then(DishScanResult(
recipe: null == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as RecipeEntity,
  ));
}

/// Create a copy of ScanResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeEntityCopyWith<$Res> get recipe {
  
  return $RecipeEntityCopyWith<$Res>(_self.recipe, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}

/// @nodoc


class IngredientsScanResults implements ScanResult {
  const IngredientsScanResults({required final  List<Ingredient> results}): _results = results;
  

 final  List<Ingredient> _results;
 List<Ingredient> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of ScanResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientsScanResultsCopyWith<IngredientsScanResults> get copyWith => _$IngredientsScanResultsCopyWithImpl<IngredientsScanResults>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientsScanResults&&const DeepCollectionEquality().equals(other._results, _results));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'ScanResult.ingredients(results: $results)';
}


}

/// @nodoc
abstract mixin class $IngredientsScanResultsCopyWith<$Res> implements $ScanResultCopyWith<$Res> {
  factory $IngredientsScanResultsCopyWith(IngredientsScanResults value, $Res Function(IngredientsScanResults) _then) = _$IngredientsScanResultsCopyWithImpl;
@useResult
$Res call({
 List<Ingredient> results
});




}
/// @nodoc
class _$IngredientsScanResultsCopyWithImpl<$Res>
    implements $IngredientsScanResultsCopyWith<$Res> {
  _$IngredientsScanResultsCopyWithImpl(this._self, this._then);

  final IngredientsScanResults _self;
  final $Res Function(IngredientsScanResults) _then;

/// Create a copy of ScanResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? results = null,}) {
  return _then(IngredientsScanResults(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,
  ));
}


}

// dart format on
