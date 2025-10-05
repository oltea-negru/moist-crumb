import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:moist_crumb/services/api/weather_api.dart';
import 'package:moist_crumb/services/api/errors.dart';
import 'package:moist_crumb/features/weather_forecast/models/weather_data.dart';

class MockHttpClient extends Mock implements http.Client {}

class FakeUri extends Fake implements Uri {}

void main() {
  late MockHttpClient mockHttpClient;
  late WeatherApi weatherApi;

  const tBaseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  const tApiKey = 'test_api_key_12345';
  const tCity = 'London';

  setUpAll(() {
    registerFallbackValue(FakeUri());
  });

  setUp(() {
    mockHttpClient = MockHttpClient();
    weatherApi = WeatherApi(
      client: mockHttpClient,
      baseUrl: tBaseUrl,
      apiKey: tApiKey,
    );
  });

  tearDown(() {
    weatherApi.dispose();
  });

  group('WeatherApi.getWeather', () {
    final tUri = Uri.parse('$tBaseUrl?q=$tCity&appid=$tApiKey&units=metric');

    final tWeatherJson = {
      'name': 'London',
      'sys': {'country': 'GB'},
      'main': {
        'temp': 20.5,
      },
      'weather': [
        {
          'main': 'Clear',
          'description': 'clear sky',
          'icon': '01d',
          'id': 800,
        }
      ],
    };

    test('should make GET request to correct URL', () async {
      when(() => mockHttpClient.get(any()))
          .thenAnswer((_) async => http.Response(jsonEncode(tWeatherJson), 200));

      await weatherApi.getWeather(tCity);

      verify(() => mockHttpClient.get(tUri)).called(1);
    });

    test('should return WeatherData when response is 200', () async {
      when(() => mockHttpClient.get(any()))
          .thenAnswer((_) async => http.Response(jsonEncode(tWeatherJson), 200));

      final result = await weatherApi.getWeather(tCity);

      expect(result, isA<WeatherData>());
      expect(result.city, 'London');
      expect(result.temperature, 21);
    });

    test('should throw WeatherDataFormatException when JSON is invalid', () async {
      when(() => mockHttpClient.get(any()))
          .thenAnswer((_) async => http.Response('invalid json', 200));

      expect(
        () => weatherApi.getWeather(tCity),
        throwsA(isA<WeatherDataFormatException>()),
      );
    });

    test('should throw CityNotFoundException when status is 404', () async {
      when(() => mockHttpClient.get(any())).thenAnswer(
        (_) async => http.Response(
          jsonEncode({'message': 'city not found'}),
          404,
        ),
      );

      expect(
        () => weatherApi.getWeather(tCity),
        throwsA(isA<CityNotFoundException>()),
      );
    });

    test('should throw InvalidApiKeyException when status is 401', () async {
      when(() => mockHttpClient.get(any())).thenAnswer(
        (_) async => http.Response(
          jsonEncode({'message': 'Invalid API key'}),
          401,
        ),
      );

      expect(
        () => weatherApi.getWeather(tCity),
        throwsA(isA<InvalidApiKeyException>()),
      );
    });

    test('should throw InvalidApiKeyException when status is 400', () async {
      when(() => mockHttpClient.get(any())).thenAnswer(
        (_) async => http.Response(
          jsonEncode({'message': 'Bad request'}),
          400,
        ),
      );

      expect(
        () => weatherApi.getWeather(tCity),
        throwsA(isA<InvalidApiKeyException>()),
      );
    });

    test('should throw RateLimitExceededException when status is 429', () async {
      when(() => mockHttpClient.get(any())).thenAnswer(
        (_) async => http.Response(
          jsonEncode({'message': 'Rate limit exceeded'}),
          429,
        ),
      );

      expect(
        () => weatherApi.getWeather(tCity),
        throwsA(isA<RateLimitExceededException>()),
      );
    });

    test('should throw OpenWeatherAPIException for 500 status', () async {
      when(() => mockHttpClient.get(any())).thenAnswer(
        (_) async => http.Response(
          jsonEncode({'message': 'Internal server error'}),
          500,
        ),
      );

      expect(
        () => weatherApi.getWeather(tCity),
        throwsA(isA<OpenWeatherAPIException>()),
      );
    });

    test('should throw OpenWeatherAPIException for 503 status', () async {
      when(() => mockHttpClient.get(any())).thenAnswer(
        (_) async => http.Response(
          jsonEncode({'message': 'Service unavailable'}),
          503,
        ),
      );

      expect(
        () => weatherApi.getWeather(tCity),
        throwsA(isA<OpenWeatherAPIException>()),
      );
    });

    test('should include error message in exception', () async {
      const errorMessage =
          'City not found. Please check your spelling and try again.';
      when(() => mockHttpClient.get(any())).thenAnswer(
        (_) async => http.Response(errorMessage, 404),
      );

      try {
        await weatherApi.getWeather(tCity);
        fail('Should have thrown CityNotFoundException');
      } catch (e) {
        expect(e, isA<CityNotFoundException>());
        expect((e as CityNotFoundException).toString(), contains(errorMessage));
      }
    });

    test('should handle empty city name', () async {
      when(() => mockHttpClient.get(any()))
          .thenAnswer((_) async => http.Response(jsonEncode(tWeatherJson), 200));

      await weatherApi.getWeather('');

      final capturedUri = verify(() => mockHttpClient.get(captureAny())).captured.single as Uri;
      expect(capturedUri.queryParameters['q'], '');
    });

    test('should handle city name with spaces', () async {
      const cityWithSpaces = 'New York';
      when(() => mockHttpClient.get(any()))
          .thenAnswer((_) async => http.Response(jsonEncode(tWeatherJson), 200));

      await weatherApi.getWeather(cityWithSpaces);

      final capturedUri = verify(() => mockHttpClient.get(captureAny())).captured.single as Uri;
      expect(capturedUri.queryParameters['q'], cityWithSpaces);
    });
  });

  group('WeatherApi configuration', () {
    test('should use provided baseUrl', () {
      const customBaseUrl = 'https://custom.api.com';
      final api = WeatherApi(
        client: mockHttpClient,
        baseUrl: customBaseUrl,
        apiKey: tApiKey,
      );

      expect(api.baseUrl, customBaseUrl);
    });

    test('should use provided apiKey', () {
      const customApiKey = 'custom_key';
      final api = WeatherApi(
        client: mockHttpClient,
        baseUrl: tBaseUrl,
        apiKey: customApiKey,
      );

      expect(api.apiKey, customApiKey);
    });
  });

  group('WeatherApi disposal', () {
    test('should close http client when disposed', () {
      when(() => mockHttpClient.close()).thenAnswer((_) {});

      weatherApi.dispose();

      verify(() => mockHttpClient.close()).called(1);
    });
  });
}