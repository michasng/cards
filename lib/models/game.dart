import 'package:cards/models/game_card.dart';
import 'package:cards/models/model.dart';
import 'package:cards/models/user.dart';
import 'package:cards/services/game_card_service.dart';
import 'package:cards/services/user_service.dart';
import 'package:get_it/get_it.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game.g.dart';

@JsonSerializable()
class Game extends Model {
  final int deckId;
  final List<int> gameCardIds;
  List<GameCard> get gameCards =>
      GetIt.I<GameCardService>().findAll(ids: gameCardIds);
  final List<int> userIds;
  List<User> get users => GetIt.I<UserService>().findAll(ids: userIds);

  const Game(
    int id, {
    required this.deckId,
    required this.gameCardIds,
    required this.userIds,
  }) : super(id);

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GameToJson(this);
}
