import 'package:cards/components/async/async_builder.dart';
import 'package:cards/components/text/heading.dart';
import 'package:cards/models/deck.dart';
import 'package:cards/screens/components/screen.dart';
import 'package:cards/screens/components/screen_bar.dart';
import 'package:cards/screens/home/components/deck_list.dart';
import 'package:cards/services/deck_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Screen(
      appBar: ScreenBar(
        showHome: false,
        title: Text(locale.home),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Heading(locale.decks),
          AsyncBuilder<Iterable<Deck>>(
            future: GetIt.I<DeckService>().findAll(),
            builder: (context, decks) => DeckList(decks: decks.toList()),
          ),
        ],
      ),
    );
  }
}
