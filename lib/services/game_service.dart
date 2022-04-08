import 'package:cards/models/deck.dart';
import 'package:cards/models/game.dart';
import 'package:cards/models/user.dart';
import 'package:cards/services/game_card_service.dart';
import 'package:cards/services/model_service.dart';
import 'package:get_it/get_it.dart';

class GameService extends ModelService<Game> {
  GameCardService get _gameCardService => GetIt.I<GameCardService>();

  Game startNewGame({
    required List<User> users,
    required Deck deck,
  }) {
    final gameCards = deck.templates
        .map(
          (template) => _gameCardService.generate(template: template),
        )
        .toList();
    gameCards.shuffle();

    return create(
      Game(
        deck: deck,
        gameCards: gameCards,
        users: users,
      ),
    );
  }
}
