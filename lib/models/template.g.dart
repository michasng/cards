// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Template _$TemplateFromJson(Map<String, dynamic> json) => Template(
      id: json['id'] as String?,
      template: json['template'] as String,
      numOccurrence: json['numOccurrence'] as int,
      color: ColorData.fromJson(json['color'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TemplateToJson(Template instance) => <String, dynamic>{
      'id': instance.id,
      'template': instance.template,
      'numOccurrence': instance.numOccurrence,
      'color': instance.color.toJson(),
    };
