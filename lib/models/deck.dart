import 'package:cards/models/model.dart';
import 'package:cards/models/template.dart';
import 'package:cards/services/template_service.dart';
import 'package:get_it/get_it.dart';
import 'package:json_annotation/json_annotation.dart';

part 'deck.g.dart';

@JsonSerializable()
class Deck extends Model {
  String name;
  List<String> templateIds;
  Future<Iterable<Template>> get templates =>
      GetIt.I<TemplateService>().findAll(ids: templateIds);

  Deck({
    String? id,
    required this.name,
    required this.templateIds,
  }) : super(id);

  factory Deck.fromJson(Map<String, dynamic> json) => _$DeckFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DeckToJson(this);
}
