import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  final FlutterSecureStorage _storage;

  SecureStorageHelper(this._storage);

  Future<void> write({
    required String key,
    required String value,
  }) async {
    await _storage.write(
      key: key,
      value: value,
    );
  }

  Future<String?> read({
    required String key,
  }) async {
    return _storage.read(key: key);
  }

  Future<void> delete({
    required String key,
  }) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  Future<bool> containsKey({
    required String key,
  }) async {
    return _storage.containsKey(key: key);
  }
}