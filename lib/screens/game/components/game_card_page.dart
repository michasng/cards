import 'package:cards/components/async/async_builder.dart';
import 'package:cards/components/text/shrink_text.dart';
import 'package:cards/constants.dart';
import 'package:cards/models/game_card.dart';
import 'package:cards/models/template.dart';
import 'package:flutter/material.dart';

class GameCardPage extends StatelessWidget {
  final GameCard gameCard;

  const GameCardPage({
    Key? key,
    required this.gameCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AsyncBuilder<Template>(
      future: gameCard.template,
      builder: (context, template) => Container(
        padding: EdgeInsets.all(defaultPadding),
        color: template.color.color,
        alignment: Alignment.center,
        child: ShrinkText(
          child: Text(
            gameCard.text,
            style: Theme.of(context)
                .textTheme
                .headline3
                ?.copyWith(color: template.color.contrastColor),
          ),
        ),
      ),
    );
  }
}
