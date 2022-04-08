// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

App _$AppFromJson(Map<String, dynamic> json) => App(
      id: json['id'] as String?,
      decks: (json['decks'] as List<dynamic>)
          .map((e) => Deck.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      game: json['game'] == null
          ? null
          : Game.fromJson(json['game'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppToJson(App instance) => <String, dynamic>{
      'id': instance.id,
      'decks': instance.decks,
      'users': instance.users,
      'game': instance.game,
    };
