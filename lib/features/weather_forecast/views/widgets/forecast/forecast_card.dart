import 'package:flutter/material.dart';
import 'package:moist_crumb/features/weather_forecast/models/weather_data.dart';
import 'weather_icon.dart';
import 'temperature_display.dart';
import 'condition_badge.dart';

class ForecastCard extends StatelessWidget {
  final WeatherData weatherData;
  final double width;
  final double height;

  const ForecastCard({
    super.key,
    required this.weatherData,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            theme.colorScheme.surfaceContainer,
            theme.colorScheme.surfaceContainer.withValues(alpha: 0.0),
          ],
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 16,
        children: [
          CityNameDisplay(city: weatherData.city),
          ForecastWeatherIcon(
            iconUrl: weatherData.iconUrl,
            height: height * 0.3,
          ),
          ForecastTemperature(
            temperature: weatherData.temperature,
            height: height,
          ),
          ConditionBadge(condition: weatherData.condition),
        ],
      ),
    );
  }
}

class CityNameDisplay extends StatelessWidget {
  final String city;

  const CityNameDisplay({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      city,
      style: theme.textTheme.headlineLarge?.copyWith(
        color: theme.colorScheme.onSurface,
      ),
    );
  }
}

class ForecastWeatherIcon extends StatelessWidget {
  final String? iconUrl;
  final double height;

  const ForecastWeatherIcon({
    super.key,
    required this.iconUrl,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    if (iconUrl == null) {
      return const SizedBox.shrink();
    }

    return WeatherIcon(iconUrl: iconUrl!, height: height);
  }
}

class ForecastTemperature extends StatelessWidget {
  final int temperature;
  final double height;

  const ForecastTemperature({
    super.key,
    required this.temperature,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return TemperatureDisplay(
      temperature: temperature,
      fontSize: screenHeight * 0.1,
    );
  }
}
