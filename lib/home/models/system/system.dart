import 'package:json_annotation/json_annotation.dart';
part 'system.g.dart';

@JsonSerializable()
class System {
  System({
    this.type,
    this.id,
    this.message,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory System.fromJson(Map<String, dynamic> json) => _$SystemFromJson(json);
  Map<String, dynamic> toJson() => _$SystemToJson(this);

  int type;
  int id;
  double message;
  String country;
  int sunrise;
  int sunset;
}
