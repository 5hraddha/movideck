import './movie_language.dart';

class Movie {
  final int id;
  final String? backdropPath;
  final MovieLanguage originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final int voteCount;
  final String voteAverage;

  Movie(
      {required this.id,
      required this.backdropPath,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.video,
      required this.voteCount,
      required this.voteAverage});

  Movie.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        backdropPath = json['backdrop_path'] as String?,
        originalLanguage = Movie.getLanguage(json['original_language']),
        originalTitle = json['original_title'] as String,
        overview = json['overview'] as String,
        popularity = json['popularity'] as double,
        posterPath = json['poster_path'] as String?,
        releaseDate = json['release_date'] as String,
        title = json['title'] as String,
        video = json['video'] as bool,
        voteCount = json['vote_count'] as int,
        voteAverage = json['vote_average'].toString();

  static MovieLanguage getLanguage(String code) {
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

  @override
  String toString() {
    return 'titel: $title';
  }
}
