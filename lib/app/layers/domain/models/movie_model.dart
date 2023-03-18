import 'dart:convert';

import 'package:movie_challenge_flutter/app/shared/helpers/genres_const.dart';

class MovieModel {
  String title;
  String imgPath;
  int likes;
  int views;
  String yearRelease;
  List<String?> listGenres;

  MovieModel({
    required this.title,
    required this.imgPath,
    required this.likes,
    required this.views,
    required this.yearRelease,
    required this.listGenres,
  });

  MovieModel copyWith({
    String? title,
    String? imgPath,
    int? likes,
    int? views,
  }) {
    return MovieModel(
      title: title ?? this.title,
      imgPath: imgPath ?? this.imgPath,
      likes: likes ?? this.likes,
      views: views ?? this.views,
      yearRelease: '',
      listGenres: [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'imgPath': imgPath,
      'likes': likes,
      'views': views,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    List<String?> genres = [];

    if (map['genres'] != null) {
      //     log(map['title']);
      genres =
          (map['genres'] as List).map((e) => e['name'].toString()).toList();
    } else if (map['genre_ids'] != null) {
      //     log(map['title']);
      genres = (map['genre_ids'] as List)
          .map((e) => Genres.genresList[e].toString())
          .toList();
    }

    return MovieModel(
      title: map['title'] ?? '',
      imgPath: map['poster_path'] ?? '',
      likes: map['vote_count']?.toInt() ?? 0,
      views: map['popularity']?.toInt() ?? 0,
      yearRelease: map['release_date'].toString().split('-')[0],
      listGenres: genres,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PersonModel(title: $title, imgPath: $imgPath, likes: $likes, views: $views)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieModel &&
        other.title == title &&
        other.imgPath == imgPath &&
        other.likes == likes &&
        other.views == views;
  }

  @override
  int get hashCode {
    return title.hashCode ^ imgPath.hashCode ^ likes.hashCode ^ views.hashCode;
  }
}
