import '../models/movie.dart';

class MovieViewModel {
  final Movie movie;

  MovieViewModel({required this.movie});

  int get id => movie.id;
  String get title => movie.title;
  String get posterUrl =>
      'https://image.tmdb.org/t/p/original/${movie.posterPath}';
  String get releaseDate => movie.releaseDate;
  String get language => movie.originalLanguage;
}