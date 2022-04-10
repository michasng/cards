import 'package:auto_route/auto_route.dart';
import 'package:cards/app_router.gr.dart';
import 'package:cards/components/async/async_builder.dart';
import 'package:cards/models/deck.dart';
import 'package:cards/screens/components/screen.dart';
import 'package:cards/screens/components/screen_bar.dart';
import 'package:cards/screens/deck/components/form/deck_form.dart';
import 'package:cards/screens/deck/components/view/deck_view.dart';
import 'package:cards/services/deck_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

class DeckScreen extends StatefulWidget {
  final String deckId;
  final bool isEditing;

  const DeckScreen({
    Key? key,
    @pathParam required this.deckId,
    @queryParam this.isEditing = false,
  }) : super(key: key);

  @override
  State<DeckScreen> createState() => _DeckScreenState();
}

class _DeckScreenState extends State<DeckScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final deckFuture = GetIt.I<DeckService>().findOne(widget.deckId);

    return Screen(
      appBar: ScreenBar(
        title: AsyncBuilder<Deck>(
          future: deckFuture,
          builder: (context, deck) => Text(locale.deckName(deck.name)),
        ),
        actions: [
          IconButton(
            icon: Icon(widget.isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              final formState = _formKey.currentState;
              if (widget.isEditing && formState?.validate() != null)
                formState?.save();

              AutoRouter.of(context).replace(
                DeckRoute(
                  deckId: widget.deckId,
                  isEditing: !widget.isEditing,
                ),
              );
            },
          ),
        ],
      ),
      child: AsyncBuilder<Deck>(
        future: deckFuture,
        builder: (context, deck) => widget.isEditing
            ? DeckForm(formKey: _formKey, deck: deck)
            : DeckView(deck: deck),
      ),
      floatingActionButton: widget.isEditing
          ? null
          : FloatingActionButton(
              child: Icon(Icons.play_arrow),
              onPressed: () {
                AutoRouter.of(context).push(GameRoute(deckId: widget.deckId));
              },
            ),
    );
  }
}
