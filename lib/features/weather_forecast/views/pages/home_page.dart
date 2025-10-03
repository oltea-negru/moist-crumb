import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moist_crumb/features/weather_forecast/cubits/cubit/home_page_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Moist Crumb")),
      body: BlocProvider(
        create: (context) => HomePageCubit(),
        child: BlocBuilder<HomePageCubit, HomePageState>(
          builder: (context, state) {
            return Column(
              children: [
                SearchBar(
                  controller: controller,
                  onChanged: (value) => setState(() {
                    controller.text = value;
                  }),
                  onSubmitted: (value) =>
                      context.read<HomePageCubit>().getWeather(controller.text),
                ),
                BlocBuilder<HomePageCubit, HomePageState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox.shrink(),
                      loading: (city) =>
                          const Center(child: CircularProgressIndicator()),
                      loaded: (city, weatherData) => Text(weatherData.city),
                      error: (city, message, previousData) => Text(message),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
