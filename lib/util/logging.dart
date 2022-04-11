import 'package:logger/logger.dart';

final logger = Logger();

Tout logError<Tout, Tin>(
  Tout Function(Tin input) fn,
  Tin input,
) {
  try {
    return fn(input);
  } catch (e) {
    logger.e('$e in function ${fn.runtimeType} for $input');
    rethrow;
  }
}
