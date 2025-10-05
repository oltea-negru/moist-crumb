import 'package:flutter/material.dart';
import 'package:moist_crumb/features/weather_forecast/models/weather_data.dart';
import 'package:moist_crumb/utils/responsive.dart';
import 'weather_icon.dart';
import 'temperature_display.dart';
import 'condition_badge.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moist_crumb/features/weather_forecast/cubits/cubit/home_page_cubit.dart';
import 'package:moist_crumb/features/weather_forecast/views/widgets/forecast_card/forecast_error_card.dart';
import 'package:moist_crumb/features/weather_forecast/views/widgets/forecast_card/forecast_loading_card.dart';

class ForecastCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: (city) =>
              ForecastLoadingSkeleton(width: screenWidth, height: screenHeight),
          error: (city, error, previousData) =>
              ForecastErrorCard(city: city, error: error),
          loaded: (city, weatherData) => ForecastCardLoadedData(
            weatherData: weatherData,
            width: screenWidth,
            height: screenHeight,
          ),
        );
      },
    );
  }
}

class ForecastCardLoadedData extends StatelessWidget {
  final WeatherData weatherData;
  final double width;
  final double height;

  const ForecastCardLoadedData({
    super.key,
    required this.weatherData,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: Responsive.insetsAll(context, 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            theme.colorScheme.surfaceContainer,
            theme.colorScheme.surfaceContainer.withValues(alpha: 0.0),
          ],
        ),
        borderRadius: BorderRadius.circular(Responsive.radius(context, 18)),
      ),
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: Responsive.scale(context, 16),
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
