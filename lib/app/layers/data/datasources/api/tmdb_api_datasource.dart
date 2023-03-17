import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../shared/helpers/consts.dart';
import '../../../domain/models/result_api_model.dart';

class MoviesApiDatasource {
  final _dio = Dio(BaseOptions(baseUrl: Api.baseUrl, headers: _headers));

  /// Get the movie details (info in Api const).
  /// if success, return a ResultApiModel with list in 'object'.
  /// if error, return a ResultApiModel with the 'object' null and error message in 'error'.
  Future<ResultApiModel> getDetailsMovie() async {
    try {
      var response = await _dio.get(Api.pathDetailsMovie);
      try {
        var data = Map<String, dynamic>.from((response.data));

        if (response.statusCode == 200) {
          var results = ResultApiModel(Map<String, dynamic>.from(data));

          return results;
        } else {
          debugPrint(response.statusCode.toString());
          return ResultApiModel(null, error: data['status_message'].toString());
        }
      } on Exception catch (e) {
        debugPrint(e.toString());
        return ResultApiModel(null, error: e.toString());
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      return ResultApiModel(null, error: e.toString());
    }
  }

  /// Search and get the movies referring of query.
  /// if success, return a ResultApiModel with list in 'object'.
  /// if error, return a ResultApiModel with the 'object' null and error message in 'error'.
  Future<ResultApiModel> getMoviesSearch(String query) async {
    try {
      var response = await _dio.get(Api.pathSearchMovie(query));
      try {
        var data = Map<String, dynamic>.from((response.data));

        if (response.statusCode == 200) {
          var results =
              ResultApiModel(List<Map<String, dynamic>>.from(data['results']));

          return results;
        } else {
          debugPrint(response.statusCode.toString());
          return ResultApiModel(null, error: data['status_message'].toString());
        }
      } on Exception catch (e) {
        debugPrint(e.toString());
        return ResultApiModel(null, error: e.toString());
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      return ResultApiModel(null, error: e.toString());
    }
  }
}

const _headers = {
  'Content-Type': 'application/json; charset=UTF-8',
  'Accept': '*/*',
  'Authorization': 'Bearer ${Api.apiToken}',
};
