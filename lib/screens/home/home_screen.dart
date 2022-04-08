import 'package:cards/components/text/heading.dart';
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

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Heading(locale.decks),
            DeckList(decks: GetIt.I<DeckService>().findAll()),
          ],
        ),
      ),
    );
  }
}
