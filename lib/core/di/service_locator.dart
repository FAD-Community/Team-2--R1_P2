import 'package:fix_now_team_2/core/cache/storage/secure_storage_helper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final getIT = GetIt.instance;

void setupServiceLocator() {
  getIT.registerLazySingleton<SecureStorageHelper>(
    () => SecureStorageHelper(const FlutterSecureStorage()),
  );
}
