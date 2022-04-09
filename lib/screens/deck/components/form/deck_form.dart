import 'package:cards/components/layout/split_column.dart';
import 'package:cards/constants.dart';
import 'package:cards/models/deck.dart';
import 'package:cards/screens/deck/components/form/template_form_field_list.dart';
import 'package:cards/services/deck_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

class DeckForm extends StatefulWidget {
  final Deck deck;
  final GlobalKey<FormState> formKey;

  const DeckForm({
    Key? key,
    required this.deck,
    required this.formKey,
  }) : super(key: key);

  @override
  State<DeckForm> createState() => _DeckFormState();
}

class _DeckFormState extends State<DeckForm> {
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = widget.formKey;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SplitColumn(
        children: [
          _buildDeckNameField(context),
          TemplateFormFieldList(templates: widget.deck.templates),
        ],
        divider: SizedBox(height: defaultPadding),
      ),
    );
  }

  Widget _buildDeckNameField(context) {
    final locale = AppLocalizations.of(context)!;

    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: locale.deck,
        alignLabelWithHint: true,
      ),
      initialValue: widget.deck.name,
      onSaved: (value) {
        widget.deck.name = value!;
        GetIt.I<DeckService>().createOrUpdate(widget.deck);
      },
    );
  }
}
