import 'package:json_annotation/json_annotation.dart';
part 'main.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Main {
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
  Map<String, dynamic> toJson() => _$MainToJson(this);

  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;
}
