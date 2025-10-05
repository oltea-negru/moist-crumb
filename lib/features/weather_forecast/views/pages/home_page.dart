import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moist_crumb/features/weather_forecast/cubits/cubit/home_page_cubit.dart';
import 'package:moist_crumb/features/weather_forecast/views/widgets/weather_body/weather_body.dart';
import 'package:moist_crumb/features/weather_forecast/views/widgets/weather_effects/weather_backgrond.dart'; // Import the weather background file
import 'package:moist_crumb/features/weather_forecast/views/widgets/home_page_app_bar/home_page_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override 
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit(),
      child: const HomePageContent(),
    );
  }
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        int? weatherCode;
        state.whenOrNull(
          loaded: (city, weatherData) {
            weatherCode = weatherData.weatherCode;
          },
          error: (city, error, previousData) {
            if (previousData != null) {
              weatherCode = previousData.weatherCode;
            }
          },
        );

        return Scaffold(
          body: WeatherBackground(
            weatherCode: weatherCode,
            child: const Column(
              children: [
                HomePageAppBar(),
                Expanded(child: WeatherBody()),
              ],
            ),
          ),
        );
      },
    );
  }
}
