// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rain _$RainFromJson(Map<String, dynamic> json) {
  return Rain(
    oneHour: (json['1hr'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$RainToJson(Rain instance) => <String, dynamic>{
      '1hr': instance.oneHour,
    };
