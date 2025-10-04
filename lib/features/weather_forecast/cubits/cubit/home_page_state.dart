part of 'home_page_cubit.dart';

@freezed
sealed class HomePageState with _$HomePageState {
  const factory HomePageState.initial() = HomePageInitialState;
  const factory HomePageState.loading(String city) = HomePageLoadingState;
  const factory HomePageState.loaded(String city, WeatherData weatherData) = HomePageLoadedState;
  const factory HomePageState.error(
    String city,
    WeatherAPIException exception,
    WeatherData? previousData,
  ) = HomePageErrorState;
}

