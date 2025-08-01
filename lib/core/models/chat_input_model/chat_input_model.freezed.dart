// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatInputModel implements DiagnosticableTreeMixin {

 int get id; String get prompt; String get tp; String get mode;
/// Create a copy of ChatInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatInputModelCopyWith<ChatInputModel> get copyWith => _$ChatInputModelCopyWithImpl<ChatInputModel>(this as ChatInputModel, _$identity);

  /// Serializes this ChatInputModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ChatInputModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('prompt', prompt))..add(DiagnosticsProperty('tp', tp))..add(DiagnosticsProperty('mode', mode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatInputModel&&(identical(other.id, id) || other.id == id)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.tp, tp) || other.tp == tp)&&(identical(other.mode, mode) || other.mode == mode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,prompt,tp,mode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChatInputModel(id: $id, prompt: $prompt, tp: $tp, mode: $mode)';
}


}

/// @nodoc
abstract mixin class $ChatInputModelCopyWith<$Res>  {
  factory $ChatInputModelCopyWith(ChatInputModel value, $Res Function(ChatInputModel) _then) = _$ChatInputModelCopyWithImpl;
@useResult
$Res call({
 int id, String prompt, String tp, String mode
});




}
/// @nodoc
class _$ChatInputModelCopyWithImpl<$Res>
    implements $ChatInputModelCopyWith<$Res> {
  _$ChatInputModelCopyWithImpl(this._self, this._then);

  final ChatInputModel _self;
  final $Res Function(ChatInputModel) _then;

/// Create a copy of ChatInputModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? prompt = null,Object? tp = null,Object? mode = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,tp: null == tp ? _self.tp : tp // ignore: cast_nullable_to_non_nullable
as String,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatInputModel].
extension ChatInputModelPatterns on ChatInputModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatInputModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatInputModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatInputModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatInputModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatInputModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatInputModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String prompt,  String tp,  String mode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatInputModel() when $default != null:
return $default(_that.id,_that.prompt,_that.tp,_that.mode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String prompt,  String tp,  String mode)  $default,) {final _that = this;
switch (_that) {
case _ChatInputModel():
return $default(_that.id,_that.prompt,_that.tp,_that.mode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String prompt,  String tp,  String mode)?  $default,) {final _that = this;
switch (_that) {
case _ChatInputModel() when $default != null:
return $default(_that.id,_that.prompt,_that.tp,_that.mode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatInputModel with DiagnosticableTreeMixin implements ChatInputModel {
  const _ChatInputModel({required this.id, required this.prompt, required this.tp, required this.mode});
  factory _ChatInputModel.fromJson(Map<String, dynamic> json) => _$ChatInputModelFromJson(json);

@override final  int id;
@override final  String prompt;
@override final  String tp;
@override final  String mode;

/// Create a copy of ChatInputModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatInputModelCopyWith<_ChatInputModel> get copyWith => __$ChatInputModelCopyWithImpl<_ChatInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatInputModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ChatInputModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('prompt', prompt))..add(DiagnosticsProperty('tp', tp))..add(DiagnosticsProperty('mode', mode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatInputModel&&(identical(other.id, id) || other.id == id)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.tp, tp) || other.tp == tp)&&(identical(other.mode, mode) || other.mode == mode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,prompt,tp,mode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChatInputModel(id: $id, prompt: $prompt, tp: $tp, mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$ChatInputModelCopyWith<$Res> implements $ChatInputModelCopyWith<$Res> {
  factory _$ChatInputModelCopyWith(_ChatInputModel value, $Res Function(_ChatInputModel) _then) = __$ChatInputModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String prompt, String tp, String mode
});




}
/// @nodoc
class __$ChatInputModelCopyWithImpl<$Res>
    implements _$ChatInputModelCopyWith<$Res> {
  __$ChatInputModelCopyWithImpl(this._self, this._then);

  final _ChatInputModel _self;
  final $Res Function(_ChatInputModel) _then;

/// Create a copy of ChatInputModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? prompt = null,Object? tp = null,Object? mode = null,}) {
  return _then(_ChatInputModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,tp: null == tp ? _self.tp : tp // ignore: cast_nullable_to_non_nullable
as String,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
