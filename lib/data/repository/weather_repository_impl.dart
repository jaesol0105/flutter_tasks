import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasks/data/model/weather_entity.dart';
import 'package:tasks/data/repository/weather_repository.dart';

part 'weather_repository_impl.g.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({required this.client});

  final http.Client client;
  static const String _baseUrl = 'https://api.open-meteo.com/v1/forecast';

  @override
  Future<WeatherEntity> getCurrentWeather({required double latitude, required double longitude}) async {
    final uri = Uri.parse(
      '$_baseUrl?latitude=$latitude&longitude=$longitude'
      '&timezone=auto&current=temperature_2m,is_day,wind_speed_10m,weather_code',
    );

    try {
      final res = await client.get(uri);
      if (res.statusCode != 200) {
        throw Exception('WeatherRepositoryImpl ${res.statusCode}');
      }
      final json = jsonDecode(res.body) as Map<String, dynamic>;
      final current = json['current'] as Map<String, dynamic>;
      return WeatherEntity.fromJson(current);
    } on SocketException catch (e) {
      throw Exception('WeatherRepositoryImpl $e');
    }
  }
}

/// Repository Provider (client 계속 닫혀서 keepAlive)
@Riverpod(keepAlive: true)
WeatherRepository weatherRepository(Ref ref) {
  final client = http.Client();
  ref.onDispose(client.close); // 앱 종료시 정리
  return WeatherRepositoryImpl(client: client);
}
