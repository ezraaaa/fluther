import 'package:fluther/home/models/rain/rain.dart';
import 'package:fluther/home/models/weather/weather.dart';
import 'package:json_annotation/json_annotation.dart';
part 'hourly.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Hourly {
  Hourly({
    this.dt,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.weather,
    this.pop,
    this.rain,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);
  Map<String, dynamic> toJson() => _$HourlyToJson(this);

  int dt;
  double temp;
  double feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  int clouds;
  int visibility;
  double windSpeed;
  int windDeg;
  List<Weather> weather;
  double pop;
  Rain rain;
}
