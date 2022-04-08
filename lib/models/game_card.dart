import 'package:cards/models/model.dart';
import 'package:cards/models/template.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_card.g.dart';

@JsonSerializable()
class GameCard extends Model {
  final Template template;
  final String text;

  GameCard({
    String? id,
    required this.template,
    required this.text,
  }) : super(id);

  factory GameCard.fromJson(Map<String, dynamic> json) =>
      _$GameCardFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GameCardToJson(this);
}
