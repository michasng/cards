import 'package:cards/models/game_card.dart';
import 'package:flutter/material.dart';

class GameCardPage extends StatelessWidget {
  final GameCard gameCard;

  const GameCardPage({
    Key? key,
    required this.gameCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: gameCard.template.color.color,
      alignment: Alignment.center,
      child: FittedBox(
        child: Text(
          gameCard.text,
          style: Theme.of(context)
              .textTheme
              .headline3
              ?.copyWith(color: gameCard.template.color.contrastColor),
        ),
      ),
    );
  }
}
