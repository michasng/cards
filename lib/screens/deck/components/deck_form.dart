import 'package:cards/components/text/heading.dart';
import 'package:cards/models/deck.dart';
import 'package:cards/screens/deck/components/template_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeckForm extends StatelessWidget {
  final Deck deck;

  const DeckForm({
    Key? key,
    required this.deck,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Column(
      children: [
        Heading(locale.templateCount(deck.templateIds.length)),
        TemplateList(templates: deck.templates),
      ],
    );
  }
}
