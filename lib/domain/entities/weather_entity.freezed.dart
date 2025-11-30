// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeatherEntity {

 num get temperature; num get windSpeed; String get weatherDescription; bool get isDay; DateTime get time;
/// Create a copy of WeatherEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherEntityCopyWith<WeatherEntity> get copyWith => _$WeatherEntityCopyWithImpl<WeatherEntity>(this as WeatherEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherEntity&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.weatherDescription, weatherDescription) || other.weatherDescription == weatherDescription)&&(identical(other.isDay, isDay) || other.isDay == isDay)&&(identical(other.time, time) || other.time == time));
}


@override
int get hashCode => Object.hash(runtimeType,temperature,windSpeed,weatherDescription,isDay,time);

@override
String toString() {
  return 'WeatherEntity(temperature: $temperature, windSpeed: $windSpeed, weatherDescription: $weatherDescription, isDay: $isDay, time: $time)';
}


}

/// @nodoc
abstract mixin class $WeatherEntityCopyWith<$Res>  {
  factory $WeatherEntityCopyWith(WeatherEntity value, $Res Function(WeatherEntity) _then) = _$WeatherEntityCopyWithImpl;
@useResult
$Res call({
 num temperature, num windSpeed, String weatherDescription, bool isDay, DateTime time
});




}
/// @nodoc
class _$WeatherEntityCopyWithImpl<$Res>
    implements $WeatherEntityCopyWith<$Res> {
  _$WeatherEntityCopyWithImpl(this._self, this._then);

  final WeatherEntity _self;
  final $Res Function(WeatherEntity) _then;

/// Create a copy of WeatherEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? temperature = null,Object? windSpeed = null,Object? weatherDescription = null,Object? isDay = null,Object? time = null,}) {
  return _then(_self.copyWith(
temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as num,windSpeed: null == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as num,weatherDescription: null == weatherDescription ? _self.weatherDescription : weatherDescription // ignore: cast_nullable_to_non_nullable
as String,isDay: null == isDay ? _self.isDay : isDay // ignore: cast_nullable_to_non_nullable
as bool,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherEntity].
extension WeatherEntityPatterns on WeatherEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherEntity value)  $default,){
final _that = this;
switch (_that) {
case _WeatherEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherEntity value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( num temperature,  num windSpeed,  String weatherDescription,  bool isDay,  DateTime time)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherEntity() when $default != null:
return $default(_that.temperature,_that.windSpeed,_that.weatherDescription,_that.isDay,_that.time);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( num temperature,  num windSpeed,  String weatherDescription,  bool isDay,  DateTime time)  $default,) {final _that = this;
switch (_that) {
case _WeatherEntity():
return $default(_that.temperature,_that.windSpeed,_that.weatherDescription,_that.isDay,_that.time);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( num temperature,  num windSpeed,  String weatherDescription,  bool isDay,  DateTime time)?  $default,) {final _that = this;
switch (_that) {
case _WeatherEntity() when $default != null:
return $default(_that.temperature,_that.windSpeed,_that.weatherDescription,_that.isDay,_that.time);case _:
  return null;

}
}

}

/// @nodoc


class _WeatherEntity implements WeatherEntity {
  const _WeatherEntity({required this.temperature, required this.windSpeed, required this.weatherDescription, required this.isDay, required this.time});
  

@override final  num temperature;
@override final  num windSpeed;
@override final  String weatherDescription;
@override final  bool isDay;
@override final  DateTime time;

/// Create a copy of WeatherEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherEntityCopyWith<_WeatherEntity> get copyWith => __$WeatherEntityCopyWithImpl<_WeatherEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherEntity&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.weatherDescription, weatherDescription) || other.weatherDescription == weatherDescription)&&(identical(other.isDay, isDay) || other.isDay == isDay)&&(identical(other.time, time) || other.time == time));
}


@override
int get hashCode => Object.hash(runtimeType,temperature,windSpeed,weatherDescription,isDay,time);

@override
String toString() {
  return 'WeatherEntity(temperature: $temperature, windSpeed: $windSpeed, weatherDescription: $weatherDescription, isDay: $isDay, time: $time)';
}


}

/// @nodoc
abstract mixin class _$WeatherEntityCopyWith<$Res> implements $WeatherEntityCopyWith<$Res> {
  factory _$WeatherEntityCopyWith(_WeatherEntity value, $Res Function(_WeatherEntity) _then) = __$WeatherEntityCopyWithImpl;
@override @useResult
$Res call({
 num temperature, num windSpeed, String weatherDescription, bool isDay, DateTime time
});




}
/// @nodoc
class __$WeatherEntityCopyWithImpl<$Res>
    implements _$WeatherEntityCopyWith<$Res> {
  __$WeatherEntityCopyWithImpl(this._self, this._then);

  final _WeatherEntity _self;
  final $Res Function(_WeatherEntity) _then;

/// Create a copy of WeatherEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? temperature = null,Object? windSpeed = null,Object? weatherDescription = null,Object? isDay = null,Object? time = null,}) {
  return _then(_WeatherEntity(
temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as num,windSpeed: null == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as num,weatherDescription: null == weatherDescription ? _self.weatherDescription : weatherDescription // ignore: cast_nullable_to_non_nullable
as String,isDay: null == isDay ? _self.isDay : isDay // ignore: cast_nullable_to_non_nullable
as bool,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
