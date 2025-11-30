import 'package:tasks/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  /// 현재 날씨 조회
  Future<WeatherEntity> getCurrentWeather({
    required double latitude, // 위도
    required double longitude, // 경도
  });
}
