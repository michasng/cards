import 'package:cards/screens/components/screen.dart';
import 'package:cards/screens/components/screen_bar.dart';
import 'package:cards/screens/home/components/async_deck_list.dart';
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
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: () async {
              final decks = await GetIt.I<DeckService>().findAll();
              await GetIt.I<DeckService>().saveAsFile(
                name: 'decks',
                decks: decks.toList(),
                context: context,
              );
            },
          ),
        ],
      ),
      child: AsyncDeckList(),
    );
  }
}
