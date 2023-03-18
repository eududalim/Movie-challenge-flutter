import 'package:get_it/get_it.dart';

import '../../layers/presenters/controllers/details_controller.dart';
import '../../layers/data/repositories/movies_repository.dart';
import '../../layers/data/datasources/api/movies_api_datasource.dart';

GetIt inject = GetIt.I;

initInject() {
// datasources
  inject
      .registerLazySingleton<MoviesApiDatasource>(() => MoviesApiDatasource());

//repositories
  inject.registerLazySingleton<MoviesRepository>(
      () => MoviesRepository(inject()));

// controllers
  inject.registerLazySingleton<DetailsController>(
      () => DetailsController(inject()));
}
