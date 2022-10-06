import 'package:flutter/material.dart';

import './movie_language.dart';
import './movie_rating_status.dart';

class Movie {
  final int id;
  final String originalLanguage;
  final String? posterPath;
  final String? releaseDate;
  final String title;
  final num? voteAverage;
  final List<int?> genre_ids;

  Movie({
    required this.id,
    required this.originalLanguage,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.genre_ids,
  });

  Movie.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        originalLanguage = Movie._getLanguage(json['original_language']).name,
        posterPath = json['poster_path'] as String?,
        releaseDate = json['release_date'] as String?,
        title = json['title'] as String,
        voteAverage = json['vote_average'] as num?,
        genre_ids = [] {
    if (json['genre_ids'] != null) {
      for (final item in json['genre_ids']) {
        genre_ids.add(item as int);
      }
    }
  }

  static MovieLanguage _getLanguage(String code) {
    switch (code) {
      case 'de':
        return MovieLanguage.de;
      case 'en':
        return MovieLanguage.en;
      case 'es':
        return MovieLanguage.es;
      case 'fr':
        return MovieLanguage.fr;
      case 'hi':
        return MovieLanguage.hi;
      case 'it':
        return MovieLanguage.it;
      case 'ja':
        return MovieLanguage.ja;
      case 'ko':
        return MovieLanguage.ko;
      case 'ml':
        return MovieLanguage.ml;
      case 'mr':
        return MovieLanguage.mr;
      case 'pa':
        return MovieLanguage.pa;
      case 'ta':
        return MovieLanguage.ta;
      default:
        return MovieLanguage.en;
    }
  }

  // Get the color to show movie rating in the movie card
  static Color getMovieRatingColor(num? voteAverage) {
    final userRating = ((voteAverage ?? 0) * 10).ceil();
    if (userRating >= 70) {
      return MovieRatingStatus.good.color;
    } else if (userRating < 70 && userRating >= 50) {
      return MovieRatingStatus.ok.color;
    } else {
      return MovieRatingStatus.bad.color;
    }
  }

  @override
  String toString() {
    return 'titel: $title';
  }
}
