import 'package:cards/models/deck.dart';
import 'package:cards/models/game_card.dart';
import 'package:cards/models/model.dart';
import 'package:cards/models/user.dart';
import 'package:cards/services/deck_service.dart';
import 'package:cards/services/game_card_service.dart';
import 'package:cards/services/user_service.dart';
import 'package:cards/util/logging.dart';
import 'package:get_it/get_it.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game.g.dart';

@JsonSerializable()
class Game extends Model {
  String deckId;
  Future<Deck> get deck => GetIt.I<DeckService>().findOne(deckId);
  List<String> gameCardIds;
  Future<Iterable<GameCard>> get gameCards =>
      GetIt.I<GameCardService>().findAll(ids: gameCardIds);
  List<String> userIds;
  Future<Iterable<User>> get users =>
      GetIt.I<UserService>().findAll(ids: userIds);

  Game({
    String? id,
    required this.deckId,
    required this.gameCardIds,
    required this.userIds,
  }) : super(id);

  factory Game.fromJson(Map<String, dynamic> json) =>
      logError(_$GameFromJson, json);

  @override
  Map<String, dynamic> toJson() => _$GameToJson(this);
}
