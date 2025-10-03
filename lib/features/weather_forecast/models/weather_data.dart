import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_data.freezed.dart';
part 'weather_data.g.dart';

@freezed
class WeatherData with _$WeatherData {
  const factory WeatherData({
    required String city,
    required int temperature,
    required String conditionCode,
    required String icon,
  }) = _WeatherData;

  factory WeatherData.fromJson(Map<String, dynamic> json) => _$WeatherDataFromJson(json);
  factory WeatherData.fromOpenWeatherJson(Map<String, dynamic> json) => _$WeatherDataFromJson(
    {
      "city": json["name"],
      "temperature": (json["main"]["temp"]).round(), // round the temperature to the nearest integer
      "conditionCode": json["weather"][0]["main"],
      "icon": json["weather"][0]["icon"],
    }
  );

  @override
  Map<String, dynamic> toJson() => _$$WeatherDataImplToJson(this as _$WeatherDataImpl);
}