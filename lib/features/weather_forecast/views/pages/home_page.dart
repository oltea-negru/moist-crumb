import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moist_crumb/features/weather_forecast/cubits/cubit/home_page_cubit.dart';
import 'package:moist_crumb/features/weather_forecast/views/widgets/search_bar/app_search_bar.dart';
import 'package:moist_crumb/features/weather_forecast/views/widgets/forecast/forecast_card.dart';
import 'package:moist_crumb/features/weather_forecast/views/widgets/forecast/forecast_error_card.dart';
import 'package:moist_crumb/features/theme/widgets/theme_toggle_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 109, 161, 203),
              Color.fromARGB(255, 204, 204, 204),
            ],
          ),
        ),
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(child: _buildWeatherContent(width, height)),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Row(children: [Text("Moist Crumb")]),
      actions: const [ThemeToggleButton()],
    );
  }

  Widget _buildWeatherContent(double width, double height) {
    return BlocProvider<HomePageCubit>(
      create: (context) => HomePageCubit(),
      child: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          return SafeArea(
            minimum: const EdgeInsets.all(16),
            child: Column(
              spacing: 16,
              children: [
                _buildSearchBar(context),
                _buildWeatherDisplay(context, state, width, height),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return AppSearchBar(
      controller: controller,
      onSubmitted: (value) {
        context.read<HomePageCubit>().getWeather(value);
        controller.clear();
      },
    );
  }

  Widget _buildWeatherDisplay(
    BuildContext context,
    HomePageState state,
    double width,
    double height,
  ) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: (city) =>
              const Expanded(child: Center(child: CircularProgressIndicator())),
          error: (city, error, previousData) => Expanded(
            child: ForecastErrorCard(
              error: error,
              city: city,
              onRetry: () => context.read<HomePageCubit>().getWeather(city),
            ),
          ),
          loaded: (city, weatherData) => Expanded(
            child: ForecastCard(
              weatherData: weatherData,
              width: width,
              height: height,
            ),
          ),
        );
      },
    );
  }
}
