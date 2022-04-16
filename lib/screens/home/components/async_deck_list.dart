import 'package:cards/components/async/async_builder.dart';
import 'package:cards/components/text/heading.dart';
import 'package:cards/constants.dart';
import 'package:cards/models/deck.dart';
import 'package:cards/screens/home/components/deck_list.dart';
import 'package:cards/services/deck_service.dart';
import 'package:cards/services/template_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

class AsyncDeckList extends StatefulWidget {
  const AsyncDeckList({
    Key? key,
  }) : super(key: key);

  @override
  State<AsyncDeckList> createState() => _AsyncDeckListState();
}

class _AsyncDeckListState extends State<AsyncDeckList> {
  late Future<Iterable<Deck>> _loadFuture;

  @override
  void initState() {
    super.initState();
    _loadFuture = _load();
  }

  Future<Iterable<Deck>> _load() async {
    return GetIt.I<DeckService>().findAll();
  }

  Future<void> _addDeck() async {
    final deck = Deck(
      name: 'new Deck',
      templateIds: [],
      isShuffled: false,
    );
    await GetIt.I<DeckService>().save(deck);
    setState(() {
      _loadFuture = _load();
    });
  }

  Future<void> _deleteDeck(Deck deck) async {
    await GetIt.I<DeckService>().delete(deck.id!);
    for (final templateId in deck.templateIds)
      await GetIt.I<TemplateService>().delete(templateId);
    setState(() {
      _loadFuture = _load();
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Heading(locale.decks),
        AsyncBuilder<Iterable<Deck>>(
          future: _loadFuture,
          builder: (context, decks) => DeckList(
            decks: decks.toList(),
            trailingBuilder: (deck) => IconButton(
              onPressed: () async => await _deleteDeck(deck),
              icon: Icon(Icons.delete),
            ),
          ),
        ),
        SizedBox(height: defaultPadding),
        ElevatedButton.icon(
          onPressed: _addDeck,
          icon: Icon(Icons.add),
          label: Text(locale.newDeck),
        ),
      ],
    );
  }
}
