// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorData _$ColorDataFromJson(Map<String, dynamic> json) => ColorData(
      red: json['red'] as int,
      green: json['green'] as int,
      blue: json['blue'] as int,
      alpha: json['alpha'] as int? ?? 255,
    );

Map<String, dynamic> _$ColorDataToJson(ColorData instance) => <String, dynamic>{
      'red': instance.red,
      'green': instance.green,
      'blue': instance.blue,
      'alpha': instance.alpha,
    };
