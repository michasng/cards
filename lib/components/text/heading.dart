import 'package:cards/constants.dart';
import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String data;

  const Heading(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Text(
        data,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
