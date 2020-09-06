import 'package:json_annotation/json_annotation.dart';

part 'rain.g.dart';

@JsonSerializable()
class Rain {
  Rain({this.oneHour});

  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);
  Map<String, dynamic> toJson() => _$RainToJson(this);

  @JsonKey(name: '1hr')
  double oneHour;
}
