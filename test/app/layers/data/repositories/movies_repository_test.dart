import 'package:flutter_test/flutter_test.dart';
import 'package:movie_challenge_flutter/app/layers/data/datasources/api/movies_api_datasource.dart';
import 'package:movie_challenge_flutter/app/layers/data/repositories/movies_repository.dart';
import 'package:movie_challenge_flutter/app/layers/domain/states/list_movies_states_model.dart';

void main() {
  test('movies repository: get movie details and return a MoviesStateSuccess',
      () async {
    final repository = MoviesRepository(MoviesApiDatasource());

    final result = await repository.getDetailsMovie();

    expect(result, isA<MoviesState>());
    expect(result, isA<MoviesSuccessState>());
    assert(result is MoviesSuccessState);
  });

  test(
      'movies repository: get list movies refering of Movie Main (of query)  and return a MoviesStateSuccess',
      () async {
    final repository = MoviesRepository(MoviesApiDatasource());

    final result = await repository.getListMovie();

    expect(result, isA<MoviesState>());
    assert(result is MoviesSuccessState);
  });
}
