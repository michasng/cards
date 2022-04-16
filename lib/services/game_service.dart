import 'package:cards/models/deck.dart';
import 'package:cards/models/game.dart';
import 'package:cards/models/user.dart';
import 'package:cards/services/game_card_service.dart';
import 'package:cards/services/model_service.dart';
import 'package:get_it/get_it.dart';

class GameService extends ModelService<Game> {
  GameService() : super(collectionName: 'games', fromJson: Game.fromJson);

  GameCardService get _gameCardService => GetIt.I<GameCardService>();

  Future<Game> startNewGame({
    required List<User> users,
    required Deck deck,
  }) async {
    final gameCards = await Stream.fromIterable(await deck.templates)
        .asyncExpand(
          (template) => _gameCardService.generate(template: template),
        )
        .toList();

    if (deck.isShuffled) gameCards.shuffle();

    return save(
      Game(
        deckId: deck.id!,
        gameCardIds: gameCards.map((e) => e.id!).toList(),
        userIds: users.map((e) => e.id!).toList(),
      ),
    );
  }
}
