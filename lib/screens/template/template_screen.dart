import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

class TemplateScreen extends StatelessWidget {
  final String templateId;

  const TemplateScreen({
    Key? key,
    @pathParam required this.templateId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Template'),
    );
  }
}
