part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherRequested extends WeatherEvent {
  const WeatherRequested({this.latitude, this.longitude, this.cityName});
  final double latitude;
  final double longitude;
  final String cityName;

  @override
  List<Object> get props => <dynamic>[latitude, longitude, cityName];
}

class WeatherRefreshRequested extends WeatherEvent {
  const WeatherRefreshRequested({this.latitude, this.longitude, this.cityName});
  final double latitude;
  final double longitude;
  final String cityName;

  @override
  List<Object> get props => <dynamic>[latitude, longitude, cityName];
}
