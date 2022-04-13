import 'package:cards/models/deck.dart';
import 'package:cards/services/deck_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ShuffleToggle extends StatefulWidget {
  final Deck deck;

  const ShuffleToggle({
    Key? key,
    required this.deck,
  }) : super(key: key);

  @override
  State<ShuffleToggle> createState() => _ShuffleToggleState();
}

class _ShuffleToggleState extends State<ShuffleToggle> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(widget.deck.isShuffled ? Icons.shuffle : Icons.repeat),
      onPressed: () async {
        widget.deck.isShuffled = !widget.deck.isShuffled;
        await GetIt.I<DeckService>().save(widget.deck);
        setState(() {});
      },
    );
  }
}
