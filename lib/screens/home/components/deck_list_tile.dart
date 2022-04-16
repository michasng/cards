import 'package:auto_route/auto_route.dart';
import 'package:cards/app_router.gr.dart';
import 'package:cards/models/deck.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeckListTile extends StatelessWidget {
  final Deck deck;
  final Widget? trailing;

  const DeckListTile({
    Key? key,
    required this.deck,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return ListTile(
      title: Text(deck.name),
      subtitle: Text(
        locale.templateCount(deck.templateIds.length),
      ),
      trailing: trailing,
      onTap: () {
        AutoRouter.of(context).push(DeckRoute(deckId: deck.id!));
      },
    );
  }
}
