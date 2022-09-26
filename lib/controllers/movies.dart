import '../repository/repository.dart';
import '../models/models.dart';

class MovieController {
  final Repository _repository;

  MovieController(this._repository);

  Future<List<Movie>> fetchNowPlayingMovies() {
    return _repository.getNowPlayingMovies();
  }

  Future<List<Movie>> fetchPopularMovies() {
    return _repository.getPopularMovies();
  }

  Future<List<Movie>> fetchTopRatedMovies() {
    return _repository.getTopRatedMovies();
  }

  Future<List<Movie>> fetchUpcomingMovies() {
    return _repository.getUpcomingMovies();
  }
}
