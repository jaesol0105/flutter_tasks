import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasks/data/utils/weather_code_converter.dart';

part 'weather_dto.freezed.dart';
part 'weather_dto.g.dart';

@freezed
abstract class WeatherDTO with _$WeatherDTO {
  const factory WeatherDTO({
    @JsonKey(name: 'temperature_2m') required num temperature,
    @JsonKey(name: 'wind_speed_10m') required num windSpeed,
    @JsonKey(name: 'weather_code', fromJson: WeatherCodeConverter.toDescription)
    required String weatherDescription,
    @JsonKey(name: 'is_day') required num isDay,
    @JsonKey(fromJson: DateTime.parse) required DateTime time,
  }) = _WeatherDTO;

  factory WeatherDTO.fromJson(Map<String, dynamic> json) => _$WeatherDTOFromJson(json);
}
