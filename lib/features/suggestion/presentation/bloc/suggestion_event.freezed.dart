// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggestion_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SuggestionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuggestionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SuggestionEvent()';
}


}

/// @nodoc
class $SuggestionEventCopyWith<$Res>  {
$SuggestionEventCopyWith(SuggestionEvent _, $Res Function(SuggestionEvent) __);
}


/// Adds pattern-matching-related methods to [SuggestionEvent].
extension SuggestionEventPatterns on SuggestionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SubscribeToSuggestions value)?  subscribeToSuggestions,TResult Function( SuggestionsReceived value)?  suggestionsReceived,TResult Function( ClearSuggestions value)?  clearSuggestions,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SubscribeToSuggestions() when subscribeToSuggestions != null:
return subscribeToSuggestions(_that);case SuggestionsReceived() when suggestionsReceived != null:
return suggestionsReceived(_that);case ClearSuggestions() when clearSuggestions != null:
return clearSuggestions(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SubscribeToSuggestions value)  subscribeToSuggestions,required TResult Function( SuggestionsReceived value)  suggestionsReceived,required TResult Function( ClearSuggestions value)  clearSuggestions,}){
final _that = this;
switch (_that) {
case SubscribeToSuggestions():
return subscribeToSuggestions(_that);case SuggestionsReceived():
return suggestionsReceived(_that);case ClearSuggestions():
return clearSuggestions(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SubscribeToSuggestions value)?  subscribeToSuggestions,TResult? Function( SuggestionsReceived value)?  suggestionsReceived,TResult? Function( ClearSuggestions value)?  clearSuggestions,}){
final _that = this;
switch (_that) {
case SubscribeToSuggestions() when subscribeToSuggestions != null:
return subscribeToSuggestions(_that);case SuggestionsReceived() when suggestionsReceived != null:
return suggestionsReceived(_that);case ClearSuggestions() when clearSuggestions != null:
return clearSuggestions(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String uid)?  subscribeToSuggestions,TResult Function( List<RecipeEntity> recipes)?  suggestionsReceived,TResult Function()?  clearSuggestions,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SubscribeToSuggestions() when subscribeToSuggestions != null:
return subscribeToSuggestions(_that.uid);case SuggestionsReceived() when suggestionsReceived != null:
return suggestionsReceived(_that.recipes);case ClearSuggestions() when clearSuggestions != null:
return clearSuggestions();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String uid)  subscribeToSuggestions,required TResult Function( List<RecipeEntity> recipes)  suggestionsReceived,required TResult Function()  clearSuggestions,}) {final _that = this;
switch (_that) {
case SubscribeToSuggestions():
return subscribeToSuggestions(_that.uid);case SuggestionsReceived():
return suggestionsReceived(_that.recipes);case ClearSuggestions():
return clearSuggestions();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String uid)?  subscribeToSuggestions,TResult? Function( List<RecipeEntity> recipes)?  suggestionsReceived,TResult? Function()?  clearSuggestions,}) {final _that = this;
switch (_that) {
case SubscribeToSuggestions() when subscribeToSuggestions != null:
return subscribeToSuggestions(_that.uid);case SuggestionsReceived() when suggestionsReceived != null:
return suggestionsReceived(_that.recipes);case ClearSuggestions() when clearSuggestions != null:
return clearSuggestions();case _:
  return null;

}
}

}

/// @nodoc


class SubscribeToSuggestions implements SuggestionEvent {
  const SubscribeToSuggestions({required this.uid});
  

 final  String uid;

/// Create a copy of SuggestionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscribeToSuggestionsCopyWith<SubscribeToSuggestions> get copyWith => _$SubscribeToSuggestionsCopyWithImpl<SubscribeToSuggestions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscribeToSuggestions&&(identical(other.uid, uid) || other.uid == uid));
}


@override
int get hashCode => Object.hash(runtimeType,uid);

@override
String toString() {
  return 'SuggestionEvent.subscribeToSuggestions(uid: $uid)';
}


}

/// @nodoc
abstract mixin class $SubscribeToSuggestionsCopyWith<$Res> implements $SuggestionEventCopyWith<$Res> {
  factory $SubscribeToSuggestionsCopyWith(SubscribeToSuggestions value, $Res Function(SubscribeToSuggestions) _then) = _$SubscribeToSuggestionsCopyWithImpl;
@useResult
$Res call({
 String uid
});




}
/// @nodoc
class _$SubscribeToSuggestionsCopyWithImpl<$Res>
    implements $SubscribeToSuggestionsCopyWith<$Res> {
  _$SubscribeToSuggestionsCopyWithImpl(this._self, this._then);

  final SubscribeToSuggestions _self;
  final $Res Function(SubscribeToSuggestions) _then;

/// Create a copy of SuggestionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uid = null,}) {
  return _then(SubscribeToSuggestions(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SuggestionsReceived implements SuggestionEvent {
  const SuggestionsReceived({required final  List<RecipeEntity> recipes}): _recipes = recipes;
  

 final  List<RecipeEntity> _recipes;
 List<RecipeEntity> get recipes {
  if (_recipes is EqualUnmodifiableListView) return _recipes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recipes);
}


/// Create a copy of SuggestionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuggestionsReceivedCopyWith<SuggestionsReceived> get copyWith => _$SuggestionsReceivedCopyWithImpl<SuggestionsReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuggestionsReceived&&const DeepCollectionEquality().equals(other._recipes, _recipes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_recipes));

@override
String toString() {
  return 'SuggestionEvent.suggestionsReceived(recipes: $recipes)';
}


}

/// @nodoc
abstract mixin class $SuggestionsReceivedCopyWith<$Res> implements $SuggestionEventCopyWith<$Res> {
  factory $SuggestionsReceivedCopyWith(SuggestionsReceived value, $Res Function(SuggestionsReceived) _then) = _$SuggestionsReceivedCopyWithImpl;
@useResult
$Res call({
 List<RecipeEntity> recipes
});




}
/// @nodoc
class _$SuggestionsReceivedCopyWithImpl<$Res>
    implements $SuggestionsReceivedCopyWith<$Res> {
  _$SuggestionsReceivedCopyWithImpl(this._self, this._then);

  final SuggestionsReceived _self;
  final $Res Function(SuggestionsReceived) _then;

/// Create a copy of SuggestionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? recipes = null,}) {
  return _then(SuggestionsReceived(
recipes: null == recipes ? _self._recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<RecipeEntity>,
  ));
}


}

/// @nodoc


class ClearSuggestions implements SuggestionEvent {
  const ClearSuggestions();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearSuggestions);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SuggestionEvent.clearSuggestions()';
}


}




// dart format on
