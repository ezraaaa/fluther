import 'package:json_annotation/json_annotation.dart';
part 'coordinates.g.dart';

@JsonSerializable()
class Coordinates {
  Coordinates({this.lon, this.lat});

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);

  double lon;
  double lat;
}
