import 'package:get_it/get_it.dart';
import 'package:movie_challenge_flutter/app/layers/data/datasources/internal/internal_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../layers/presenters/controllers/details_controller.dart';
import '../../layers/data/repositories/movies_repository.dart';
import '../../layers/data/datasources/api/movies_api_datasource.dart';

GetIt inject = GetIt.I;

initInject() {
// datasources
  inject
      .registerLazySingleton<MoviesApiDatasource>(() => MoviesApiDatasource());
  inject.registerLazySingleton<InternalDatasource>(() => InternalDatasource());

//repositories
  inject.registerLazySingleton<MoviesRepository>(
      () => MoviesRepository(inject(), inject()));

// controllers
  inject.registerLazySingleton<DetailsController>(
      () => DetailsController(inject()));

  inject.registerFactoryAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
}
