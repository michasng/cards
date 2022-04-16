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
  final List<Template> initialTemplates;

  const TemplateFormFieldList({
    Key? key,
    required this.initialTemplates,
  }) : super(key: key);

  @override
  State<TemplateFormFieldList> createState() => TemplateFormFieldListState();
}

class TemplateFormFieldListState extends State<TemplateFormFieldList> {
  final List<Template> _templates = [];

  @override
  void initState() {
    super.initState();
    _templates.addAll(widget.initialTemplates);
  }

  Future<List<Template>> save() async {
    await GetIt.I<TemplateService>().saveChanges(
      before: widget.initialTemplates,
      after: _templates,
    );
    return _templates;
  }

  void _addTemplate() {
    final template = Template(
      template: '',
      isActive: true,
      color: _templates.isNotEmpty
          ? _templates.last.color
          : ColorData.fromColor(Color(0xff000000)),
    );
    setState(() {
      _templates.add(template);
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return SplitColumn(
      children: [
        ReorderableListView(
          buildDefaultDragHandles: false,
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final template = _templates.removeAt(oldIndex);
              _templates.insert(newIndex, template);
            });
          },
          children: _templates
              .map(
                (template) => Material(
                  key: ValueKey(template),
                  elevation: 1,
                  color: template.color.color,
                  child: Row(
                    children: [
                      Flexible(
                        child: TemplateFormField(
                          template: template,
                          onColorSelected: (color) {
                            setState(() {
                              template.color = ColorData.fromColor(color);
                            });
                          },
                          onRemove: () {
                            setState(() {
                              _templates.remove(template);
                            });
                          },
                        ),
                      ),
                      ReorderableDragStartListener(
                        child: Icon(
                          Icons.drag_handle,
                          color: template.color.contrastColor,
                        ),
                        index: _templates.indexOf(template),
                      ),
                      SizedBox(width: defaultPadding),
                    ],
                  ),
                ),
              )
              .toList(),
          shrinkWrap: true,
        ),
        ElevatedButton.icon(
          onPressed: _addTemplate,
          icon: Icon(Icons.add),
          label: Text(locale.newCard),
        ),
      ],
      divider: SizedBox(height: defaultPadding),
    );
  }
}
