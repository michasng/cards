// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameCard _$GameCardFromJson(Map<String, dynamic> json) => GameCard(
      id: json['id'] as String?,
      template: Template.fromJson(json['template'] as Map<String, dynamic>),
      text: json['text'] as String,
    );

Map<String, dynamic> _$GameCardToJson(GameCard instance) => <String, dynamic>{
      'id': instance.id,
      'template': instance.template,
      'text': instance.text,
    };
