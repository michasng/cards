import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

part 'color_data.g.dart';

@JsonSerializable()
class ColorData {
  final int red, green, blue, alpha;

  const ColorData({
    required this.red,
    required this.green,
    required this.blue,
    this.alpha = 255,
  });

  Color get color => Color.fromARGB(alpha, red, green, blue);
  Color get contrastColor =>
      color.computeLuminance() < 0.5 ? Color(0xFFFFFFFF) : Color(0xFF000000);

  factory ColorData.fromJson(Map<String, dynamic> json) =>
      _$ColorDataFromJson(json);

  Map<String, dynamic> toJson() => _$ColorDataToJson(this);
}
