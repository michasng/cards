Iterable<T> withSeparator<T>({
  required Iterable<T> list,
  required T separator,
}) sync* {
  int index = 0;
  for (var e in list) {
    yield e;
    if (index != list.length - 1) yield separator;
    index++;
  }
}
