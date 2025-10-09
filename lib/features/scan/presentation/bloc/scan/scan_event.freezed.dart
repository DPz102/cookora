// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScanEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScanEvent()';
}


}

/// @nodoc
class $ScanEventCopyWith<$Res>  {
$ScanEventCopyWith(ScanEvent _, $Res Function(ScanEvent) __);
}


/// Adds pattern-matching-related methods to [ScanEvent].
extension ScanEventPatterns on ScanEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _RecognizeImage value)?  recognizeImage,TResult Function( _Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecognizeImage() when recognizeImage != null:
return recognizeImage(_that);case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _RecognizeImage value)  recognizeImage,required TResult Function( _Reset value)  reset,}){
final _that = this;
switch (_that) {
case _RecognizeImage():
return recognizeImage(_that);case _Reset():
return reset(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _RecognizeImage value)?  recognizeImage,TResult? Function( _Reset value)?  reset,}){
final _that = this;
switch (_that) {
case _RecognizeImage() when recognizeImage != null:
return recognizeImage(_that);case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( File imageFile,  ScanMode mode)?  recognizeImage,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecognizeImage() when recognizeImage != null:
return recognizeImage(_that.imageFile,_that.mode);case _Reset() when reset != null:
return reset();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( File imageFile,  ScanMode mode)  recognizeImage,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case _RecognizeImage():
return recognizeImage(_that.imageFile,_that.mode);case _Reset():
return reset();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( File imageFile,  ScanMode mode)?  recognizeImage,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case _RecognizeImage() when recognizeImage != null:
return recognizeImage(_that.imageFile,_that.mode);case _Reset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class _RecognizeImage extends ScanEvent {
  const _RecognizeImage({required this.imageFile, required this.mode}): super._();
  

 final  File imageFile;
 final  ScanMode mode;

/// Create a copy of ScanEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecognizeImageCopyWith<_RecognizeImage> get copyWith => __$RecognizeImageCopyWithImpl<_RecognizeImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecognizeImage&&(identical(other.imageFile, imageFile) || other.imageFile == imageFile)&&(identical(other.mode, mode) || other.mode == mode));
}


@override
int get hashCode => Object.hash(runtimeType,imageFile,mode);

@override
String toString() {
  return 'ScanEvent.recognizeImage(imageFile: $imageFile, mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$RecognizeImageCopyWith<$Res> implements $ScanEventCopyWith<$Res> {
  factory _$RecognizeImageCopyWith(_RecognizeImage value, $Res Function(_RecognizeImage) _then) = __$RecognizeImageCopyWithImpl;
@useResult
$Res call({
 File imageFile, ScanMode mode
});




}
/// @nodoc
class __$RecognizeImageCopyWithImpl<$Res>
    implements _$RecognizeImageCopyWith<$Res> {
  __$RecognizeImageCopyWithImpl(this._self, this._then);

  final _RecognizeImage _self;
  final $Res Function(_RecognizeImage) _then;

/// Create a copy of ScanEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imageFile = null,Object? mode = null,}) {
  return _then(_RecognizeImage(
imageFile: null == imageFile ? _self.imageFile : imageFile // ignore: cast_nullable_to_non_nullable
as File,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ScanMode,
  ));
}


}

/// @nodoc


class _Reset extends ScanEvent {
  const _Reset(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScanEvent.reset()';
}


}




// dart format on
