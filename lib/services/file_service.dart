import 'dart:convert';
import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FileService {
  Future<void> saveJsonFile({
    required String name,
    required Map<String, dynamic> json,
    required BuildContext context,
  }) async {
    final locale = AppLocalizations.of(context)!;

    await FileSaver.instance.saveFile(
      name,
      Uint8List.fromList(jsonEncode(json).codeUnits),
      'json',
      mimeType: MimeType.JSON,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(locale.fileSaved('$name.json')),
      ),
    );
  }
}
