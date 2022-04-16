import 'package:cards/models/game_card.dart';
import 'package:cards/models/template.dart';
import 'package:cards/services/model_service.dart';

class GameCardService extends ModelService<GameCard> {
  GameCardService()
      : super(collectionName: 'gameCards', fromJson: GameCard.fromJson);

  Stream<GameCard> generate({required Template template}) async* {
    for (int i = 0; i < template.numOccurrence; i++)
      yield await save(
        GameCard(
          templateId: template.id!,
          text: template.template,
        ),
      );
  }
}
