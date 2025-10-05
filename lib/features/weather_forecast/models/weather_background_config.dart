/// Enum for weather effects to match openweathermap condition codes https://openweathermap.org/weather-conditions#Weather-Condition-Codes-2
enum WeatherEffectType {
  thunderstorm,
  drizzle,
  rain,
  snow,
  atmosphere,
  clear,
  clouds,
}

class WeatherBackgroundConfig {
  final List<int> gradientColorValues;
  final List<WeatherEffectType> effectTypes;

  const WeatherBackgroundConfig({
    required this.gradientColorValues,
    required this.effectTypes,
  });

  static WeatherBackgroundConfig fromWeatherCode({
    required int? weatherCode,
    required bool isDarkMode,
  }) {
    if (weatherCode == null) {
      return WeatherBackgroundConfig(
        gradientColorValues: isDarkMode
            ? [0xFF2C3539, 0xFF37474F]
            : [0xFF78909C, 0xFFB0BEC5],
        effectTypes: [WeatherEffectType.atmosphere],
      );
    }

    switch (weatherCode) {
      case >= 200 && <= 299:
        return WeatherBackgroundConfig(
          gradientColorValues: isDarkMode
              ? [0xFF000000, 0xFF0D0D1A]
              : [0xFF1A1A2E, 0xFF16213E],
          effectTypes: [WeatherEffectType.thunderstorm],
        );

      case >= 300 && <= 399: // Drizzle
        return WeatherBackgroundConfig(
          gradientColorValues: isDarkMode
              ? [0xFF1C262B, 0xFF263238]
              : [0xFF607D8B, 0xFF90A4AE],
          effectTypes: [WeatherEffectType.drizzle],
        );

      case >= 500 && <= 599: // Rain
        return WeatherBackgroundConfig(
          gradientColorValues: isDarkMode
              ? [0xFF0D1214, 0xFF1C262B]
              : [0xFF37474F, 0xFF546E7A],
          effectTypes: [WeatherEffectType.rain],
        );

      case >= 600 && <= 699: // Snow
        return WeatherBackgroundConfig(
          gradientColorValues: isDarkMode
              ? [0xFF1A2530, 0xFF2C3E50]
              : [0xFFE3F2FD, 0xFFBBDEFB],
          effectTypes: [WeatherEffectType.snow],
        );

      case >= 700 && <= 799: // Atmosphere
        return WeatherBackgroundConfig(
          gradientColorValues: isDarkMode
              ? [0xFF2C3539, 0xFF37474F]
              : [0xFF78909C, 0xFFB0BEC5],
          effectTypes: [WeatherEffectType.atmosphere],
        );

      case 800: // Clear Sky
        return WeatherBackgroundConfig(
          gradientColorValues: isDarkMode
              ? [0xFFFFD54F, 0xFFFBC02D]
              : [0xFFFFF3E0, 0xFFFFE0B2],
          effectTypes: [WeatherEffectType.clear],
        );
        ;

      case >= 801 && <= 804: // Clouds
        return WeatherBackgroundConfig(
          gradientColorValues: isDarkMode
              ? [0xFF263238, 0xFF37474F]
              : [0xFF90A4AE, 0xFFCFD8DC],
          effectTypes: [WeatherEffectType.clouds],
        );

      default:
        return WeatherBackgroundConfig(
          gradientColorValues: isDarkMode
              ? [0xFF2C3539, 0xFF37474F]
              : [0xFF78909C, 0xFFB0BEC5],
          effectTypes: [WeatherEffectType.atmosphere],
        );
    }
  }
}
