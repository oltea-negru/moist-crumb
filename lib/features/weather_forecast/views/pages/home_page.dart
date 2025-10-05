import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moist_crumb/features/weather_forecast/cubits/cubit/home_page_cubit.dart';
import 'package:moist_crumb/features/weather_forecast/views/widgets/weather_body/weather_body.dart';
import 'package:moist_crumb/features/theme/widgets/theme_toggle_button.dart';
import 'package:moist_crumb/features/weather_forecast/views/widgets/weather_effects/weather_backgrond.dart'; // Import the weather background file

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
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: const Text("Moist Crumb"),
                  actions: const [ThemeToggleButton()],
                ),
                const Expanded(child: WeatherBody()),
              ],
            ),
          ),
        );
      },
    );
  }
}
