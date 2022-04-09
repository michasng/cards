import 'package:cards/util/divide.dart';
import 'package:flutter/widgets.dart';

class SplitRow extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final Iterable<Widget> children;
  final Widget divider;

  const SplitRow({
    Key? key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    required this.children,
    required this.divider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: withSeparator(list: children, separator: divider).toList(),
    );
  }
}
