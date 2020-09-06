import 'package:fluther/home/models/current/current.dart';
import 'package:fluther/home/models/hourly/hourly.dart';
import 'package:fluther/home/models/minutely/minutely.dart';
import 'package:json_annotation/json_annotation.dart';
part 'location_weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LocationWeather {
  LocationWeather({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.minutely,
    this.hourly,
  });

  factory LocationWeather.fromJson(Map<String, dynamic> json) =>
      _$LocationWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$LocationWeatherToJson(this);

  double lat;
  double lon;
  String timezone;
  int timezoneOffset;
  Current current;
  List<Minutely> minutely;
  List<Hourly> hourly;
}
