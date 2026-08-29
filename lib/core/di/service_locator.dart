import 'package:dio/dio.dart';
// import 'package:fix_now_team_2/core/cache/storage/secure_storage_helper.dart';
import 'package:fix_now_team_2/core/networking/api_consumer.dart';
import 'package:fix_now_team_2/core/networking/dio_consumer.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final getIT = GetIt.instance;

void setupServiceLocator() {
  // getIT.registerLazySingleton<SecureStorageHelper>(
  //   () => SecureStorageHelper(const FlutterSecureStorage()),
  // );

getIT.registerLazySingleton<Dio>(
  () => Dio(),
);

getIT.registerLazySingleton<ApiConsumer>(
  () => DioConsumer(getIT<Dio>()),
);
}
