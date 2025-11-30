import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_entity.freezed.dart';

@freezed
abstract class WeatherEntity with _$WeatherEntity {
  const factory WeatherEntity({
    required num temperature,
    required num windSpeed,
    required String weatherDescription,
    required bool isDay,
    required DateTime time,
  }) = _WeatherEntity;
}
