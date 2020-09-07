part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => null;
}

class WeatherInitial extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  const WeatherLoadSuccess({@required this.locationWeather})
      : assert(locationWeather != null);
  final LocationWeather locationWeather;

  @override
  List<Object> get props => <LocationWeather>[locationWeather];
}

class WeatherLoadFailure extends WeatherState {}
