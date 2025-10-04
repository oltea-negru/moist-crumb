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
    final screenHeight = MediaQuery.of(context).size.height;
    
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
          _buildCityName(theme),
          _buildWeatherIcon(),
          _buildTemperature(screenHeight),
          _buildConditionBadge(),
        ],
      ),
    );
  }

  Widget _buildCityName(ThemeData theme) {
    return Text(
      weatherData.city,
      style: theme.textTheme.headlineLarge?.copyWith(
        color: theme.colorScheme.onSurface,
      ),
    );
  }

  Widget _buildWeatherIcon() {
    if (weatherData.iconUrl == null) {
      return const SizedBox.shrink();
    }

    return WeatherIcon(iconUrl: weatherData.iconUrl!, height: height * 0.3);
  }

  Widget _buildTemperature(double screenHeight) {
    return TemperatureDisplay(
      temperature: weatherData.temperature,
      fontSize: screenHeight * 0.1,
    );
  }

  Widget _buildConditionBadge() {
    return ConditionBadge(condition: weatherData.condition);
  }
}
