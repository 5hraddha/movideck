import '../repository/repository.dart';
import '../models/models.dart';

class MovieController {
  final Repository _repository;

  MovieController(this._repository);

  Future<List<Movie>> fetchNowPlayingMovies() {
    return _repository.getNowPlayingMovies();
  }
}
