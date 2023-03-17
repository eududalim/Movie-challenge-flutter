import '../../layers/data/repositories/persons_repository.dart';
import '../../layers/presenters/controllers/persons_controller.dart';
import 'package:get_it/get_it.dart';
import '../../layers/presenters/controllers/theme_controller.dart';
import '../../layers/data/datasources/api/swapi_api_datasource.dart';

GetIt inject = GetIt.I;

initInject() {
// datasources
  inject.registerLazySingleton<SwapiApiDatasource>(() => SwapiApiDatasource());

//repositories
  inject.registerLazySingleton<PersonsRepository>(
      () => PersonsRepository(inject()));

// controllers
  inject.registerLazySingleton<PersonsController>(
      () => PersonsController(inject()));
  inject.registerLazySingleton<ThemeController>(() => ThemeController());
}
