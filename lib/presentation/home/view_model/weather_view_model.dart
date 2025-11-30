import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasks/data/model/weather_entity.dart';
import 'package:tasks/data/repositories/weather_repository_impl.dart';

part 'weather_view_model.g.dart';

@riverpod
class WeatherViewModel extends _$WeatherViewModel {
  @override
  Future<WeatherEntity> build() async {
    return load();
  }

  /// 날씨 정보 불러오기
  Future<WeatherEntity> load() async {
    // 위치 활성화 여부 체크
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('weather_vm:load:service_disable');
    }

    // 권한 체크 및 요청
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('weather_vm:load:permission_denied');
      }
    }

    // 설정에서 권한 허용 필요
    if (permission == LocationPermission.deniedForever) {
      throw Exception('weather_vm:load:please_setting_permission');
    }

    // 현재 위치 가져오기
    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );

    // 위치 기반 날씨 정보 반환
    final repo = ref.read(weatherRepositoryProvider);
    final weather = await repo.getCurrentWeather(
      latitude: position.latitude,
      longitude: position.longitude,
    );
    return weather;
  }
}
