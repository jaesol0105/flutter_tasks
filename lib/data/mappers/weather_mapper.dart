import 'package:tasks/data/dto/weather_dto.dart';
import 'package:tasks/domain/entities/weather_entity.dart';

/// WeatherDTO와 WeatherEntity 간 변환 매퍼
class WeatherMapper {
  /// WeatherDTO를 WeatherEntity로 변환
  static WeatherEntity toEntity(WeatherDTO dto) {
    return WeatherEntity(
      temperature: dto.temperature,
      windSpeed: dto.windSpeed,
      weatherDescription: dto.weatherDescription,
      isDay: dto.isDay == 1,
      time: dto.time,
    );
  }

  /// WeatherEntity를 WeatherDTO로 변환
  static WeatherDTO toModel(WeatherEntity entity) {
    return WeatherDTO(
      temperature: entity.temperature,
      windSpeed: entity.windSpeed,
      weatherDescription: entity.weatherDescription,
      isDay: entity.isDay ? 1 : 0,
      time: entity.time,
    );
  }
}
