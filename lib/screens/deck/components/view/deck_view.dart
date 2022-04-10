import 'package:cards/components/async/async_builder.dart';
import 'package:cards/components/layout/split_column.dart';
import 'package:cards/components/text/heading.dart';
import 'package:cards/constants.dart';
import 'package:cards/models/deck.dart';
import 'package:cards/models/template.dart';
import 'package:cards/screens/deck/components/view/template_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeckView extends StatelessWidget {
  final Deck deck;

  const DeckView({
    Key? key,
    required this.deck,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return SplitColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Heading(locale.templateCount(deck.templateIds.length)),
        AsyncBuilder<Iterable<Template>>(
          future: deck.templates,
          builder: (context, templates) =>
              TemplateList(templates: templates.toList()),
        ),
      ],
      divider: SizedBox(height: defaultPadding),
    );
  }
}
