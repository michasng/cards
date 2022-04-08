import 'package:cards/models/game_card.dart';
import 'package:cards/screens/game/components/game_card_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GamePageView extends StatelessWidget {
  final List<GameCard> gameCards;

  const GamePageView({
    Key? key,
    required this.gameCards,
  }) : super(key: key);
  // final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      // controller: controller,
      itemBuilder: (context, index) {
        return GameCardPage(gameCard: gameCards[index]);
      },
      itemCount: gameCards.length,
      scrollDirection: Axis.vertical,
      scrollBehavior: ScrollConfiguration.of(context)
          .copyWith(dragDevices: PointerDeviceKind.values.toSet()),
    );
  }
}
