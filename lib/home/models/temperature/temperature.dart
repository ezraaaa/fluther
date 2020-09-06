import 'package:json_annotation/json_annotation.dart';
part 'temperature.g.dart';

@JsonSerializable()
class Temperature {
  Temperature({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);
  Map<String, dynamic> toJson() => _$TemperatureToJson(this);

  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;
}
