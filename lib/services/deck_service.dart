import 'package:cards/models/deck.dart';
import 'package:cards/services/file_service.dart';
import 'package:cards/services/model_service.dart';
import 'package:cards/services/template_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DeckService extends ModelService<Deck> {
  DeckService() : super(collectionName: 'decks', fromJson: Deck.fromJson);

  FileService get _fileService => GetIt.I<FileService>();
  TemplateService get _templateService => GetIt.I<TemplateService>();

  @override
  Future<void> load(Iterable<Deck> values) async {
    await super.load(values);

    values.forEach((value) async {
      await _templateService.load(await value.templates);
    });
  }

  Future<void> saveAsFile({
    required String name,
    required List<Deck> decks,
    required BuildContext context,
  }) async {
    final templateIds = <String>{};
    decks.forEach((deck) {
      templateIds.addAll(deck.templateIds);
    });

    final templates = await _templateService.findAll(ids: templateIds.toList());
    final json = {
      'decks': decks.map((e) => e.toJson()).toList(),
      'templates': templates.map((e) => e.toJson()).toList(),
    };

    await _fileService.saveJsonFile(
      name: name,
      json: json,
      context: context,
    );
  }
}
