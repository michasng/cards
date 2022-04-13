import 'package:cards/models/model.dart';
import 'package:cards/models/template.dart';
import 'package:cards/services/template_service.dart';
import 'package:cards/util/logging.dart';
import 'package:get_it/get_it.dart';
import 'package:json_annotation/json_annotation.dart';

part 'deck.g.dart';

@JsonSerializable()
class Deck extends Model {
  String name;
  List<String> templateIds;
  Future<Iterable<Template>> get templates =>
      GetIt.I<TemplateService>().findAll(ids: templateIds);
  bool isShuffled;

  Deck({
    String? id,
    required this.name,
    required this.templateIds,
    required this.isShuffled,
  }) : super(id);

  factory Deck.fromJson(Map<String, dynamic> json) =>
      logError(_$DeckFromJson, json);

  @override
  Map<String, dynamic> toJson() => _$DeckToJson(this);
}
