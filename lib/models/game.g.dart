// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      id: json['id'] as String?,
      deck: Deck.fromJson(json['deck'] as Map<String, dynamic>),
      gameCards: (json['gameCards'] as List<dynamic>)
          .map((e) => GameCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'id': instance.id,
      'deck': instance.deck,
      'gameCards': instance.gameCards,
      'users': instance.users,
    };
