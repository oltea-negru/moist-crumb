import 'package:flutter/material.dart';
import 'package:moist_crumb/services/api/weather_api.dart';
import 'package:moist_crumb/features/weather_forecast/models/weather_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<WeatherData> _getWeather() async {
    final weather = await WeatherApi().getWeather("London");
    print(weather);
    return weather;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Moist Crumb"),
      ),
      body: Center(
        child: FilledButton(onPressed: ()=>_getWeather(), child:const Text("Get Weather")),
        ),
    );
  }
}