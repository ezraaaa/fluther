// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Main _$MainFromJson(Map<String, dynamic> json) {
  return Main(
    temp: (json['temp'] as num)?.toDouble(),
    feelsLike: (json['feels_like'] as num)?.toDouble(),
    tempMin: (json['temp_min'] as num)?.toDouble(),
    tempMax: json['temp_max'] as int,
    pressure: json['pressure'] as int,
    humidity: json['humidity'] as int,
  );
}

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
