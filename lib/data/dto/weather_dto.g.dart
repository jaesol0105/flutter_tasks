// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherDTO _$WeatherDTOFromJson(Map<String, dynamic> json) => _WeatherDTO(
  temperature: json['temperature_2m'] as num,
  windSpeed: json['wind_speed_10m'] as num,
  weatherDescription: WeatherCodeConverter.toDescription(
    json['weather_code'] as num,
  ),
  isDay: json['is_day'] as num,
  time: DateTime.parse(json['time'] as String),
);

Map<String, dynamic> _$WeatherDTOToJson(_WeatherDTO instance) =>
    <String, dynamic>{
      'temperature_2m': instance.temperature,
      'wind_speed_10m': instance.windSpeed,
      'weather_code': instance.weatherDescription,
      'is_day': instance.isDay,
      'time': instance.time.toIso8601String(),
    };
