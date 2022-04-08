import 'package:cards/models/game_card.dart';
import 'package:cards/models/template.dart';
import 'package:cards/services/model_service.dart';

class GameCardService extends ModelService<GameCard> {
  GameCard generate({required Template template}) {
    return create(
      GameCard(
        template: template,
        text: template.template,
      ),
    );
  }
}
