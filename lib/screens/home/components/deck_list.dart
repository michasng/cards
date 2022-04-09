import 'package:cards/components/layout/split_column.dart';
import 'package:cards/models/deck.dart';
import 'package:cards/screens/home/components/deck_list_tile.dart';
import 'package:flutter/material.dart';

class DeckList extends StatelessWidget {
  final List<Deck> decks;

  const DeckList({
    Key? key,
    required this.decks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplitColumn(
      children: decks.map((deck) => DeckListTile(deck: deck)).toList(),
      divider: Divider(),
    );
  }
}
