// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import 'screens/deck/deck.screen.dart' as _i3;
import 'screens/game/game_screen.dart' as _i2;
import 'screens/home/home_screen.dart' as _i1;
import 'screens/template/template_screen.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeScreen());
    },
    GameRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<GameRouteArgs>(
          orElse: () => GameRouteArgs(deckId: queryParams.optInt('deckId')));
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.GameScreen(key: args.key, deckId: args.deckId));
    },
    DeckRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<DeckRouteArgs>(
          orElse: () => DeckRouteArgs(
              deckId: pathParams.getInt('deckId'),
              isEditing: queryParams.getBool('isEditing', false)));
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.DeckScreen(
              key: args.key, deckId: args.deckId, isEditing: args.isEditing));
    },
    TemplateRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TemplateRouteArgs>(
          orElse: () =>
              TemplateRouteArgs(templateId: pathParams.getInt('templateId')));
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i4.TemplateScreen(key: args.key, templateId: args.templateId));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        _i5.RouteConfig(HomeRoute.name, path: '/home', usesPathAsKey: true),
        _i5.RouteConfig(GameRoute.name, path: '/game', usesPathAsKey: true),
        _i5.RouteConfig(DeckRoute.name,
            path: '/deck/:deckId', usesPathAsKey: true),
        _i5.RouteConfig(TemplateRoute.name,
            path: '/card/:templateId', usesPathAsKey: true)
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.GameScreen]
class GameRoute extends _i5.PageRouteInfo<GameRouteArgs> {
  GameRoute({_i6.Key? key, int? deckId})
      : super(GameRoute.name,
            path: '/game',
            args: GameRouteArgs(key: key, deckId: deckId),
            rawQueryParams: {'deckId': deckId});

  static const String name = 'GameRoute';
}

class GameRouteArgs {
  const GameRouteArgs({this.key, this.deckId});

  final _i6.Key? key;

  final int? deckId;

  @override
  String toString() {
    return 'GameRouteArgs{key: $key, deckId: $deckId}';
  }
}

/// generated route for
/// [_i3.DeckScreen]
class DeckRoute extends _i5.PageRouteInfo<DeckRouteArgs> {
  DeckRoute({_i6.Key? key, required int deckId, bool isEditing = false})
      : super(DeckRoute.name,
            path: '/deck/:deckId',
            args: DeckRouteArgs(key: key, deckId: deckId, isEditing: isEditing),
            rawPathParams: {'deckId': deckId},
            rawQueryParams: {'isEditing': isEditing});

  static const String name = 'DeckRoute';
}

class DeckRouteArgs {
  const DeckRouteArgs({this.key, required this.deckId, this.isEditing = false});

  final _i6.Key? key;

  final int deckId;

  final bool isEditing;

  @override
  String toString() {
    return 'DeckRouteArgs{key: $key, deckId: $deckId, isEditing: $isEditing}';
  }
}

/// generated route for
/// [_i4.TemplateScreen]
class TemplateRoute extends _i5.PageRouteInfo<TemplateRouteArgs> {
  TemplateRoute({_i6.Key? key, required int templateId})
      : super(TemplateRoute.name,
            path: '/card/:templateId',
            args: TemplateRouteArgs(key: key, templateId: templateId),
            rawPathParams: {'templateId': templateId});

  static const String name = 'TemplateRoute';
}

class TemplateRouteArgs {
  const TemplateRouteArgs({this.key, required this.templateId});

  final _i6.Key? key;

  final int templateId;

  @override
  String toString() {
    return 'TemplateRouteArgs{key: $key, templateId: $templateId}';
  }
}
