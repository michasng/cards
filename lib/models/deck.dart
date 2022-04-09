import 'package:cards/models/model.dart';
import 'package:cards/models/template.dart';
import 'package:json_annotation/json_annotation.dart';

part 'deck.g.dart';

@JsonSerializable()
class Deck extends Model {
  String name;
  List<Template> templates;

  Deck({
    String? id,
    required this.name,
    required this.templates,
  }) : super(id);

  factory Deck.fromJson(Map<String, dynamic> json) => _$DeckFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DeckToJson(this);
}
