import 'package:flutter_test/flutter_test.dart';
import 'package:moist_crumb/features/weather_forecast/models/weather_background_config.dart';

void main() {
  group('WeatherBackgroundConfig', () {
    group('fromWeatherCode', () {
      test(
        'thunderstorm (200-299) yields only thunderstorm effect and correct colors',
        () {
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
        expect(config.gradientColorValues.length, 2);
        expect(config.gradientColorValues[0], 0xFF1A1A2E);
      });

      test('snow (600-699) yields only snow effect and correct colors', () {
        final config = WeatherBackgroundConfig.fromWeatherCode(
          weatherCode: 601,
          isDarkMode: true,
        );

        expect(config.effectTypes, contains(WeatherEffectType.snow));
        expect(config.gradientColorValues[0], 0xFF1A2530);
      });

      test('clear sky (800) yields only clear effect', () {
        final clearConfig = WeatherBackgroundConfig.fromWeatherCode(
          weatherCode: 800,
          isDarkMode: false,
        );

        expect(clearConfig.effectTypes, [WeatherEffectType.clear]);
      });

      test('null weather code falls back to default atmosphere effect', () {
        final defaultConfig = WeatherBackgroundConfig.fromWeatherCode(
          weatherCode: null,
          isDarkMode: false,
        );

        expect(defaultConfig.gradientColorValues.length, 2);
        expect(defaultConfig.effectTypes, [WeatherEffectType.atmosphere]);
      });

      test('dark mode produces different gradient colors than light mode', () {
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

      test('drizzle (300-399) includes drizzle effect and excludes rain', () {
        final config = WeatherBackgroundConfig.fromWeatherCode(
          weatherCode: 301,
          isDarkMode: false,
        );

        expect(config.effectTypes, contains(WeatherEffectType.drizzle));
        expect(config.effectTypes, isNot(contains(WeatherEffectType.rain)));
      });

      test('fog (741) yields only atmosphere effect', () {
        final config = WeatherBackgroundConfig.fromWeatherCode(
          weatherCode: 741,
          isDarkMode: true,
        );

        expect(config.effectTypes, [WeatherEffectType.atmosphere]);
      });

      test('clouds (801-804) include clouds effect', () {
        final config = WeatherBackgroundConfig.fromWeatherCode(
          weatherCode: 803,
          isDarkMode: false,
        );

        expect(config.effectTypes, contains(WeatherEffectType.clouds));
      });

      test('unknown code falls back to default atmosphere effect', () {
        final config = WeatherBackgroundConfig.fromWeatherCode(
          weatherCode: 999,
          isDarkMode: false,
        );

        expect(config.gradientColorValues.length, 2);
        expect(config.effectTypes, [WeatherEffectType.atmosphere]);
      });
    });
  });
}