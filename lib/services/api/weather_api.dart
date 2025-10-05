// lib/services/api/weather_api.dart (REFACTORED)
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:moist_crumb/services/api/errors.dart';
import 'package:http/http.dart' as http;
import 'package:moist_crumb/features/weather_forecast/models/weather_data.dart';

class WeatherApi {
  final http.Client client;
  final String baseUrl;
  final String apiKey;

  WeatherApi({http.Client? client, String? baseUrl, String? apiKey})
    : client = client ?? http.Client(),
      baseUrl = baseUrl ?? dotenv.get('OPEN_WEATHER_API_BASE_URL'),
      apiKey = apiKey ?? dotenv.get('OPEN_WEATHER_API_KEY') {
    // Validate API key is loaded
    if (this.apiKey.isEmpty) {
      throw InvalidApiKeyException(
        'API key is empty or not loaded from environment',
      );
    }
    if (this.baseUrl.isEmpty) {
      throw WeatherAPIException(
        'Base URL is empty or not loaded from environment',
      );
    }
  }


  Future<WeatherData> getWeather(String city) async {
    final uri = Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric');
    try {
      final response = await client
          .get(uri)
          .timeout(const Duration(seconds: 10));

      switch (response.statusCode) {
        case 200:
          try {
            return WeatherData.fromOpenWeatherJson(jsonDecode(response.body));
          } catch (e) {
            throw WeatherDataFormatException(
              'Failed to parse weather data: $e',
            );
          }
        case 400:
          throw InvalidApiKeyException(response.body);
        case 401:
          throw InvalidApiKeyException(response.body);
        case 404:
          throw CityNotFoundException();
        case 429:
          throw RateLimitExceededException();
        default:
          throw OpenWeatherAPIException();
      }
    } on TimeoutException {
      throw NetworkException();
    } on SocketException {
      throw NetworkException();
    } on http.ClientException {
      throw NetworkException();
    }
  }

  void dispose() {
    client.close();
  }
}
