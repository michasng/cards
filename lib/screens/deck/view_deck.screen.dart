import 'package:auto_route/auto_route.dart';
import 'package:cards/app_router.gr.dart';
import 'package:cards/constants.dart';
import 'package:cards/models/deck.dart';
import 'package:cards/screens/components/screen.dart';
import 'package:cards/screens/components/screen_bar.dart';
import 'package:cards/screens/deck/components/view/deck_view.dart';
import 'package:cards/screens/deck/components/view/shuffle_toggle.dart';
import 'package:cards/services/deck_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

class ViewDeckScreen extends StatelessWidget {
  final Deck deck;

  const ViewDeckScreen({
    Key? key,
    required this.deck,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Screen(
      appBar: ScreenBar(
        title: Text(locale.deckName(deck.name)),
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: () async {
              await GetIt.I<DeckService>().saveAsFile(
                name: deck.name,
                decks: [deck],
                context: context,
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () async {
              AutoRouter.of(context).replace(
                DeckRoute(
                  deckId: deck.id!,
                  isEditing: true,
                ),
              );
            },
          ),
        ],
      ),
      child: DeckView(deck: deck),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ShuffleToggle(deck: deck),
          SizedBox(height: defaultPadding / 2),
          FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () {
              AutoRouter.of(context).push(GameRoute(deckId: deck.id!));
            },
          ),
        ],
      ),
    );
  }
}
