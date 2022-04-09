import 'package:cards/components/layout/split_column.dart';
import 'package:cards/constants.dart';
import 'package:cards/models/template.dart';
import 'package:cards/screens/deck/components/view/template_list_tile.dart';
import 'package:flutter/material.dart';

class TemplateList extends StatelessWidget {
  final List<Template> templates;

  const TemplateList({
    Key? key,
    required this.templates,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplitColumn(
      children: templates
          .map((template) => TemplateListTile(template: template))
          .toList(),
      divider: SizedBox(height: defaultPadding),
    );
  }
}
