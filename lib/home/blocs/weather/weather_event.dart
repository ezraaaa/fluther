part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherRequested extends WeatherEvent {
  const WeatherRequested({@required this.latitude, @required this.longitude})
      : assert(latitude != null, longitude != null);
  final double latitude;
  final double longitude;

  @override
  List<Object> get props => <double>[latitude, longitude];
}

class WeatherRefreshRequested extends WeatherEvent {
  const WeatherRefreshRequested(
      {@required this.latitude, @required this.longitude})
      : assert(latitude != null, longitude != null);
  final double latitude;
  final double longitude;

  @override
  List<Object> get props => <double>[latitude, longitude];
}
