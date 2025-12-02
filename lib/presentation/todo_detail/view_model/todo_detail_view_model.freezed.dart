// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_detail_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodoDetailState {

 TodoEntity get originalTodo; bool get isFavorite; DateTime? get deadLine; bool get isEdited;
/// Create a copy of TodoDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoDetailStateCopyWith<TodoDetailState> get copyWith => _$TodoDetailStateCopyWithImpl<TodoDetailState>(this as TodoDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoDetailState&&(identical(other.originalTodo, originalTodo) || other.originalTodo == originalTodo)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.deadLine, deadLine) || other.deadLine == deadLine)&&(identical(other.isEdited, isEdited) || other.isEdited == isEdited));
}


@override
int get hashCode => Object.hash(runtimeType,originalTodo,isFavorite,deadLine,isEdited);

@override
String toString() {
  return 'TodoDetailState(originalTodo: $originalTodo, isFavorite: $isFavorite, deadLine: $deadLine, isEdited: $isEdited)';
}


}

/// @nodoc
abstract mixin class $TodoDetailStateCopyWith<$Res>  {
  factory $TodoDetailStateCopyWith(TodoDetailState value, $Res Function(TodoDetailState) _then) = _$TodoDetailStateCopyWithImpl;
@useResult
$Res call({
 TodoEntity originalTodo, bool isFavorite, DateTime? deadLine, bool isEdited
});


$TodoEntityCopyWith<$Res> get originalTodo;

}
/// @nodoc
class _$TodoDetailStateCopyWithImpl<$Res>
    implements $TodoDetailStateCopyWith<$Res> {
  _$TodoDetailStateCopyWithImpl(this._self, this._then);

  final TodoDetailState _self;
  final $Res Function(TodoDetailState) _then;

/// Create a copy of TodoDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? originalTodo = null,Object? isFavorite = null,Object? deadLine = freezed,Object? isEdited = null,}) {
  return _then(_self.copyWith(
originalTodo: null == originalTodo ? _self.originalTodo : originalTodo // ignore: cast_nullable_to_non_nullable
as TodoEntity,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,deadLine: freezed == deadLine ? _self.deadLine : deadLine // ignore: cast_nullable_to_non_nullable
as DateTime?,isEdited: null == isEdited ? _self.isEdited : isEdited // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of TodoDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TodoEntityCopyWith<$Res> get originalTodo {
  
  return $TodoEntityCopyWith<$Res>(_self.originalTodo, (value) {
    return _then(_self.copyWith(originalTodo: value));
  });
}
}


/// Adds pattern-matching-related methods to [TodoDetailState].
extension TodoDetailStatePatterns on TodoDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodoDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodoDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodoDetailState value)  $default,){
final _that = this;
switch (_that) {
case _TodoDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodoDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _TodoDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TodoEntity originalTodo,  bool isFavorite,  DateTime? deadLine,  bool isEdited)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodoDetailState() when $default != null:
return $default(_that.originalTodo,_that.isFavorite,_that.deadLine,_that.isEdited);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TodoEntity originalTodo,  bool isFavorite,  DateTime? deadLine,  bool isEdited)  $default,) {final _that = this;
switch (_that) {
case _TodoDetailState():
return $default(_that.originalTodo,_that.isFavorite,_that.deadLine,_that.isEdited);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TodoEntity originalTodo,  bool isFavorite,  DateTime? deadLine,  bool isEdited)?  $default,) {final _that = this;
switch (_that) {
case _TodoDetailState() when $default != null:
return $default(_that.originalTodo,_that.isFavorite,_that.deadLine,_that.isEdited);case _:
  return null;

}
}

}

/// @nodoc


class _TodoDetailState implements TodoDetailState {
  const _TodoDetailState({required this.originalTodo, required this.isFavorite, required this.deadLine, required this.isEdited});
  

@override final  TodoEntity originalTodo;
@override final  bool isFavorite;
@override final  DateTime? deadLine;
@override final  bool isEdited;

/// Create a copy of TodoDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoDetailStateCopyWith<_TodoDetailState> get copyWith => __$TodoDetailStateCopyWithImpl<_TodoDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoDetailState&&(identical(other.originalTodo, originalTodo) || other.originalTodo == originalTodo)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.deadLine, deadLine) || other.deadLine == deadLine)&&(identical(other.isEdited, isEdited) || other.isEdited == isEdited));
}


@override
int get hashCode => Object.hash(runtimeType,originalTodo,isFavorite,deadLine,isEdited);

@override
String toString() {
  return 'TodoDetailState(originalTodo: $originalTodo, isFavorite: $isFavorite, deadLine: $deadLine, isEdited: $isEdited)';
}


}

/// @nodoc
abstract mixin class _$TodoDetailStateCopyWith<$Res> implements $TodoDetailStateCopyWith<$Res> {
  factory _$TodoDetailStateCopyWith(_TodoDetailState value, $Res Function(_TodoDetailState) _then) = __$TodoDetailStateCopyWithImpl;
@override @useResult
$Res call({
 TodoEntity originalTodo, bool isFavorite, DateTime? deadLine, bool isEdited
});


@override $TodoEntityCopyWith<$Res> get originalTodo;

}
/// @nodoc
class __$TodoDetailStateCopyWithImpl<$Res>
    implements _$TodoDetailStateCopyWith<$Res> {
  __$TodoDetailStateCopyWithImpl(this._self, this._then);

  final _TodoDetailState _self;
  final $Res Function(_TodoDetailState) _then;

/// Create a copy of TodoDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? originalTodo = null,Object? isFavorite = null,Object? deadLine = freezed,Object? isEdited = null,}) {
  return _then(_TodoDetailState(
originalTodo: null == originalTodo ? _self.originalTodo : originalTodo // ignore: cast_nullable_to_non_nullable
as TodoEntity,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,deadLine: freezed == deadLine ? _self.deadLine : deadLine // ignore: cast_nullable_to_non_nullable
as DateTime?,isEdited: null == isEdited ? _self.isEdited : isEdited // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of TodoDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TodoEntityCopyWith<$Res> get originalTodo {
  
  return $TodoEntityCopyWith<$Res>(_self.originalTodo, (value) {
    return _then(_self.copyWith(originalTodo: value));
  });
}
}

// dart format on
