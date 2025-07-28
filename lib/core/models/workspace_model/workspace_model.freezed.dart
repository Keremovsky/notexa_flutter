// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workspace_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkspaceModel {

 int get id; String get name; List<DocumentModel> get documents;
/// Create a copy of WorkspaceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkspaceModelCopyWith<WorkspaceModel> get copyWith => _$WorkspaceModelCopyWithImpl<WorkspaceModel>(this as WorkspaceModel, _$identity);

  /// Serializes this WorkspaceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkspaceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.documents, documents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(documents));

@override
String toString() {
  return 'WorkspaceModel(id: $id, name: $name, documents: $documents)';
}


}

/// @nodoc
abstract mixin class $WorkspaceModelCopyWith<$Res>  {
  factory $WorkspaceModelCopyWith(WorkspaceModel value, $Res Function(WorkspaceModel) _then) = _$WorkspaceModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, List<DocumentModel> documents
});




}
/// @nodoc
class _$WorkspaceModelCopyWithImpl<$Res>
    implements $WorkspaceModelCopyWith<$Res> {
  _$WorkspaceModelCopyWithImpl(this._self, this._then);

  final WorkspaceModel _self;
  final $Res Function(WorkspaceModel) _then;

/// Create a copy of WorkspaceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? documents = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,documents: null == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as List<DocumentModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkspaceModel].
extension WorkspaceModelPatterns on WorkspaceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkspaceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkspaceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkspaceModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkspaceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkspaceModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkspaceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  List<DocumentModel> documents)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkspaceModel() when $default != null:
return $default(_that.id,_that.name,_that.documents);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  List<DocumentModel> documents)  $default,) {final _that = this;
switch (_that) {
case _WorkspaceModel():
return $default(_that.id,_that.name,_that.documents);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  List<DocumentModel> documents)?  $default,) {final _that = this;
switch (_that) {
case _WorkspaceModel() when $default != null:
return $default(_that.id,_that.name,_that.documents);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkspaceModel implements WorkspaceModel {
  const _WorkspaceModel({required this.id, required this.name, required final  List<DocumentModel> documents}): _documents = documents;
  factory _WorkspaceModel.fromJson(Map<String, dynamic> json) => _$WorkspaceModelFromJson(json);

@override final  int id;
@override final  String name;
 final  List<DocumentModel> _documents;
@override List<DocumentModel> get documents {
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documents);
}


/// Create a copy of WorkspaceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkspaceModelCopyWith<_WorkspaceModel> get copyWith => __$WorkspaceModelCopyWithImpl<_WorkspaceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkspaceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkspaceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._documents, _documents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_documents));

@override
String toString() {
  return 'WorkspaceModel(id: $id, name: $name, documents: $documents)';
}


}

/// @nodoc
abstract mixin class _$WorkspaceModelCopyWith<$Res> implements $WorkspaceModelCopyWith<$Res> {
  factory _$WorkspaceModelCopyWith(_WorkspaceModel value, $Res Function(_WorkspaceModel) _then) = __$WorkspaceModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, List<DocumentModel> documents
});




}
/// @nodoc
class __$WorkspaceModelCopyWithImpl<$Res>
    implements _$WorkspaceModelCopyWith<$Res> {
  __$WorkspaceModelCopyWithImpl(this._self, this._then);

  final _WorkspaceModel _self;
  final $Res Function(_WorkspaceModel) _then;

/// Create a copy of WorkspaceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? documents = null,}) {
  return _then(_WorkspaceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,documents: null == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<DocumentModel>,
  ));
}


}

// dart format on
