import 'package:json_annotation/json_annotation.dart';

part 'coordinates.g.dart';

@JsonSerializable()
class Coordinates {
  Coordinates({this.longitude, this.latitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);

  @JsonKey(name: 'lon')
  double longitude;
  @JsonKey(name: 'lat')
  double latitude;
}
