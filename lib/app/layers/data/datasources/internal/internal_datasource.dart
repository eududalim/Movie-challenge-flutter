import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

const _likeKey = 'likeMovie';

class InternalDatasource {
  SharedPreferences? _shared;

  get instanceShared => _shared;

  /// load instance of Shared preferences for load like movie state
  Future<void> loadInstance() async {
    _shared = await SharedPreferences.getInstance();
  }

  /// get like state of movie selected
  bool getIsFavorite() {
    try {
      var result = _shared?.getBool(_likeKey);

      return result ?? false;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  /// save like state of movie selected
  setLike(bool click) => _shared?.setBool(_likeKey, click);
}
