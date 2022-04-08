import 'package:cards/models/template.dart';
import 'package:cards/screens/deck/components/form/template_form_field.dart';
import 'package:cards/services/template_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class TemplateFormFieldList extends StatelessWidget {
  final List<Template> templates;

  const TemplateFormFieldList({
    Key? key,
    required this.templates,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: templates
          .map(
            (template) => TemplateFormField(
              initialValue: template,
              onSaved: (value) {
                GetIt.I<TemplateService>().createOrUpdate(value);
              },
            ),
          )
          .toList(),
    );
  }
}
