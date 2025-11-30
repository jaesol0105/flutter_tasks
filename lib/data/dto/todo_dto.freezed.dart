// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodoDTO {

 String get id; String get title; String? get description;@JsonKey(name: 'is_favorite') bool get isFavorite;@JsonKey(name: 'is_done') bool get isDone;@JsonKey(name: 'created_at', fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp) DateTime? get createdAt;@JsonKey(name: 'dead_line', fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp) DateTime? get deadLine;
/// Create a copy of TodoDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoDTOCopyWith<TodoDTO> get copyWith => _$TodoDTOCopyWithImpl<TodoDTO>(this as TodoDTO, _$identity);

  /// Serializes this TodoDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.isDone, isDone) || other.isDone == isDone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deadLine, deadLine) || other.deadLine == deadLine));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,isFavorite,isDone,createdAt,deadLine);

@override
String toString() {
  return 'TodoDTO(id: $id, title: $title, description: $description, isFavorite: $isFavorite, isDone: $isDone, createdAt: $createdAt, deadLine: $deadLine)';
}


}

/// @nodoc
abstract mixin class $TodoDTOCopyWith<$Res>  {
  factory $TodoDTOCopyWith(TodoDTO value, $Res Function(TodoDTO) _then) = _$TodoDTOCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description,@JsonKey(name: 'is_favorite') bool isFavorite,@JsonKey(name: 'is_done') bool isDone,@JsonKey(name: 'created_at', fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp) DateTime? createdAt,@JsonKey(name: 'dead_line', fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp) DateTime? deadLine
});




}
/// @nodoc
class _$TodoDTOCopyWithImpl<$Res>
    implements $TodoDTOCopyWith<$Res> {
  _$TodoDTOCopyWithImpl(this._self, this._then);

  final TodoDTO _self;
  final $Res Function(TodoDTO) _then;

/// Create a copy of TodoDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? isFavorite = null,Object? isDone = null,Object? createdAt = freezed,Object? deadLine = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deadLine: freezed == deadLine ? _self.deadLine : deadLine // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TodoDTO].
extension TodoDTOPatterns on TodoDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodoDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodoDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodoDTO value)  $default,){
final _that = this;
switch (_that) {
case _TodoDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodoDTO value)?  $default,){
final _that = this;
switch (_that) {
case _TodoDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? description, @JsonKey(name: 'is_favorite')  bool isFavorite, @JsonKey(name: 'is_done')  bool isDone, @JsonKey(name: 'created_at', fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp)  DateTime? createdAt, @JsonKey(name: 'dead_line', fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp)  DateTime? deadLine)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodoDTO() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.isFavorite,_that.isDone,_that.createdAt,_that.deadLine);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? description, @JsonKey(name: 'is_favorite')  bool isFavorite, @JsonKey(name: 'is_done')  bool isDone, @JsonKey(name: 'created_at', fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp)  DateTime? createdAt, @JsonKey(name: 'dead_line', fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp)  DateTime? deadLine)  $default,) {final _that = this;
switch (_that) {
case _TodoDTO():
return $default(_that.id,_that.title,_that.description,_that.isFavorite,_that.isDone,_that.createdAt,_that.deadLine);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? description, @JsonKey(name: 'is_favorite')  bool isFavorite, @JsonKey(name: 'is_done')  bool isDone, @JsonKey(name: 'created_at', fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp)  DateTime? createdAt, @JsonKey(name: 'dead_line', fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp)  DateTime? deadLine)?  $default,) {final _that = this;
switch (_that) {
case _TodoDTO() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.isFavorite,_that.isDone,_that.createdAt,_that.deadLine);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TodoDTO implements TodoDTO {
  const _TodoDTO({required this.id, required this.title, this.description, @JsonKey(name: 'is_favorite') required this.isFavorite, @JsonKey(name: 'is_done') required this.isDone, @JsonKey(name: 'created_at', fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp) this.createdAt, @JsonKey(name: 'dead_line', fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp) this.deadLine});
  factory _TodoDTO.fromJson(Map<String, dynamic> json) => _$TodoDTOFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? description;
@override@JsonKey(name: 'is_favorite') final  bool isFavorite;
@override@JsonKey(name: 'is_done') final  bool isDone;
@override@JsonKey(name: 'created_at', fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp) final  DateTime? createdAt;
@override@JsonKey(name: 'dead_line', fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp) final  DateTime? deadLine;

/// Create a copy of TodoDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoDTOCopyWith<_TodoDTO> get copyWith => __$TodoDTOCopyWithImpl<_TodoDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TodoDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.isDone, isDone) || other.isDone == isDone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deadLine, deadLine) || other.deadLine == deadLine));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,isFavorite,isDone,createdAt,deadLine);

@override
String toString() {
  return 'TodoDTO(id: $id, title: $title, description: $description, isFavorite: $isFavorite, isDone: $isDone, createdAt: $createdAt, deadLine: $deadLine)';
}


}

/// @nodoc
abstract mixin class _$TodoDTOCopyWith<$Res> implements $TodoDTOCopyWith<$Res> {
  factory _$TodoDTOCopyWith(_TodoDTO value, $Res Function(_TodoDTO) _then) = __$TodoDTOCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description,@JsonKey(name: 'is_favorite') bool isFavorite,@JsonKey(name: 'is_done') bool isDone,@JsonKey(name: 'created_at', fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp) DateTime? createdAt,@JsonKey(name: 'dead_line', fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp) DateTime? deadLine
});




}
/// @nodoc
class __$TodoDTOCopyWithImpl<$Res>
    implements _$TodoDTOCopyWith<$Res> {
  __$TodoDTOCopyWithImpl(this._self, this._then);

  final _TodoDTO _self;
  final $Res Function(_TodoDTO) _then;

/// Create a copy of TodoDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? isFavorite = null,Object? isDone = null,Object? createdAt = freezed,Object? deadLine = freezed,}) {
  return _then(_TodoDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deadLine: freezed == deadLine ? _self.deadLine : deadLine // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
