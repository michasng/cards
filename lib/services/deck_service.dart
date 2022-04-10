import 'package:cards/models/deck.dart';
import 'package:cards/services/model_service.dart';
import 'package:cards/services/template_service.dart';
import 'package:get_it/get_it.dart';

class DeckService extends ModelService<Deck> {
  DeckService() : super(collectionName: 'decks', fromJson: Deck.fromJson);

  TemplateService get _templateService => GetIt.I<TemplateService>();

  @override
  Future<void> load(Iterable<Deck> values) async {
    await super.load(values);

    values.forEach((value) async {
      await _templateService.load(await value.templates);
    });
  }
}
