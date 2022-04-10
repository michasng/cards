import 'package:cards/components/dialogs/color_picker_dialog.dart';
import 'package:cards/models/common/color_data.dart';
import 'package:cards/models/template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TemplateFormField extends StatefulWidget {
  final Template template;

  const TemplateFormField({
    Key? key,
    required this.template,
  }) : super(key: key);

  @override
  State<TemplateFormField> createState() => _TemplateFormFieldState();
}

class _TemplateFormFieldState extends State<TemplateFormField> {
  late ColorData _color;

  @override
  void initState() {
    super.initState();

    _color = widget.template.color;
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    final textStyle = Theme.of(context)
        .textTheme
        .subtitle1
        ?.copyWith(color: _color.contrastColor);

    return ListTile(
      title: TextFormField(
        initialValue: widget.template.template,
        onSaved: (value) {
          widget.template
            ..template = value!
            ..color = _color;
        },
        decoration: InputDecoration(
          fillColor: _color.color,
          border: InputBorder.none,
          hintStyle: textStyle,
          hintText: locale.placeholder,
        ),
        style: textStyle,
      ),
      tileColor: _color.color,
      iconColor: _color.contrastColor,
      trailing: IconButton(
        icon: Icon(Icons.color_lens),
        onPressed: () async {
          final color = await showDialog<Color>(
            context: context,
            builder: (context) => ColorPickerDialog(pickerColor: _color.color),
          );
          if (color == null) return;
          setState(() {
            _color = ColorData.fromColor(color);
          });
        },
      ),
    );
  }
}
