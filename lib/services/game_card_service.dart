import 'package:cards/models/game_card.dart';
import 'package:cards/services/service.dart';
import 'package:cards/services/template_service.dart';
import 'package:get_it/get_it.dart';

class GameCardService extends Service<GameCard> {
  TemplateService get _templateService => GetIt.I<TemplateService>();

  GameCardService()
      : super(
          collectionName: 'gameCards',
          fromJson: GameCard.fromJson,
        );

  GameCard generate({required int templateId}) {
    final template = _templateService.findOne(templateId);

    return create(
      GameCard(
        generateId(),
        templateId: templateId,
        text: template.template,
      ),
    );
  }
}
