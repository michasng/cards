import 'package:cards/models/model.dart';
import 'package:cards/models/template.dart';
import 'package:cards/services/template_service.dart';
import 'package:get_it/get_it.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_card.g.dart';

@JsonSerializable()
class GameCard extends Model {
  String templateId;
  Future<Template> get template =>
      GetIt.I<TemplateService>().findOne(templateId);
  String text;

  GameCard({
    String? id,
    required this.templateId,
    required this.text,
  }) : super(id);

  factory GameCard.fromJson(Map<String, dynamic> json) =>
      _$GameCardFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GameCardToJson(this);
}
