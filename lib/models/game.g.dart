// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      id: json['id'] as String?,
      deckId: json['deckId'] as String,
      gameCardIds: (json['gameCardIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      userIds:
          (json['userIds'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'id': instance.id,
      'deckId': instance.deckId,
      'gameCardIds': instance.gameCardIds,
      'userIds': instance.userIds,
    };
