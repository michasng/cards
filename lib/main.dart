import 'dart:convert';

import 'package:cards/app_router.gr.dart';
import 'package:cards/models/deck.dart';
import 'package:cards/models/template.dart';
import 'package:cards/services/deck_service.dart';
import 'package:cards/services/game_card_service.dart';
import 'package:cards/services/game_service.dart';
import 'package:cards/services/template_service.dart';
import 'package:cards/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerServices();
  await seed();
  runApp(App());
}

void registerServices() {
  GetIt.I.registerSingleton(UserService());
  GetIt.I.registerSingleton(TemplateService());
  GetIt.I.registerSingleton(DeckService());
  GetIt.I.registerSingleton(GameCardService());
  GetIt.I.registerSingleton(GameService());
}

Future<void> seed() async {
  if (await GetIt.I<DeckService>().isEmpty) {
    final str = await rootBundle.loadString('assets/seeds.json');
    final json = jsonDecode(str);
    await GetIt.I<TemplateService>()
        .load((json['templates'] as List).map((e) => Template.fromJson(e)));
    await GetIt.I<DeckService>()
        .load((json['decks'] as List).map((e) => Deck.fromJson(e)));
  }
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
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
