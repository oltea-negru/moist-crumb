import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moist_crumb/features/weather_forecast/cubits/cubit/home_page_cubit.dart';
import 'package:moist_crumb/features/weather_forecast/views/widgets/location_search_bar/location_search_bar.dart';
import 'package:moist_crumb/features/weather_forecast/views/widgets/forecast_card/forecast_card.dart';
import 'package:moist_crumb/utils/responsive.dart';


class WeatherBody extends StatefulWidget {
  const WeatherBody({super.key});

  @override
  State<WeatherBody> createState() => _WeatherBodyState();
}

class _WeatherBodyState extends State<WeatherBody> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final content = Column(
      spacing: Responsive.scale(context, 16),
      children: [
        LocationSearchBar(
          controller: _controller,
          onSubmitted: (value) {
            context.read<HomePageCubit>().getWeather(value);
            _controller.clear();
          },
        ),
        ForecastCard(),
      ],
    );

    return SafeArea(
      minimum: Responsive.insetsAll(context, 16),
      child: SingleChildScrollView(child: content),
    );
  }
}

