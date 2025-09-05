import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class _HiveDataSource {
  _HiveDataSource();
  void registerAdapter<T>(final TypeAdapter<T> adapter) {
    Hive.registerAdapter<T>(adapter);
  }

  @protected
  Future<bool> _isOpen(final String instanceName) async {
    final exists = Hive.isBoxOpen(instanceName);
    debugPrint('--BOX [$instanceName] was open? $exists');
    return exists;
  }

  @protected
  Future<Box<D>> openDb<D>(final String instanceName) async =>
      await _isOpen(instanceName)
      ? Hive.box<D>(instanceName)
      : await Hive.openBox<D>(
          instanceName,
          path: kIsWeb ? null : (await getApplicationDocumentsDirectory()).path,
        );

  @protected
  Future<void> dismissDb<D>(final String instanceName) async =>
      await _isOpen(instanceName) ? Hive.box<D>(instanceName).close() : null;
}

abstract class CacheRepository {
  CacheRepository();

  final _HiveDataSource _repository = _HiveDataSource();
  void initializeAdapter<T>(final TypeAdapter<T> adapter) =>
      _repository.registerAdapter<T>(adapter);

  @protected
  String get instanceName;
  Future<Box<D>> open<D>() => _repository.openDb<D>(instanceName);
  Future<void> dismiss<D>() => _repository.dismissDb<D>(instanceName);
}
