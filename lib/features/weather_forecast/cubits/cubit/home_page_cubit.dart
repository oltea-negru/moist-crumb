import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moist_crumb/features/weather_forecast/models/weather_data.dart';
import 'package:moist_crumb/services/api/errors.dart';
import 'package:moist_crumb/services/api/weather_api.dart';

part 'home_page_state.dart';
part 'home_page_cubit.freezed.dart';

class HomePageCubit extends Cubit<HomePageState> {
    HomePageCubit() : super(const HomePageState.initial());

  Future<void> getWeather(String city) async {
    emit(HomePageState.loading(city));
    try {
      final weather = await WeatherApi().getWeather(city);
      emit(HomePageState.loaded(city, weather));
    } on WeatherAPIException catch (e) {
      emit(HomePageState.error(city, e.toString(), null));
    }
  }
}
