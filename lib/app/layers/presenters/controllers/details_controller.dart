import 'package:flutter/material.dart' show ValueNotifier;
import '../../data/repositories/movies_repository.dart';
import '../../domain/states/list_movies_states_model.dart';

class DetailsController {
  final MoviesRepository _repository;

  DetailsController(this._repository) {
    like.value = _repository.getIsFavorite();
  }
  final movieState = ValueNotifier<MoviesState>(MoviesInitialState());

  /// get movie data from api and load details
  loadDetailMovie() {
    movieState.value = MoviesLoadingState();
    _repository.getDetailsMovie().then((value) => movieState.value = value);
  }

  final like = ValueNotifier(false);

  /// set button of like
  setLike(bool click) {
    like.value = click;
    _repository.setLike(click);
  }

  final listMoviesState = ValueNotifier<MoviesState>(MoviesInitialState());

  /// load list similar movies
  loadListMovies() {
    listMoviesState.value = MoviesLoadingState();
    _repository.getListMovie().then((value) => listMoviesState.value = value);
  }
}
