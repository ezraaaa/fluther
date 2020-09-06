part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => null;
}

class WeatherInitial extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  const WeatherLoadSuccess({@required this.weather}) : assert(weather != null);
  final LocationWeather weather;

  @override
  List<Object> get props => <LocationWeather>[weather];
}

class WeatherLoadFailure extends WeatherState {}
