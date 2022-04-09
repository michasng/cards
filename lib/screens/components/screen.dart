import 'package:cards/constants.dart';
import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget child;
  final FloatingActionButton? floatingActionButton;

  const Screen({
    Key? key,
    this.appBar,
    required this.child,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: child,
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
