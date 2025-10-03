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
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Row(children: [Text("Moist Crumb")]),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.light_mode),
                ),
              ],
            ),
            Expanded(
              child: BlocProvider(
                create: (context) => HomePageCubit(),
                child: BlocBuilder<HomePageCubit, HomePageState>(
                  builder: (context, state) {
                    return SafeArea(
                      minimum: const EdgeInsets.all(16),
                      child: Column(
                        spacing: 16,
                        children: [
                          SearchBar(
                            elevation: WidgetStateProperty.all(0),
                            hintText: 'Search for a city',
                            controller: controller,
                            onSubmitted: (value) {
                              context.read<HomePageCubit>().getWeather(
                                controller.text,
                              );
                              controller.clear();
                            },
                            trailing: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.location_on),
                              ),
                            ],
                          ),
                          BlocBuilder<HomePageCubit, HomePageState>(
                            builder: (context, state) {
                              return state.when(
                                initial: () => const SizedBox.shrink(),
                                loading: (city) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                error: (city, message, previousData) =>
                                    Text(message),
                                loaded: (city, weatherData) => Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(
                                        alpha: 0.5,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withValues(
                                            alpha: 0.8,
                                          ),
                                          blurRadius: 30,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(18),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          237,
                                          241,
                                          250,
                                        ),
                                        width: 1,
                                      ),
                                    ),
                                    width: width,
                                    child: Column(
                                      spacing: 16,
                                      children: [
                                        Text(
                                          weatherData.city,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleLarge,
                                        ),
                                        weatherData.iconUrl != null
                                            ? Image.network(
                                                weatherData.iconUrl!,
                                                width: 80,
                                                height: 80,
                                                fit: BoxFit.cover,
                                                // You can add loading/error builders if you wish
                                              )
                                            : const SizedBox.shrink(),
                                        Text(
                                          weatherData.temperature.toString(),
                                          style: Theme.of(
                                            context,
                                          ).textTheme.headlineLarge,
                                        ),
                                        SizedBox(
                                          width: width * 0.8,
                                          child: const Divider(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
