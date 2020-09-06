import 'package:json_annotation/json_annotation.dart';
part 'clouds.g.dart';

@JsonSerializable()
class Clouds {
  Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
  Map<String, dynamic> toJson() => _$CloudsToJson(this);

  int all;
}
