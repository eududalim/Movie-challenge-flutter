import '../models/person_model.dart';

abstract class ListMoviesState {}

class ListMoviesSuccessState implements ListMoviesState {
  final List<MovieModel> data;

  ListMoviesSuccessState(this.data);
}

class ListMoviesErrorState implements ListMoviesState {
  final String errorMessage;
  final Object? error;

  ListMoviesErrorState(this.errorMessage, this.error);
}

class ListMoviesInitialState implements ListMoviesState {}

class PersonLoadingState implements ListMoviesState {}
