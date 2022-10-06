import './movie_language.dart';

class MovieDetail {
  final int id;
  final String title;
  final String originalLanguage;
  final String overview;
  final String? posterPath;
  final int? runtime;
  final num? voteAverage;
  final int? voteCount;

  MovieDetail({
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.overview,
    required this.posterPath,
    required this.runtime,
    required this.voteAverage,
    required this.voteCount,
  });

  MovieDetail.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        title = json['title'] as String,
        originalLanguage =
            MovieDetail.getLanguage(json['original_language']).name,
        overview = json['overview'] as String,
        posterPath = json['posterPath'] as String?,
        runtime = json['runtime'] as int?,
        voteAverage = json['voteAverage'] as num?,
        voteCount = json['voteCount'] as int?;

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
