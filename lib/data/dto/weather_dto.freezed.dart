// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherDTO {

@JsonKey(name: 'temperature_2m') num get temperature;@JsonKey(name: 'wind_speed_10m') num get windSpeed;@JsonKey(name: 'weather_code', fromJson: WeatherCodeConverter.toDescription) String get weatherDescription;@JsonKey(name: 'is_day') num get isDay;@JsonKey(fromJson: DateTime.parse) DateTime get time;
/// Create a copy of WeatherDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherDTOCopyWith<WeatherDTO> get copyWith => _$WeatherDTOCopyWithImpl<WeatherDTO>(this as WeatherDTO, _$identity);

  /// Serializes this WeatherDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherDTO&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.weatherDescription, weatherDescription) || other.weatherDescription == weatherDescription)&&(identical(other.isDay, isDay) || other.isDay == isDay)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,temperature,windSpeed,weatherDescription,isDay,time);

@override
String toString() {
  return 'WeatherDTO(temperature: $temperature, windSpeed: $windSpeed, weatherDescription: $weatherDescription, isDay: $isDay, time: $time)';
}


}

/// @nodoc
abstract mixin class $WeatherDTOCopyWith<$Res>  {
  factory $WeatherDTOCopyWith(WeatherDTO value, $Res Function(WeatherDTO) _then) = _$WeatherDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'temperature_2m') num temperature,@JsonKey(name: 'wind_speed_10m') num windSpeed,@JsonKey(name: 'weather_code', fromJson: WeatherCodeConverter.toDescription) String weatherDescription,@JsonKey(name: 'is_day') num isDay,@JsonKey(fromJson: DateTime.parse) DateTime time
});




}
/// @nodoc
class _$WeatherDTOCopyWithImpl<$Res>
    implements $WeatherDTOCopyWith<$Res> {
  _$WeatherDTOCopyWithImpl(this._self, this._then);

  final WeatherDTO _self;
  final $Res Function(WeatherDTO) _then;

/// Create a copy of WeatherDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? temperature = null,Object? windSpeed = null,Object? weatherDescription = null,Object? isDay = null,Object? time = null,}) {
  return _then(_self.copyWith(
temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as num,windSpeed: null == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as num,weatherDescription: null == weatherDescription ? _self.weatherDescription : weatherDescription // ignore: cast_nullable_to_non_nullable
as String,isDay: null == isDay ? _self.isDay : isDay // ignore: cast_nullable_to_non_nullable
as num,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherDTO].
extension WeatherDTOPatterns on WeatherDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherDTO value)  $default,){
final _that = this;
switch (_that) {
case _WeatherDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherDTO value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'temperature_2m')  num temperature, @JsonKey(name: 'wind_speed_10m')  num windSpeed, @JsonKey(name: 'weather_code', fromJson: WeatherCodeConverter.toDescription)  String weatherDescription, @JsonKey(name: 'is_day')  num isDay, @JsonKey(fromJson: DateTime.parse)  DateTime time)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherDTO() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'temperature_2m')  num temperature, @JsonKey(name: 'wind_speed_10m')  num windSpeed, @JsonKey(name: 'weather_code', fromJson: WeatherCodeConverter.toDescription)  String weatherDescription, @JsonKey(name: 'is_day')  num isDay, @JsonKey(fromJson: DateTime.parse)  DateTime time)  $default,) {final _that = this;
switch (_that) {
case _WeatherDTO():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'temperature_2m')  num temperature, @JsonKey(name: 'wind_speed_10m')  num windSpeed, @JsonKey(name: 'weather_code', fromJson: WeatherCodeConverter.toDescription)  String weatherDescription, @JsonKey(name: 'is_day')  num isDay, @JsonKey(fromJson: DateTime.parse)  DateTime time)?  $default,) {final _that = this;
switch (_that) {
case _WeatherDTO() when $default != null:
return $default(_that.temperature,_that.windSpeed,_that.weatherDescription,_that.isDay,_that.time);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeatherDTO implements WeatherDTO {
  const _WeatherDTO({@JsonKey(name: 'temperature_2m') required this.temperature, @JsonKey(name: 'wind_speed_10m') required this.windSpeed, @JsonKey(name: 'weather_code', fromJson: WeatherCodeConverter.toDescription) required this.weatherDescription, @JsonKey(name: 'is_day') required this.isDay, @JsonKey(fromJson: DateTime.parse) required this.time});
  factory _WeatherDTO.fromJson(Map<String, dynamic> json) => _$WeatherDTOFromJson(json);

@override@JsonKey(name: 'temperature_2m') final  num temperature;
@override@JsonKey(name: 'wind_speed_10m') final  num windSpeed;
@override@JsonKey(name: 'weather_code', fromJson: WeatherCodeConverter.toDescription) final  String weatherDescription;
@override@JsonKey(name: 'is_day') final  num isDay;
@override@JsonKey(fromJson: DateTime.parse) final  DateTime time;

/// Create a copy of WeatherDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherDTOCopyWith<_WeatherDTO> get copyWith => __$WeatherDTOCopyWithImpl<_WeatherDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherDTO&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.weatherDescription, weatherDescription) || other.weatherDescription == weatherDescription)&&(identical(other.isDay, isDay) || other.isDay == isDay)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,temperature,windSpeed,weatherDescription,isDay,time);

@override
String toString() {
  return 'WeatherDTO(temperature: $temperature, windSpeed: $windSpeed, weatherDescription: $weatherDescription, isDay: $isDay, time: $time)';
}


}

/// @nodoc
abstract mixin class _$WeatherDTOCopyWith<$Res> implements $WeatherDTOCopyWith<$Res> {
  factory _$WeatherDTOCopyWith(_WeatherDTO value, $Res Function(_WeatherDTO) _then) = __$WeatherDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'temperature_2m') num temperature,@JsonKey(name: 'wind_speed_10m') num windSpeed,@JsonKey(name: 'weather_code', fromJson: WeatherCodeConverter.toDescription) String weatherDescription,@JsonKey(name: 'is_day') num isDay,@JsonKey(fromJson: DateTime.parse) DateTime time
});




}
/// @nodoc
class __$WeatherDTOCopyWithImpl<$Res>
    implements _$WeatherDTOCopyWith<$Res> {
  __$WeatherDTOCopyWithImpl(this._self, this._then);

  final _WeatherDTO _self;
  final $Res Function(_WeatherDTO) _then;

/// Create a copy of WeatherDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? temperature = null,Object? windSpeed = null,Object? weatherDescription = null,Object? isDay = null,Object? time = null,}) {
  return _then(_WeatherDTO(
temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as num,windSpeed: null == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as num,weatherDescription: null == weatherDescription ? _self.weatherDescription : weatherDescription // ignore: cast_nullable_to_non_nullable
as String,isDay: null == isDay ? _self.isDay : isDay // ignore: cast_nullable_to_non_nullable
as num,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
