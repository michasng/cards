import 'package:cards/components/dialogs/color_picker_dialog.dart';
import 'package:cards/models/common/color_data.dart';
import 'package:cards/models/template.dart';
import 'package:flutter/material.dart';

class TemplateFormField extends StatefulWidget {
  final Template? initialValue;
  final void Function(Template) onSaved;

  const TemplateFormField({
    Key? key,
    required this.initialValue,
    required this.onSaved,
  }) : super(key: key);

  @override
  State<TemplateFormField> createState() => _TemplateFormFieldState();
}

class _TemplateFormFieldState extends State<TemplateFormField> {
  late ColorData _color;

  @override
  void initState() {
    super.initState();

    _color =
        widget.initialValue?.color ?? ColorData.fromColor(Color(0xff000000));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        initialValue: widget.initialValue?.template,
        onSaved: (value) {
          widget.onSaved(
            Template(
              template: value!,
              isActive: true,
              color: _color,
            ),
          );
        },
        style: Theme.of(context)
            .textTheme
            .subtitle1
            ?.copyWith(color: _color.contrastColor),
      ),
      tileColor: _color.color,
      textColor: _color.contrastColor,
      trailing: IconButton(
        icon: Icon(Icons.color_lens),
        color: _color.contrastColor,
        onPressed: () async {
          final color = await showDialog(
            context: context,
            builder: (context) => ColorPickerDialog(pickerColor: _color.color),
          );
          setState(() {
            _color = ColorData.fromColor(color);
          });
        },
      ),
    );
  }
}
