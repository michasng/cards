import 'package:auto_route/annotations.dart';
import 'package:cards/screens/components/screen.dart';
import 'package:flutter/material.dart';

class TemplateScreen extends StatelessWidget {
  final String templateId;

  const TemplateScreen({
    Key? key,
    @pathParam required this.templateId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Text('Template'),
    );
  }
}
