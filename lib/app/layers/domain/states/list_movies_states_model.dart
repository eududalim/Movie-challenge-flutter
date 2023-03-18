import '../models/movie_model.dart';

abstract class MoviesState {}

class MoviesSuccessState implements MoviesState {
  final List<MovieModel> data;

  MoviesSuccessState(this.data);
}

class MoviesErrorState implements MoviesState {
  final String errorMessage;
  final Object? error;

  MoviesErrorState(this.errorMessage, this.error);
}

class MoviesInitialState implements MoviesState {}

class MoviesLoadingState implements MoviesState {}
