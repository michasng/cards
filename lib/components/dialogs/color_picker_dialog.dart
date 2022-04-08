import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerDialog extends StatelessWidget {
  final Color pickerColor;

  const ColorPickerDialog({
    Key? key,
    required this.pickerColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlockPicker(
        pickerColor: pickerColor,
        onColorChanged: (Color color) {
          Navigator.of(context).pop(color);
        },
      ),
    );
  }
}
