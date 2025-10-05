import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_data.freezed.dart';
part 'weather_data.g.dart';

@freezed
class WeatherData with _$WeatherData {
  const factory WeatherData({
    required String city,
    required int temperature,
    required String condition,
    required String icon,
    required int weatherCode, 
  }) = _WeatherData;

  const WeatherData._();

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  factory WeatherData.fromOpenWeatherJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson({
        "city": json["name"],
        "temperature": (json["main"]["temp"]).round(),
        "condition": json["weather"][0]["description"],
        "icon": json["weather"][0]["icon"],
        "weatherCode": json["weather"][0]["id"], 
      });

  @override
  Map<String, dynamic> toJson() =>
      _$$WeatherDataImplToJson(this as _$WeatherDataImpl);

  String? get iconUrl => 'https://openweathermap.org/img/wn/$icon@4x.png';
}