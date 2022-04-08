import 'package:auto_route/auto_route.dart';
import 'package:cards/app_router.gr.dart';
import 'package:cards/screens/deck/components/form/deck_form.dart';
import 'package:cards/screens/deck/components/view/deck_view.dart';
import 'package:cards/services/deck_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

class DeckScreen extends StatelessWidget {
  final String deckId;
  final bool isEditing;

  const DeckScreen({
    Key? key,
    @pathParam required this.deckId,
    @queryParam this.isEditing = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final deck = GetIt.I<DeckService>().findOne(deckId);

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.deckName(deck.name)),
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              AutoRouter.of(context).replace(
                DeckRoute(
                  deckId: deckId,
                  isEditing: !isEditing,
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: isEditing ? DeckForm(deck: deck) : DeckView(deck: deck),
      ),
      floatingActionButton: isEditing
          ? null
          : FloatingActionButton(
              child: Icon(Icons.play_arrow),
              onPressed: () {
                AutoRouter.of(context).push(GameRoute(deckId: deckId));
              },
            ),
    );
  }
}
