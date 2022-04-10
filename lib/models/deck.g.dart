// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Deck _$DeckFromJson(Map<String, dynamic> json) => Deck(
      id: json['id'] as String?,
      name: json['name'] as String,
      templateIds: (json['templateIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DeckToJson(Deck instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'templateIds': instance.templateIds,
    };
