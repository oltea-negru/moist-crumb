import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moist_crumb/features/weather_forecast/models/weather_data.dart';
import 'package:moist_crumb/services/api/errors.dart';
import 'package:moist_crumb/services/api/weather_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_page_state.dart';
part 'home_page_cubit.freezed.dart';

class HomePageCubit extends Cubit<HomePageState> {
  WeatherApi? _weatherApi;
  static const _lastCityKey = 'last_city';

  HomePageCubit() : super(const HomePageState.initial()) {
    _initialize();
  } 

  Future<void> _initialize() async {
    try {
      _weatherApi = WeatherApi();
      final prefs = await SharedPreferences.getInstance();
      final lastCity = prefs.getString(_lastCityKey);
      if (lastCity != null && lastCity.isNotEmpty) {
        getWeather(lastCity);
      } else {
        emit(const HomePageState.initial());
      }
    } catch (e) {
      emit(HomePageState.error('', WeatherApiInitializationException(), null));
    }
  }

  Future<void> getWeather(String city) async {
    emit(HomePageState.loading(city));

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_lastCityKey, city);  

      final weather = await _weatherApi!.getWeather(city);
      emit(HomePageState.loaded(city, weather));
    } on WeatherAPIException catch (e) {
      emit(HomePageState.error(city, e, null));
    } catch (e) {
      emit(HomePageState.error(city, WeatherAPIException(), null));
    }
  }
}
