import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moist_crumb/features/weather_forecast/cubits/cubit/home_page_cubit.dart';
import 'package:moist_crumb/features/weather_forecast/models/weather_data.dart';
import 'package:moist_crumb/services/api/weather_api.dart';

class _MockWeatherApi extends Mock implements WeatherApi {}

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test(
    'initialization with cached city eventually emits loaded with fetched data',
    () async {
      const cachedCity = 'Paris';
      SharedPreferences.setMockInitialValues({
        HomePageCubit.lastCityKey: cachedCity,
      });
      final prefs = await SharedPreferences.getInstance();

      final api = _MockWeatherApi();
      const weather = WeatherData(
        city: cachedCity,
        temperature: 22,
        condition: 'clear sky',
        icon: '01d',
        weatherCode: 800,
      );
      when(() => api.getWeather(cachedCity)).thenAnswer((_) async => weather);

      final cubit = HomePageCubit(weatherApi: api, sharedPreferences: prefs);

      await expectLater(
        cubit.stream,
        emitsThrough(
          isA<HomePageLoadedState>()
              .having((s) => s.city, 'city', cachedCity)
              .having((s) => s.weatherData, 'weatherData', equals(weather)),
        ),
      );
      verify(() => api.getWeather(cachedCity)).called(1);

      await cubit.close();
    },
  );

  test('getWeather caches the city in SharedPreferences', () async {
    final prefs = await SharedPreferences.getInstance();

    final api = _MockWeatherApi();
    const city = 'London';
    const weather = WeatherData(
      city: city,
      temperature: 18,
      condition: 'few clouds',
      icon: '02d',
      weatherCode: 801,
    );
    when(() => api.getWeather(city)).thenAnswer((_) async => weather);

    final cubit = HomePageCubit(weatherApi: api, sharedPreferences: prefs);

    await cubit.getWeather(city);

    expect(prefs.getString(HomePageCubit.lastCityKey), city);
    verify(() => api.getWeather(city)).called(1);

    await cubit.close();
  });

  test(
    'initialization without cached city stays initial and does not call API',
    () async {
      final prefs = await SharedPreferences.getInstance();
      final api = _MockWeatherApi();

      final cubit = HomePageCubit(weatherApi: api, sharedPreferences: prefs);

      await Future<void>.delayed(const Duration(milliseconds: 1));

      expect(cubit.state, isA<HomePageInitialState>());
      verifyNever(() => api.getWeather(any()));

      await cubit.close();
    },
  );

  test('changing city updates cache and emits loaded for new city', () async {
    // start with a cached city
    const initialCity = 'Paris';
    SharedPreferences.setMockInitialValues({
      HomePageCubit.lastCityKey: initialCity,
    });
    final prefs = await SharedPreferences.getInstance();
    final api = _MockWeatherApi();

    const newCity = 'London';
    const parisWeather = WeatherData(
      city: initialCity,
      temperature: 22,
      condition: 'clear sky',
      icon: '01d',
      weatherCode: 800,
    );
    const londonWeather = WeatherData(
      city: newCity,
      temperature: 18,
      condition: 'few clouds',
      icon: '02d',
      weatherCode: 801,
    );

    when(
      () => api.getWeather(initialCity),
    ).thenAnswer((_) async => parisWeather);
    when(() => api.getWeather(newCity)).thenAnswer((_) async => londonWeather);

    final cubit = HomePageCubit(weatherApi: api, sharedPreferences: prefs);

    // wait until first load completes for the cached city
    await expectLater(cubit.stream, emitsThrough(isA<HomePageLoadedState>()));

    // change to a different city
    await cubit.getWeather(newCity);

    // cache updated and state is loaded for new city
    expect(prefs.getString(HomePageCubit.lastCityKey), newCity);
    expect(cubit.state, isA<HomePageLoadedState>());
    final loaded = cubit.state as HomePageLoadedState;
    expect(loaded.city, newCity);
    expect(loaded.weatherData, londonWeather);

    verify(() => api.getWeather(initialCity)).called(1);
    verify(() => api.getWeather(newCity)).called(1);

    await cubit.close();
  });
}
