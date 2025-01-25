import 'package:get_it/get_it.dart';
import 'package:madagascar_workcoode/data/repository/work_code_repository_impl.dart';
import 'package:madagascar_workcoode/domain/repository/work_code_repository.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<WorkCodeRepository>(
      () => WorkCodeRepositoryImpl());
}
