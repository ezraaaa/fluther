// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) {
  return Coordinates(
    longitude: (json['lon'] as num)?.toDouble(),
    latitude: (json['lat'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'lon': instance.longitude,
      'lat': instance.latitude,
    };
