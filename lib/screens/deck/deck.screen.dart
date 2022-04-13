import 'package:auto_route/auto_route.dart';
import 'package:cards/components/async/async_builder.dart';
import 'package:cards/models/deck.dart';
import 'package:cards/screens/deck/edit_deck.screen.dart';
import 'package:cards/screens/deck/view_deck.screen.dart';
import 'package:cards/services/deck_service.dart';
import 'package:flutter/material.dart';
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
    return AsyncBuilder<Deck>(
      future: GetIt.I<DeckService>().findOne(deckId),
      builder: (context, deck) =>
          isEditing ? EditDeckScreen(deck: deck) : ViewDeckScreen(deck: deck),
    );
  }
}
