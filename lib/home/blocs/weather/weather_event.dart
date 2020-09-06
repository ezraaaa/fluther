part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherRequested extends WeatherEvent {
  const WeatherRequested({@required this.city}) : assert(city != null);
  final String city;

  @override
  List<Object> get props => <String>[city];
}

class WeatherRefreshRequested extends WeatherEvent {
  const WeatherRefreshRequested({@required this.city}) : assert(city != null);
  final String city;

  @override
  List<Object> get props => <String>[city];
}
