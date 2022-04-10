import 'package:flutter/widgets.dart';

class AsyncBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(BuildContext context, T value) builder;
  final Widget? progressIndicator;
  final Widget? error;

  const AsyncBuilder({
    Key? key,
    required this.future,
    required this.builder,
    this.progressIndicator,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done)
          return progressIndicator ?? Container();

        if (snapshot.hasError) return error ?? Text(snapshot.error.toString());

        return builder(context, snapshot.data!);
      },
    );
  }
}
