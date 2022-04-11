import 'package:cards/models/model.dart';
import 'package:localstore/localstore.dart';

abstract class ModelService<T extends Model> {
  final String collectionName;
  final T Function(Map<String, dynamic> json) fromJson;

  final _db = Localstore.instance;
  CollectionRef get _collectionRef => _db.collection(collectionName);
  Future<Map<String, dynamic>> get _collection async =>
      (await _collectionRef.get())!;

  ModelService({
    required this.collectionName,
    required this.fromJson,
  });

  Future<int> get size async => (await _collection).length;
  Future<bool> get isEmpty async => (await _collectionRef.get()) == null;
  Future<bool> get isNotEmpty async => !await isEmpty;

  Future<void> load(Iterable<T> values) async {
    for (final e in values) await save(e);
  }

  Future<bool> exists(String id) async {
    return (await _collection).containsKey(id);
  }

  Future<Iterable<T>> findAll({List<String>? ids}) async {
    if (ids != null)
      return Future.wait(ids.map((id) async => await findOne(id)));

    return (await _collection).values.map((value) => fromJson(value));
  }

  Future<T> findOne(String id) async {
    final doc = (await _collectionRef.doc(id).get())!;
    return fromJson(doc);
  }

  Future<T> save(T model) async {
    final doc = _collectionRef.doc(model.id);
    model.id = doc.id;
    await doc.set(model.toJson());
    return model;
  }

  Future<T> delete(String id) async {
    final model = await findOne(id);
    _collectionRef.doc(id).delete();
    return model;
  }

  Future<void> saveChanges({
    required List<T> before,
    required List<T> after,
  }) async {
    final toRemove = before.where((e) => !after.contains(e));

    for (final e in toRemove) await delete(e.id!);
    for (final e in after) await save(e); // create or update
  }
}
