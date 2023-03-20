import 'package:flutter_test/flutter_test.dart';
import 'package:movie_challenge_flutter/app/layers/data/datasources/api/movies_api_datasource.dart';
import 'package:movie_challenge_flutter/app/layers/domain/models/result_api_model.dart';

void main() {
  test(
      'tmdb api datasource: getDetailsMovie should to get a ResultApiModel without error',
      () async {
    final api = MoviesApiDatasource();

    var result = await api.getDetailsMovie();

    print(result);

    expect(result, isA<ResultApiModel>());
    expect(result, isNotNull);
    expect(result.error, isNull);
  });

  test(
      'tmdb api datasource: getMoviesSearch should to get a ResultApiModel with list of maps with',
      () async {
    final api = MoviesApiDatasource();

    var result2 = await api.getMoviesSearch(query: 'Lord of the Rings');

    print(result2);
  });
}
