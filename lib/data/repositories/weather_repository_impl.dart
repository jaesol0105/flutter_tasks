import 'package:tasks/data/data_sources/api_weather_data_source.dart';
import 'package:tasks/domain/entities/weather_entity.dart';
import 'package:tasks/domain/repositories/weather_repository.dart';
import 'package:tasks/data/mappers/weather_mapper.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  /// WeatherRepository 구현체
  WeatherRepositoryImpl({required this.dataSource});

  final ApiWeatherDataSource dataSource;

  @override
  Future<WeatherEntity> getCurrentWeather({
    required double latitude,
    required double longitude,
  }) async {
    final dto = await dataSource.getCurrentWeather(latitude: latitude, longitude: longitude);
    return WeatherMapper.toEntity(dto);
  }
}
