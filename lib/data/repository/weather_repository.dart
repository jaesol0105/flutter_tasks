import 'package:tasks/data/model/weather_entity.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> getCurrentWeather({
    required double latitude, // 위도
    required double longitude, // 경도
  });
}
