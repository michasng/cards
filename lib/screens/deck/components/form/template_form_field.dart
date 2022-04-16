import 'package:cards/components/dialogs/color_picker_dialog.dart';
import 'package:cards/models/template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TemplateFormField extends StatelessWidget {
  final Template template;
  final void Function(Color color) onColorSelected;
  final VoidCallback onRemove;

  const TemplateFormField({
    Key? key,
    required this.template,
    required this.onColorSelected,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    final textStyle = Theme.of(context)
        .textTheme
        .subtitle1
        ?.copyWith(color: template.color.contrastColor);

    return ListTile(
      title: TextFormField(
        initialValue: template.template,
        onSaved: (value) {
          template.template = value!;
        },
        decoration: InputDecoration(
          // fillColor: template.color.color,
          border: InputBorder.none,
          hintStyle: textStyle,
          hintText: locale.placeholder,
        ),
        style: textStyle,
      ),
      tileColor: template.color.color,
      iconColor: template.color.contrastColor,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            template.numOccurrence.toString(),
            style: textStyle,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: onRemove,
          ),
          IconButton(
            icon: Icon(Icons.color_lens),
            onPressed: () async {
              final color = await showDialog<Color>(
                context: context,
                builder: (context) =>
                    ColorPickerDialog(pickerColor: template.color.color),
              );
              if (color == null) return;
              onColorSelected(color);
            },
          ),
        ],
      ),
    );
  }
}
