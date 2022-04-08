import 'package:cards/models/model.dart';

extension _NumericId on Model {
  get numericId => int.parse(id!);
}

abstract class ModelService<T extends Model> {
  final List<T> _collection = [];

  int get size => _collection.length;

  int _index(String id) {
    return _collection.indexWhere((e) => e.id == id);
  }

  int _generateNewNumericId() {
    if (size == 0) return 0;
    return _collection
            .reduce((e1, e2) => e1.numericId > e2.numericId ? e1 : e2)
            .numericId +
        1;
  }

  void load(Iterable<T> values) {
    var nextId = _generateNewNumericId();
    _collection.addAll(values.map((e) => e.withId((nextId++).toString()) as T));
  }

  bool exists(String id) {
    return _collection.any((e) => e.id == id);
  }

  List<T> findAll({List<String>? ids}) {
    if (ids == null) return _collection;

    return ids.map((id) => findOne(id)).toList();
  }

  T findOne(String id) {
    return _collection[_index(id)];
  }

  T create(T model) {
    if (model.id == null) model.withId(_generateNewNumericId().toString());
    _collection.add(model);
    return model;
  }

  T update(T model) {
    _collection[_index(model.id!)] = model;
    return model;
  }

  T createOrUpdate(T model) {
    if (model.id != null && exists(model.id!)) return update(model);
    return create(model);
  }

  T remove(String id) {
    return _collection.removeAt(_index(id));
  }
}
