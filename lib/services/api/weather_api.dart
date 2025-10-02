import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:moist_crumb/features/weather_forecast/models/weather_data.dart';

class WeatherApi {
  static String get baseUrl => dotenv.get('OPEN_WEATHER_API_BASE_URL');
  static String get apiKey => dotenv.get('OPEN_WEATHER_API_KEY');

  static Future<WeatherData> getWeather(String city) async {
    final response = await http.get(Uri.parse('$baseUrl?q=$city&appid=$apiKey'));
    print(response.body);
    return WeatherData.fromOpenWeatherJson(jsonDecode(response.body));
  }
} 