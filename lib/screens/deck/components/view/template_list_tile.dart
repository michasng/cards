import 'package:auto_route/auto_route.dart';
import 'package:cards/app_router.gr.dart';
import 'package:cards/models/template.dart';
import 'package:flutter/material.dart';

class TemplateListTile extends StatelessWidget {
  final Template template;

  const TemplateListTile({
    Key? key,
    required this.template,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(template.template),
      tileColor: template.color.color,
      textColor: template.color.contrastColor,
      onTap: () {
        AutoRouter.of(context).push(TemplateRoute(templateId: template.id!));
      },
    );
  }
}
