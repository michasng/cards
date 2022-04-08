import 'dart:convert';

import 'package:cards/models/app.dart';
import 'package:cards/services/deck_service.dart';
import 'package:cards/services/game_service.dart';
import 'package:cards/services/model_service.dart';
import 'package:cards/services/user_service.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class AppService extends ModelService<App> {
  DeckService get _deckService => GetIt.I<DeckService>();
  UserService get _userService => GetIt.I<UserService>();
  GameService get _gameService => GetIt.I<GameService>();

  Future<AppService> seeded() async {
    final str = await rootBundle.loadString('assets/seeds.json');
    final app = App.fromJson(jsonDecode(str));
    load([app]);
    return this;
  }

  @override
  void load(Iterable<App> values) {
    super.load(values);

    values.forEach((value) {
      _deckService.load(value.decks);
      _userService.load(value.users);
      if (value.game != null) _gameService.load([value.game!]);
    });
  }
}
