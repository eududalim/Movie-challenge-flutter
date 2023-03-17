import 'package:flutter_test/flutter_test.dart';
import 'package:movie_challenge_flutter/app/layers/data/datasources/api/tmdb_api_datasource.dart';
import 'package:movie_challenge_flutter/app/layers/domain/models/result_api_model.dart';

void main() {
  test('tmdb api datasource: should to get a ResultApiModel without error',
      () async {
    final api = TMDBApiDatasource();

    var result = await api.getDetailsMovie();

    print(result);

    expect(result, isA<ResultApiModel>());
    expect(result, isNotNull);
    expect(result.error, isNull);
  });
}
