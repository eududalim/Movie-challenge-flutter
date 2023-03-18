import 'dart:developer';

import 'package:flutter/material.dart' show ValueNotifier;
import '../../data/repositories/movies_repository.dart';
import '../../domain/states/list_movies_states_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const likeKey = 'likeMovie';

class DetailsController {
  final MoviesRepository _repository;

  DetailsController(this._repository) {
    SharedPreferences.getInstance().then((instance) {
      try {
        var result = instance.getBool(likeKey);

        if (result != null) {
          like.value = result;
        }
      } on Exception catch (e) {
        log(e.toString());
      }
    });
  }
  final movieState = ValueNotifier<MoviesState>(MoviesInitialState());

  loadDetailMovie() {
    movieState.value = MoviesLoadingState();
    _repository.getDetailsMovie().then((value) => movieState.value = value);
  }

  final like = ValueNotifier(false);

  setLike(bool click) {
    like.value = click;

    SharedPreferences.getInstance().then((instance) {
      instance.setBool(likeKey, click);
    });
  }
}
