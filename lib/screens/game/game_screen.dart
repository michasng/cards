import 'package:auto_route/auto_route.dart';
import 'package:cards/app_router.gr.dart';
import 'package:cards/components/async/async_builder.dart';
import 'package:cards/models/game.dart';
import 'package:cards/models/game_card.dart';
import 'package:cards/screens/game/components/game_page_view.dart';
import 'package:cards/services/deck_service.dart';
import 'package:cards/services/game_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class GameScreen extends StatelessWidget {
  final String? deckId;

  GameScreen({
    Key? key,
    @queryParam this.deckId,
  }) : super(key: key) {
    assert(deckId != null);
  }

  Future<Game> _startNewGame() async {
    final deck = await GetIt.I<DeckService>().findOne(deckId!);
    return await GetIt.I<GameService>().startNewGame(
      deck: deck,
      users: [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AsyncBuilder<Game>(
        future: _startNewGame(),
        builder: (context, game) => AsyncBuilder<Iterable<GameCard>>(
          future: game.gameCards,
          builder: (context, gameCards) =>
              GamePageView(gameCards: gameCards.toList()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_new),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () {
          final router = AutoRouter.of(context);
          if (router.canPopSelfOrChildren)
            router.pop();
          else
            router.replace(HomeRoute());
        },
      ),
    );
  }
}
