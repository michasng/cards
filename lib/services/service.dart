import 'dart:convert';

import 'package:cards/models/model.dart';
import 'package:flutter/services.dart';

abstract class Service<T extends Model> {
  final List<T> _collection = [];
  final String collectionName;
  final T Function(Map<String, dynamic> json) fromJson;

  int get size => _collection.length;

  Service({
    required this.collectionName,
    required this.fromJson,
  });

  Future<void> seed() async {
    final str =
        await rootBundle.loadString('assets/seeds/$collectionName.json');
    final seeds = (jsonDecode(str) as List).map((e) => fromJson(e));
    _collection.addAll(seeds);
  }

  int _index(int id) {
    return _collection.indexWhere((e) => e.id == id);
  }

  int generateId() {
    if (size == 0) return 0;
    return _collection.reduce((e1, e2) => e1.id > e2.id ? e1 : e2).id + 1;
  }

  List<T> findAll({List<int>? ids}) {
    if (ids == null) return _collection;

    return ids.map((id) => findOne(id)).toList();
  }

  T findOne(int id) {
    return _collection[_index(id)];
  }

  T create(T model) {
    _collection.add(model);
    return model;
  }

  T update(T model) {
    _collection[_index(model.id)] = model;
    return model;
  }

  T remove(int id) {
    return _collection.removeAt(_index(id));
  }
}
