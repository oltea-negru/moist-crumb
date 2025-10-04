import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moist_crumb/features/weather_forecast/cubits/cubit/home_page_cubit.dart';
import 'package:flutter/material.dart' hide SearchBar;

class AppSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;
  const AppSearchBar({super.key, required this.controller, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      elevation: WidgetStateProperty.all(0),
      hintText: 'Search for a city',
      controller: controller,
      onSubmitted: (value) {
        context.read<HomePageCubit>().getWeather(controller.text);
        controller.clear();
      },
      trailing: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.location_on),
        ),
      ],
    );
  }
}