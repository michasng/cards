import 'package:cards/app_router.gr.dart';
import 'package:cards/services/deck_service.dart';
import 'package:cards/services/game_card_service.dart';
import 'package:cards/services/game_service.dart';
import 'package:cards/services/template_service.dart';
import 'package:cards/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerServices();
  runApp(App());
}

Future<void> registerServices() async {
  final getIt = GetIt.I;

  getIt.registerSingleton(UserService());
  getIt.registerSingletonAsync(TemplateService().seeded);
  getIt.registerSingletonAsync(DeckService().seeded);
  getIt.registerSingleton(GameCardService());
  getIt.registerSingleton(GameService());

  await getIt.allReady();
}

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey);

    return MaterialApp.router(
      title: 'Cards',
      theme: ThemeData.light().copyWith(colorScheme: colorScheme),
      darkTheme: ThemeData.dark().copyWith(colorScheme: colorScheme),
      themeMode: ThemeMode.light,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
