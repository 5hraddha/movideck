class Movie {
  final int id;
  final String? backdropPath;
  final String originalLanguage;
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
        originalLanguage = json['original_language'] as String,
        originalTitle = json['original_title'] as String,
        overview = json['overview'] as String,
        popularity = json['popularity'] as double,
        posterPath = json['poster_path'] as String?,
        releaseDate = json['release_date'] as String,
        title = json['title'] as String,
        video = json['video'] as bool,
        voteCount = json['vote_count'] as int,
        voteAverage = json['vote_average'].toString();

  @override
  String toString() {
    return 'titel: $title';
  }
}
