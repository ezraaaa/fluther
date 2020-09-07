import 'package:json_annotation/json_annotation.dart';

part 'minutely.g.dart';

@JsonSerializable()
class Minutely {
  Minutely({this.dt, this.precipitation});

  factory Minutely.fromJson(Map<String, dynamic> json) =>
      _$MinutelyFromJson(json);
  Map<String, dynamic> toJson() => _$MinutelyToJson(this);

  int dt;
  double precipitation;
}
