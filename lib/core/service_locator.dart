import 'package:get_it/get_it.dart';
import 'package:madagascar_workcoode/data/repository/work_code_repository_impl.dart';
import 'package:madagascar_workcoode/domain/repository/work_code_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future setupLocator() async{
  locator.registerLazySingleton<WorkCodeRepository>(
      () => WorkCodeRepositoryImpl());
  locator.registerLazySingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );
  await locator.isReady<SharedPreferences>();
}
