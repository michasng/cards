import 'package:flutter/material.dart';

class ShrinkText extends StatelessWidget {
  final Widget child;

  const ShrinkText({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        // Fix assertion for zero-width child of FittedBox
        constraints: BoxConstraints(minWidth: 1),
        child: child,
      ),
    );
  }
}
