import 'package:auto_route/auto_route.dart';
import 'package:cards/app_router.gr.dart';
import 'package:cards/models/deck.dart';
import 'package:cards/screens/components/screen.dart';
import 'package:cards/screens/components/screen_bar.dart';
import 'package:cards/screens/deck/components/form/deck_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditDeckScreen extends StatefulWidget {
  final Deck deck;

  const EditDeckScreen({
    Key? key,
    required this.deck,
  }) : super(key: key);

  @override
  State<EditDeckScreen> createState() => _EditDeckScreenState();
}

class _EditDeckScreenState extends State<EditDeckScreen> {
  final _deckFormKey = GlobalKey<DeckFormState>();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Screen(
      appBar: ScreenBar(
        title: Text(locale.deckName(widget.deck.name)),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              final deck = await _deckFormKey.currentState?.save();

              if (deck == null) return;

              AutoRouter.of(context).replace(
                DeckRoute(
                  deckId: deck.id!,
                  isEditing: false,
                ),
              );
            },
          ),
        ],
      ),
      child: DeckForm(
        key: _deckFormKey,
        deck: widget.deck,
      ),
    );
  }
}
