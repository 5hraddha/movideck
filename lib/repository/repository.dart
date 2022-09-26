import '../models/models.dart';

abstract class Repository {
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> getPopularMovies();
}
