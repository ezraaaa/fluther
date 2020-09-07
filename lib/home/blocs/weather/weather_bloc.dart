import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluther/home/models/location_weather/location_weather.dart';
import 'package:fluther/location/bloc/location/location_bloc.dart';
import 'package:fluther/repositories/weather/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({@required this.weatherRepository, @required this.locationBloc})
      : assert(weatherRepository != null, locationBloc != null),
        super(WeatherInitial()) {
    _locationStreamSubscription = locationBloc.listen((LocationState state) {
      if (state is LocationRequestSuccess) {
        add(WeatherRequested(
          latitude: state.position.latitude,
          longitude: state.position.longitude,
        ));
      }
    });
  }

  final WeatherRepository weatherRepository;
  final LocationBloc locationBloc;
  StreamSubscription<LocationState> _locationStreamSubscription;

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
      LocationWeather locationWeather;
      if (event.cityName != null) {
        locationWeather =
            await weatherRepository.fetchCityWeather(event.cityName);
      } else {
        locationWeather = await weatherRepository.fetchUserLocationWeather(
            latitude: event.latitude, longitude: event.longitude);
      }
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
      LocationWeather locationWeather;
      if (event.cityName != null) {
        locationWeather =
            await weatherRepository.fetchCityWeather(event.cityName);
      } else {
        locationWeather = await weatherRepository.fetchUserLocationWeather(
            latitude: event.latitude, longitude: event.longitude);
      }
      yield WeatherLoadSuccess(locationWeather: locationWeather);
    } catch (error) {
      print(error);
      yield WeatherLoadFailure();
    }
  }

  @override
  Future<void> close() {
    _locationStreamSubscription.cancel();
    return super.close();
  }
}
