// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherDataImpl _$$WeatherDataImplFromJson(Map<String, dynamic> json) =>
    _$WeatherDataImpl(
      city: json['city'] as String,
      temperature: (json['temperature'] as num).toInt(),
      condition: json['condition'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$WeatherDataImplToJson(_$WeatherDataImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'temperature': instance.temperature,
      'condition': instance.condition,
      'icon': instance.icon,
    };
