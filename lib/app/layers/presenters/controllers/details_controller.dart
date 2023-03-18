import 'package:flutter/material.dart';
import 'package:movie_challenge_flutter/app/layers/data/repositories/movies_repository.dart';
import 'package:movie_challenge_flutter/app/layers/domain/states/list_movies_states_model.dart';

class DetailsController {
  final MoviesRepository _repository;
  DetailsController(this._repository);

  final movieState = ValueNotifier<MoviesState>(MoviesInitialState());

  loadDetailMovie() {
    movieState.value = MoviesLoadingState();
    _repository.getDetailsMovie().then((value) => movieState.value = value);
  }
}
