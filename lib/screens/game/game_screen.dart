import 'package:auto_route/auto_route.dart';
import 'package:cards/app_router.gr.dart';
import 'package:cards/models/game.dart';
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

  @override
  Widget build(BuildContext context) {
    late Game game;
    if (deckId != null) {
      final deck = GetIt.I<DeckService>().findOne(deckId!);
      game = GetIt.I<GameService>().startNewGame(
        deck: deck,
        users: [],
      );
    }

    return Scaffold(
      body: GamePageView(gameCards: game.gameCards),
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
