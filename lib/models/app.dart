import 'package:cards/models/deck.dart';
import 'package:cards/models/game.dart';
import 'package:cards/models/model.dart';
import 'package:cards/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app.g.dart';

@JsonSerializable()
class App extends Model {
  List<Deck> decks;
  List<User> users;
  Game? game;

  App({
    String? id,
    required this.decks,
    required this.users,
    required this.game,
  }) : super(id);

  factory App.fromJson(Map<String, dynamic> json) => _$AppFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AppToJson(this);
}
