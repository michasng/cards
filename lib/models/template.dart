import 'package:cards/models/common/color_data.dart';
import 'package:cards/models/model.dart';
import 'package:cards/util/logging.dart';
import 'package:json_annotation/json_annotation.dart';

part 'template.g.dart';

@JsonSerializable()
class Template extends Model {
  String template;
  bool isActive;
  ColorData color;

  Template({
    String? id,
    required this.template,
    required this.isActive,
    required this.color,
  }) : super(id);

  factory Template.fromJson(Map<String, dynamic> json) =>
      logError(_$TemplateFromJson, json);

  @override
  Map<String, dynamic> toJson() => _$TemplateToJson(this);
}
