import 'package:fluther/home/models/clouds/clouds.dart';
import 'package:fluther/home/models/coordinates/coordinates.dart';
import 'package:fluther/home/models/system/system.dart';
import 'package:fluther/home/models/temperature/temperature.dart';
import 'package:fluther/home/models/weather/weather.dart';
import 'package:fluther/home/models/wind/wind.dart';
import 'package:json_annotation/json_annotation.dart';
part 'location_weather.g.dart';

@JsonSerializable()
class LocationWeather {
  LocationWeather({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory LocationWeather.fromJson(Map<String, dynamic> json) =>
      _$LocationWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$LocationWeatherToJson(this);

  Coordinates coord;
  List<Weather> weather;
  String base;
  Temperature main;
  Wind wind;
  Clouds clouds;
  int dt;
  System sys;
  int timezone;
  int id;
  String name;
  int cod;
}
