// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodoListState {

 List<TodoEntity> get todos; bool get hasMore;// 아직 안가져온 데이터가 서버에 있는지
 bool get isLoadingMore;
/// Create a copy of TodoListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoListStateCopyWith<TodoListState> get copyWith => _$TodoListStateCopyWithImpl<TodoListState>(this as TodoListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoListState&&const DeepCollectionEquality().equals(other.todos, todos)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(todos),hasMore,isLoadingMore);

@override
String toString() {
  return 'TodoListState(todos: $todos, hasMore: $hasMore, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class $TodoListStateCopyWith<$Res>  {
  factory $TodoListStateCopyWith(TodoListState value, $Res Function(TodoListState) _then) = _$TodoListStateCopyWithImpl;
@useResult
$Res call({
 List<TodoEntity> todos, bool hasMore, bool isLoadingMore
});




}
/// @nodoc
class _$TodoListStateCopyWithImpl<$Res>
    implements $TodoListStateCopyWith<$Res> {
  _$TodoListStateCopyWithImpl(this._self, this._then);

  final TodoListState _self;
  final $Res Function(TodoListState) _then;

/// Create a copy of TodoListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? todos = null,Object? hasMore = null,Object? isLoadingMore = null,}) {
  return _then(_self.copyWith(
todos: null == todos ? _self.todos : todos // ignore: cast_nullable_to_non_nullable
as List<TodoEntity>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TodoListState].
extension TodoListStatePatterns on TodoListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodoListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodoListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodoListState value)  $default,){
final _that = this;
switch (_that) {
case _TodoListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodoListState value)?  $default,){
final _that = this;
switch (_that) {
case _TodoListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TodoEntity> todos,  bool hasMore,  bool isLoadingMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodoListState() when $default != null:
return $default(_that.todos,_that.hasMore,_that.isLoadingMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TodoEntity> todos,  bool hasMore,  bool isLoadingMore)  $default,) {final _that = this;
switch (_that) {
case _TodoListState():
return $default(_that.todos,_that.hasMore,_that.isLoadingMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TodoEntity> todos,  bool hasMore,  bool isLoadingMore)?  $default,) {final _that = this;
switch (_that) {
case _TodoListState() when $default != null:
return $default(_that.todos,_that.hasMore,_that.isLoadingMore);case _:
  return null;

}
}

}

/// @nodoc


class _TodoListState implements TodoListState {
  const _TodoListState({required final  List<TodoEntity> todos, this.hasMore = true, this.isLoadingMore = false}): _todos = todos;
  

 final  List<TodoEntity> _todos;
@override List<TodoEntity> get todos {
  if (_todos is EqualUnmodifiableListView) return _todos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_todos);
}

@override@JsonKey() final  bool hasMore;
// 아직 안가져온 데이터가 서버에 있는지
@override@JsonKey() final  bool isLoadingMore;

/// Create a copy of TodoListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoListStateCopyWith<_TodoListState> get copyWith => __$TodoListStateCopyWithImpl<_TodoListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoListState&&const DeepCollectionEquality().equals(other._todos, _todos)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_todos),hasMore,isLoadingMore);

@override
String toString() {
  return 'TodoListState(todos: $todos, hasMore: $hasMore, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class _$TodoListStateCopyWith<$Res> implements $TodoListStateCopyWith<$Res> {
  factory _$TodoListStateCopyWith(_TodoListState value, $Res Function(_TodoListState) _then) = __$TodoListStateCopyWithImpl;
@override @useResult
$Res call({
 List<TodoEntity> todos, bool hasMore, bool isLoadingMore
});




}
/// @nodoc
class __$TodoListStateCopyWithImpl<$Res>
    implements _$TodoListStateCopyWith<$Res> {
  __$TodoListStateCopyWithImpl(this._self, this._then);

  final _TodoListState _self;
  final $Res Function(_TodoListState) _then;

/// Create a copy of TodoListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? todos = null,Object? hasMore = null,Object? isLoadingMore = null,}) {
  return _then(_TodoListState(
todos: null == todos ? _self._todos : todos // ignore: cast_nullable_to_non_nullable
as List<TodoEntity>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
