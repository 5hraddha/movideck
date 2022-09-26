import '../models/models.dart';

abstract class Repository {
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
  Future<List<Movie>> getUpcomingMovies();
  Future<MovieDetail> getMovieDetail(int movieId);
}
