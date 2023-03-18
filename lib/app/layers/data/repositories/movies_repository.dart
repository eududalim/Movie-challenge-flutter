import 'package:movie_challenge_flutter/app/layers/data/datasources/api/movies_api_datasource.dart';
import 'package:movie_challenge_flutter/app/layers/domain/models/movie_model.dart';
import 'package:movie_challenge_flutter/app/layers/domain/states/list_movies_states_model.dart';

class MoviesRepository {
  final MoviesApiDatasource _apiDatasource;

  MoviesRepository(this._apiDatasource);

  /// Get the movie details (info in Api const).
  /// if success, return a MoviesSuccessState with MovieModel in list.
  /// if error, return a MoviesErrorState with error message in 'errorMessage'
  /// and error objeto (if there was) in 'error'.
  Future<MoviesState> getDetailsMovie() async {
    try {
      var result = await _apiDatasource.getDetailsMovie();
      if (result.error == null && result.object != null) {
        var movie = MovieModel.fromMap(result.object);

        return MoviesSuccessState([movie]);
      } else {
        if (result.error == null) {
          return MoviesErrorState('Unknown error', null);
        } else {
          return MoviesErrorState(result.error!, null);
        }
      }
    } catch (e) {
      return MoviesErrorState(e.toString(), e);
    }
  }

  /// Search and get the movies referring of movie main.
  /// if success, return a MoviesSuccessState with MovieModel in list.
  /// if error, return a MoviesErrorState with error message in 'errorMessage'
  /// and error objeto (if there was) in 'error'.
  Future<MoviesState> getListMovie() async {
    try {
      var result = await _apiDatasource.getMoviesSearch();
      if (result.error == null && result.object != null) {
        var list = (result.object as List<Map<String, dynamic>>)
            .map((e) => MovieModel.fromMap(e))
            .toList()
            // removal first of list, because is the movie main (details)
            .sublist(1, 7);

        return MoviesSuccessState(list);
      } else {
        if (result.error == null) {
          return MoviesErrorState('Unknown error', null);
        } else {
          return MoviesErrorState(result.error!, null);
        }
      }
    } catch (e) {
      return MoviesErrorState(e.toString(), e);
    }
  }
}
