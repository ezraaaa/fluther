// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minutely.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Minutely _$MinutelyFromJson(Map<String, dynamic> json) {
  return Minutely(
    dt: json['dt'] as int,
    precipitation: (json['precipitation'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MinutelyToJson(Minutely instance) => <String, dynamic>{
      'dt': instance.dt,
      'precipitation': instance.precipitation,
    };
