import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cards/screens/deck/deck.screen.dart';
import 'package:cards/screens/game/game_screen.dart';
import 'package:cards/screens/home/home_screen.dart';
import 'package:cards/screens/template/template_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/home',
      page: HomeScreen,
      initial: true,
      usesPathAsKey: true,
    ),
    AutoRoute(
      path: '/game',
      page: GameScreen,
      usesPathAsKey: true,
    ),
    AutoRoute(
      path: '/deck/:deckId',
      page: DeckScreen,
      usesPathAsKey: true,
    ),
    AutoRoute(
      path: '/card/:templateId',
      page: TemplateScreen,
      usesPathAsKey: true,
    ),
  ],
)
class $AppRouter {}
