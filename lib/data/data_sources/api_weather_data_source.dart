import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tasks/data/dto/weather_dto.dart';

/// Open Meteo Weather API 데이터 소스
abstract class ApiWeatherDataSource {
  /// 위도 경도 기반으로 현재 날씨 가져오기
  Future<WeatherDTO> getCurrentWeather({required double latitude, required double longitude});
}

class ApiWeatherDataSourceImpl implements ApiWeatherDataSource {
  /// ApiWeatherDataSource 구현체 (DIP 준수)
  ApiWeatherDataSourceImpl({required this.client});

  final http.Client client;
  static const String _baseUrl = 'https://api.open-meteo.com/v1/forecast';

  @override
  Future<WeatherDTO> getCurrentWeather({
    required double latitude,
    required double longitude,
  }) async {
    final uri = Uri.parse(
      '$_baseUrl?latitude=$latitude&longitude=$longitude'
      '&timezone=auto&current=temperature_2m,is_day,wind_speed_10m,weather_code',
    );

    try {
      final res = await client.get(uri);
      if (res.statusCode != 200) {
        throw Exception('ApiWeatherDataSourceImpl ${res.statusCode}');
      }
      final json = jsonDecode(res.body) as Map<String, dynamic>;
      final current = json['current'] as Map<String, dynamic>;
      return WeatherDTO.fromJson(current);
    } on SocketException catch (e) {
      throw Exception('ApiWeatherDataSourceImpl $e');
    }
  }
}
