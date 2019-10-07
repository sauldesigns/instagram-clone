import 'package:get_it/get_it.dart';
import 'package:instagram/services/api.dart';
import 'package:instagram/services/database.dart';

GetIt locator = GetIt.instance;


void setupLocator() {
  locator.registerLazySingleton(() => PhotoApi('photos'));
  locator.registerLazySingleton(() => UserApi('users'));
  locator.registerLazySingleton(() => PhotoCardModel());
}
