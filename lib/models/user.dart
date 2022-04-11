import 'package:cards/models/model.dart';
import 'package:cards/util/logging.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Model {
  String name;

  User({
    String? id,
    required this.name,
  }) : super(id);

  factory User.fromJson(Map<String, dynamic> json) =>
      logError(_$UserFromJson, json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
