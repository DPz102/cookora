// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kitchen_log_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KitchenLogEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KitchenLogEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KitchenLogEvent()';
}


}

/// @nodoc
class $KitchenLogEventCopyWith<$Res>  {
$KitchenLogEventCopyWith(KitchenLogEvent _, $Res Function(KitchenLogEvent) __);
}


/// Adds pattern-matching-related methods to [KitchenLogEvent].
extension KitchenLogEventPatterns on KitchenLogEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SubscribeToKitchenLog value)?  subscribeToKitchenLog,TResult Function( AddRecipeToLog value)?  addRecipeToLog,TResult Function( KitchenLogUpdated value)?  kitchenLogUpdated,TResult Function( ClearLog value)?  clearLog,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SubscribeToKitchenLog() when subscribeToKitchenLog != null:
return subscribeToKitchenLog(_that);case AddRecipeToLog() when addRecipeToLog != null:
return addRecipeToLog(_that);case KitchenLogUpdated() when kitchenLogUpdated != null:
return kitchenLogUpdated(_that);case ClearLog() when clearLog != null:
return clearLog(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SubscribeToKitchenLog value)  subscribeToKitchenLog,required TResult Function( AddRecipeToLog value)  addRecipeToLog,required TResult Function( KitchenLogUpdated value)  kitchenLogUpdated,required TResult Function( ClearLog value)  clearLog,}){
final _that = this;
switch (_that) {
case SubscribeToKitchenLog():
return subscribeToKitchenLog(_that);case AddRecipeToLog():
return addRecipeToLog(_that);case KitchenLogUpdated():
return kitchenLogUpdated(_that);case ClearLog():
return clearLog(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SubscribeToKitchenLog value)?  subscribeToKitchenLog,TResult? Function( AddRecipeToLog value)?  addRecipeToLog,TResult? Function( KitchenLogUpdated value)?  kitchenLogUpdated,TResult? Function( ClearLog value)?  clearLog,}){
final _that = this;
switch (_that) {
case SubscribeToKitchenLog() when subscribeToKitchenLog != null:
return subscribeToKitchenLog(_that);case AddRecipeToLog() when addRecipeToLog != null:
return addRecipeToLog(_that);case KitchenLogUpdated() when kitchenLogUpdated != null:
return kitchenLogUpdated(_that);case ClearLog() when clearLog != null:
return clearLog(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String uid)?  subscribeToKitchenLog,TResult Function( RecipeEntity recipe)?  addRecipeToLog,TResult Function( List<RecipeEntity> recipes)?  kitchenLogUpdated,TResult Function()?  clearLog,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SubscribeToKitchenLog() when subscribeToKitchenLog != null:
return subscribeToKitchenLog(_that.uid);case AddRecipeToLog() when addRecipeToLog != null:
return addRecipeToLog(_that.recipe);case KitchenLogUpdated() when kitchenLogUpdated != null:
return kitchenLogUpdated(_that.recipes);case ClearLog() when clearLog != null:
return clearLog();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String uid)  subscribeToKitchenLog,required TResult Function( RecipeEntity recipe)  addRecipeToLog,required TResult Function( List<RecipeEntity> recipes)  kitchenLogUpdated,required TResult Function()  clearLog,}) {final _that = this;
switch (_that) {
case SubscribeToKitchenLog():
return subscribeToKitchenLog(_that.uid);case AddRecipeToLog():
return addRecipeToLog(_that.recipe);case KitchenLogUpdated():
return kitchenLogUpdated(_that.recipes);case ClearLog():
return clearLog();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String uid)?  subscribeToKitchenLog,TResult? Function( RecipeEntity recipe)?  addRecipeToLog,TResult? Function( List<RecipeEntity> recipes)?  kitchenLogUpdated,TResult? Function()?  clearLog,}) {final _that = this;
switch (_that) {
case SubscribeToKitchenLog() when subscribeToKitchenLog != null:
return subscribeToKitchenLog(_that.uid);case AddRecipeToLog() when addRecipeToLog != null:
return addRecipeToLog(_that.recipe);case KitchenLogUpdated() when kitchenLogUpdated != null:
return kitchenLogUpdated(_that.recipes);case ClearLog() when clearLog != null:
return clearLog();case _:
  return null;

}
}

}

/// @nodoc


class SubscribeToKitchenLog implements KitchenLogEvent {
  const SubscribeToKitchenLog({required this.uid});
  

 final  String uid;

/// Create a copy of KitchenLogEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscribeToKitchenLogCopyWith<SubscribeToKitchenLog> get copyWith => _$SubscribeToKitchenLogCopyWithImpl<SubscribeToKitchenLog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscribeToKitchenLog&&(identical(other.uid, uid) || other.uid == uid));
}


@override
int get hashCode => Object.hash(runtimeType,uid);

@override
String toString() {
  return 'KitchenLogEvent.subscribeToKitchenLog(uid: $uid)';
}


}

/// @nodoc
abstract mixin class $SubscribeToKitchenLogCopyWith<$Res> implements $KitchenLogEventCopyWith<$Res> {
  factory $SubscribeToKitchenLogCopyWith(SubscribeToKitchenLog value, $Res Function(SubscribeToKitchenLog) _then) = _$SubscribeToKitchenLogCopyWithImpl;
@useResult
$Res call({
 String uid
});




}
/// @nodoc
class _$SubscribeToKitchenLogCopyWithImpl<$Res>
    implements $SubscribeToKitchenLogCopyWith<$Res> {
  _$SubscribeToKitchenLogCopyWithImpl(this._self, this._then);

  final SubscribeToKitchenLog _self;
  final $Res Function(SubscribeToKitchenLog) _then;

/// Create a copy of KitchenLogEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uid = null,}) {
  return _then(SubscribeToKitchenLog(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddRecipeToLog implements KitchenLogEvent {
  const AddRecipeToLog({required this.recipe});
  

 final  RecipeEntity recipe;

/// Create a copy of KitchenLogEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddRecipeToLogCopyWith<AddRecipeToLog> get copyWith => _$AddRecipeToLogCopyWithImpl<AddRecipeToLog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddRecipeToLog&&(identical(other.recipe, recipe) || other.recipe == recipe));
}


@override
int get hashCode => Object.hash(runtimeType,recipe);

@override
String toString() {
  return 'KitchenLogEvent.addRecipeToLog(recipe: $recipe)';
}


}

/// @nodoc
abstract mixin class $AddRecipeToLogCopyWith<$Res> implements $KitchenLogEventCopyWith<$Res> {
  factory $AddRecipeToLogCopyWith(AddRecipeToLog value, $Res Function(AddRecipeToLog) _then) = _$AddRecipeToLogCopyWithImpl;
@useResult
$Res call({
 RecipeEntity recipe
});


$RecipeEntityCopyWith<$Res> get recipe;

}
/// @nodoc
class _$AddRecipeToLogCopyWithImpl<$Res>
    implements $AddRecipeToLogCopyWith<$Res> {
  _$AddRecipeToLogCopyWithImpl(this._self, this._then);

  final AddRecipeToLog _self;
  final $Res Function(AddRecipeToLog) _then;

/// Create a copy of KitchenLogEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? recipe = null,}) {
  return _then(AddRecipeToLog(
recipe: null == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as RecipeEntity,
  ));
}

/// Create a copy of KitchenLogEvent
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


class KitchenLogUpdated implements KitchenLogEvent {
  const KitchenLogUpdated({required final  List<RecipeEntity> recipes}): _recipes = recipes;
  

 final  List<RecipeEntity> _recipes;
 List<RecipeEntity> get recipes {
  if (_recipes is EqualUnmodifiableListView) return _recipes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recipes);
}


/// Create a copy of KitchenLogEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KitchenLogUpdatedCopyWith<KitchenLogUpdated> get copyWith => _$KitchenLogUpdatedCopyWithImpl<KitchenLogUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KitchenLogUpdated&&const DeepCollectionEquality().equals(other._recipes, _recipes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_recipes));

@override
String toString() {
  return 'KitchenLogEvent.kitchenLogUpdated(recipes: $recipes)';
}


}

/// @nodoc
abstract mixin class $KitchenLogUpdatedCopyWith<$Res> implements $KitchenLogEventCopyWith<$Res> {
  factory $KitchenLogUpdatedCopyWith(KitchenLogUpdated value, $Res Function(KitchenLogUpdated) _then) = _$KitchenLogUpdatedCopyWithImpl;
@useResult
$Res call({
 List<RecipeEntity> recipes
});




}
/// @nodoc
class _$KitchenLogUpdatedCopyWithImpl<$Res>
    implements $KitchenLogUpdatedCopyWith<$Res> {
  _$KitchenLogUpdatedCopyWithImpl(this._self, this._then);

  final KitchenLogUpdated _self;
  final $Res Function(KitchenLogUpdated) _then;

/// Create a copy of KitchenLogEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? recipes = null,}) {
  return _then(KitchenLogUpdated(
recipes: null == recipes ? _self._recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<RecipeEntity>,
  ));
}


}

/// @nodoc


class ClearLog implements KitchenLogEvent {
  const ClearLog();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearLog);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KitchenLogEvent.clearLog()';
}


}




// dart format on
