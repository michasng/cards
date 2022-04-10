import 'package:cards/components/layout/split_column.dart';
import 'package:cards/constants.dart';
import 'package:cards/models/common/color_data.dart';
import 'package:cards/models/template.dart';
import 'package:cards/screens/deck/components/form/template_form_field.dart';
import 'package:cards/services/template_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

class TemplateFormFieldList extends StatefulWidget {
  final List<Template> templates;

  const TemplateFormFieldList({
    Key? key,
    required this.templates,
  }) : super(key: key);

  @override
  State<TemplateFormFieldList> createState() => _TemplateFormFieldListState();
}

class _TemplateFormFieldListState extends State<TemplateFormFieldList> {
  late final List<Template> _templates;

  @override
  void initState() {
    super.initState();
    _templates = widget.templates;
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return SplitColumn(
      children: [
        ..._templates.map(
          (template) => TemplateFormField(
            model: template,
            onSaved: (value) async {
              await GetIt.I<TemplateService>().save(value);
            },
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {
            final template = Template(
              template: '',
              isActive: true,
              color: _templates.isNotEmpty
                  ? _templates.first.color
                  : ColorData.fromColor(Color(0xff000000)),
            );
            setState(() {
              _templates.add(template);
            });
          },
          icon: Icon(Icons.add),
          label: Text(locale.newCard),
        ),
      ],
      divider: SizedBox(height: defaultPadding),
    );
  }
}
