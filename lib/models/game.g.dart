// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      json['id'] as int,
      deckId: json['deckId'] as int,
      gameCardIds:
          (json['gameCardIds'] as List<dynamic>).map((e) => e as int).toList(),
      userIds: (json['userIds'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'id': instance.id,
      'deckId': instance.deckId,
      'gameCardIds': instance.gameCardIds,
      'userIds': instance.userIds,
    };
