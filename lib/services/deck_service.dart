import 'package:cards/models/deck.dart';
import 'package:cards/services/service.dart';

class DeckService extends Service<Deck> {
  DeckService()
      : super(
          collectionName: 'decks',
          fromJson: Deck.fromJson,
        );

  Future<DeckService> seeded() async {
    await seed();
    return this;
  }
}
