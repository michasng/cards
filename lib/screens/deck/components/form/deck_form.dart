import 'package:cards/models/deck.dart';
import 'package:cards/screens/deck/components/form/template_form_field_list.dart';
import 'package:cards/services/deck_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DeckForm extends StatelessWidget {
  final Deck deck;

  const DeckForm({
    Key? key,
    required this.deck,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          _buildDeckNameField(context),
          TemplateFormFieldList(templates: deck.templates),
        ],
      ),
    );
  }

  Widget _buildDeckNameField(context) {
    return TextFormField(
      initialValue: deck.name,
      onSaved: (value) {
        GetIt.I<DeckService>().createOrUpdate(deck);
      },
    );
  }
}
