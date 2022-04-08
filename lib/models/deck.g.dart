// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Deck _$DeckFromJson(Map<String, dynamic> json) => Deck(
      json['id'] as int,
      name: json['name'] as String,
      templateIds:
          (json['templateIds'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$DeckToJson(Deck instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'templateIds': instance.templateIds,
    };
