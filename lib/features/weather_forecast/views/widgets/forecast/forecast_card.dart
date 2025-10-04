import 'package:flutter/material.dart';
import 'package:moist_crumb/features/weather_forecast/models/weather_data.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.5),
        boxShadow: [
          BoxShadow(color: Colors.white.withValues(alpha: 0.8), blurRadius: 30),
        ],
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color.fromARGB(255, 237, 241, 250),
          width: 1,
        ),
      ),
      width: width,
      child: Column(
        spacing: 16,
        children: [
          Text(weatherData.city, style: Theme.of(context).textTheme.titleLarge),
          weatherData.iconUrl != null
              ? Image.network(
                  weatherData.iconUrl!,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                )
              : const SizedBox.shrink(),
          Text(
            weatherData.temperature.toString(),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(width: width * 0.8, child: const Divider()),
          Text(
            weatherData.condition,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
