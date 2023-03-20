import 'package:flutter_test/flutter_test.dart';
import 'package:movie_challenge_flutter/app/layers/data/datasources/internal/internal_datasource.dart';

void main() {
  test('internal datasource: shold be load Shared Instance', () async {
    final internal = InternalDatasource();

    await internal.loadInstance();

    expect(internal.instanceShared, isNotNull);
  });
}
