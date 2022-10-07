import '../../business_logic/models/models.dart';

abstract class WebApi {
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
  Future<List<Movie>> getUpcomingMovies();
  Future<MovieDetail> getMovieDetail(int movieId);
  Future<List<Genre>> getGenres();
  Future<List<Cast>> getCasts(int movieId);
}
