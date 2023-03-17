import '../models/person_model.dart';

abstract class PersonsState {}

class FilmSuccessState implements PersonsState {
  final List<PersonModel> data;

  FilmSuccessState(this.data);
}

class PersonsErrorState implements PersonsState {
  final String errorMessage;
  final Object? error;

  PersonsErrorState(this.errorMessage, this.error);
}

class PersonInitialState implements PersonsState {}

class PersonLoadingState implements PersonsState {}
