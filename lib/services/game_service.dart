import 'package:cards/models/game.dart';
import 'package:cards/services/deck_service.dart';
import 'package:cards/services/game_card_service.dart';
import 'package:cards/services/service.dart';
import 'package:get_it/get_it.dart';

class GameService extends Service<Game> {
  DeckService get _deckService => GetIt.I<DeckService>();
  GameCardService get _gameCardService => GetIt.I<GameCardService>();

  GameService()
      : super(
          collectionName: 'games',
          fromJson: Game.fromJson,
        );

  Game startNewGame({
    required List<int> userIds,
    required int deckId,
  }) {
    final deck = _deckService.findOne(deckId);
    final gameCardIds = deck.templateIds
        .map(
          (templateId) => _gameCardService.generate(templateId: templateId).id,
        )
        .toList();
    gameCardIds.shuffle();

    return create(
      Game(
        generateId(),
        deckId: deckId,
        gameCardIds: gameCardIds,
        userIds: userIds,
      ),
    );
  }
}
