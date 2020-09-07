import 'package:fluther/home/models/clouds/clouds.dart';
import 'package:fluther/home/models/coordinates/coordinates.dart';
import 'package:fluther/home/models/main/main.dart';
import 'package:fluther/home/models/system/system.dart';
import 'package:fluther/home/models/weather/weather.dart';
import 'package:fluther/home/models/wind/wind.dart';
import 'package:json_annotation/json_annotation.dart';
part 'location_weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LocationWeather {
  LocationWeather(
      {this.coordinates,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dateTime,
      this.system,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  factory LocationWeather.fromJson(Map<String, dynamic> json) =>
      _$LocationWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$LocationWeatherToJson(this);

  @JsonKey(name: 'coord')
  Coordinates coordinates;
  List<Weather> weather;
  String base;
  Main main;
  int visibility;
  Wind wind;
  Clouds clouds;
  @JsonKey(name: 'dt')
  int dateTime;
  @JsonKey(name: 'sys')
  System system;
  int timezone;
  int id;
  String name;
  int cod;
}
