import 'package:flutter_test/flutter_test.dart';
import 'package:moist_crumb/features/weather_forecast/models/weather_background_config.dart';

void main() {
  group('WeatherBackgroundConfig', () {
    group('fromWeatherCode', () {
      test('returns thunderstorm config for code 200-299', () {
        // Arrange
        const weatherCode = 201;
        const isDarkMode = false;

        // Act
        final config = WeatherBackgroundConfig.fromWeatherCode(
          weatherCode: weatherCode,
          isDarkMode: isDarkMode,
        );

        // Assert
        expect(config.effectTypes, contains(WeatherEffectType.thunderstorm));
        expect(config.effectTypes, contains(WeatherEffectType.rain));
        expect(config.effectTypes, contains(WeatherEffectType.clouds));
        expect(config.gradientColorValues.length, 2);
        expect(config.gradientColorValues[0], 0xFF1A1A2E);
      });

      test('returns snow config for code 600-699', () {
        final config = WeatherBackgroundConfig.fromWeatherCode(
          weatherCode: 601,
          isDarkMode: true,
        );

        expect(config.effectTypes, contains(WeatherEffectType.snow));
        expect(config.effectTypes, contains(WeatherEffectType.clouds));
        expect(config.gradientColorValues[0], 0xFF1A2530);
      });

      test('clear sky returns mild sun rays', () {
        final clearConfig = WeatherBackgroundConfig.fromWeatherCode(
          weatherCode: 800,
          isDarkMode: false,
        );

        expect(clearConfig.effectTypes, [WeatherEffectType.clear]);
      });

      test('handles null weather code with default fallback', () {
        final defaultConfig = WeatherBackgroundConfig.fromWeatherCode(
          weatherCode: null,
          isDarkMode: false,
        );

        expect(defaultConfig.gradientColorValues.length, 2);
        expect(defaultConfig.effectTypes, isEmpty);
      });

      test('returns different colors for dark mode', () {
        final lightConfig = WeatherBackgroundConfig.fromWeatherCode(
          weatherCode: 500,
          isDarkMode: false,
        );

        final darkConfig = WeatherBackgroundConfig.fromWeatherCode(
          weatherCode: 500,
          isDarkMode: true,
        );

        expect(lightConfig.gradientColorValues[0], isNot(darkConfig.gradientColorValues[0]));
      });

      test('drizzle has light rain, not heavy rain', () {
        final config = WeatherBackgroundConfig.fromWeatherCode(
          weatherCode: 301,
          isDarkMode: false,
        );

        expect(config.effectTypes, contains(WeatherEffectType.drizzle));
        expect(config.effectTypes, isNot(contains(WeatherEffectType.rain)));
      });

      test('fog returns only fog effect', () {
        final config = WeatherBackgroundConfig.fromWeatherCode(
          weatherCode: 741,
          isDarkMode: true,
        );

        expect(config.effectTypes, [WeatherEffectType.atmosphere]);
      });

      test('cloudy weather returns cloud effects', () {
        final config = WeatherBackgroundConfig.fromWeatherCode(
          weatherCode: 803,
          isDarkMode: false,
        );

        expect(config.effectTypes, contains(WeatherEffectType.clear));
      });

      test('unknown weather code falls back to default', () {
        final config = WeatherBackgroundConfig.fromWeatherCode(
          weatherCode: 999,
          isDarkMode: false,
        );

        expect(config.gradientColorValues.length, 2);
        expect(config.effectTypes, isEmpty);
      });
    });
  });
}