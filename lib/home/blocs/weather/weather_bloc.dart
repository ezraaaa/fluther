import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluther/home/models/location_weather/location_weather.dart';
import 'package:fluther/repositories/weather/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null),
        super(WeatherInitial());

  final WeatherRepository weatherRepository;

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is WeatherRequested) {
      yield* _mapWeatherRequestedToState(event);
    } else if (event is WeatherRefreshRequested) {
      yield* _mapWeatherRefreshRequestedToState(event);
    }
  }

  Stream<WeatherState> _mapWeatherRequestedToState(
    WeatherRequested event,
  ) async* {
    yield WeatherLoadInProgress();
    try {
      final LocationWeather locationWeather =
          await weatherRepository.fetchCityWeather(
              latitude: event.latitude, longitude: event.longitude);
      yield WeatherLoadSuccess(locationWeather: locationWeather);
    } catch (error) {
      print(error);
      yield WeatherLoadFailure();
    }
  }

  Stream<WeatherState> _mapWeatherRefreshRequestedToState(
    WeatherRefreshRequested event,
  ) async* {
    try {
      final LocationWeather locationWeather =
          await weatherRepository.fetchCityWeather(
              latitude: event.latitude, longitude: event.longitude);
      yield WeatherLoadSuccess(locationWeather: locationWeather);
    } catch (error) {
      print(error);
      yield WeatherLoadFailure();
    }
  }
}
