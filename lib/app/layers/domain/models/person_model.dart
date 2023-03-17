import 'dart:convert';

class MovieModel {
  String title;
  String imgPath;
  int likes;
  int views;

  MovieModel({
    required this.title,
    required this.imgPath,
    required this.likes,
    required this.views,
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
    return MovieModel(
      title: map['title'] ?? '',
      imgPath: map['poster_path'] ?? '',
      likes: map['vote_count']?.toInt() ?? 0,
      views: map['popularity']?.toInt() ?? 0,
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
