// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherDataImpl _$$WeatherDataImplFromJson(Map<String, dynamic> json) =>
    _$WeatherDataImpl(
      city: json['city'] as String,
      temperature: json['temperature'] as String,
      conditionCode: json['conditionCode'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$WeatherDataImplToJson(_$WeatherDataImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'temperature': instance.temperature,
      'conditionCode': instance.conditionCode,
      'icon': instance.icon,
    };
