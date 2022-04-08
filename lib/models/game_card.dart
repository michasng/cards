import 'package:cards/models/model.dart';
import 'package:cards/models/template.dart';
import 'package:cards/services/template_service.dart';
import 'package:get_it/get_it.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_card.g.dart';

@JsonSerializable()
class GameCard extends Model {
  final int templateId;
  final String text;

  const GameCard(
    int id, {
    required this.templateId,
    required this.text,
  }) : super(id);

  Template get template => GetIt.I<TemplateService>().findOne(templateId);

  factory GameCard.fromJson(Map<String, dynamic> json) =>
      _$GameCardFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GameCardToJson(this);
}
