import 'package:cards/models/deck.dart';
import 'package:cards/services/model_service.dart';
import 'package:cards/services/template_service.dart';
import 'package:get_it/get_it.dart';

class DeckService extends ModelService<Deck> {
  TemplateService get _templateService => GetIt.I<TemplateService>();

  @override
  void load(Iterable<Deck> values) {
    super.load(values);

    values.forEach((value) {
      _templateService.load(value.templates);
    });
  }
}
