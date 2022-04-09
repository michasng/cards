import 'package:cards/models/deck.dart';
import 'package:cards/models/game_card.dart';
import 'package:cards/models/model.dart';
import 'package:cards/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game.g.dart';

@JsonSerializable()
class Game extends Model {
  Deck deck;
  List<GameCard> gameCards;
  List<User> users;

  Game({
    String? id,
    required this.deck,
    required this.gameCards,
    required this.users,
  }) : super(id);

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GameToJson(this);
}
