import 'package:flutter/foundation.dart';
import '../../services/web_api/web_api.dart';
import '../../services/web_api/web_api_implementation.dart';
import '../models/models.dart';
import 'movie_viewmodel.dart';

class HomeViewModel extends ChangeNotifier {
  final WebApi _webApi = WebApiImplementation();

  List<MovieViewModel> _nowPlayingMovies = [];
  List<MovieViewModel> _popularMovies = [];
  List<MovieViewModel> _topRatedMovies = [];
  List<MovieViewModel> _upcomingMovies = [];

  List<MovieViewModel> get nowPlayingMovies => _nowPlayingMovies;
  List<MovieViewModel> get popularMovies => _popularMovies;
  List<MovieViewModel> get topRatedMovies => _topRatedMovies;
  List<MovieViewModel> get upcomingMovies => _upcomingMovies;

  // Get all the data from the web api
  Future<List<MovieViewModel>> loadNowPlayingMoviesData() async {
    _nowPlayingMovies = _getMovies(await _webApi.getNowPlayingMovies());
    notifyListeners();
    return _nowPlayingMovies;
  }

  Future<List<MovieViewModel>> loadPopularMoviesData() async {
    _popularMovies = _getMovies(await _webApi.getPopularMovies());
    notifyListeners();
    return _popularMovies;
  }

  Future<List<MovieViewModel>> loadTopRatedMoviesData() async {
    _topRatedMovies = _getMovies(await _webApi.getTopRatedMovies());
    notifyListeners();
    return _topRatedMovies;
  }

  Future<List<MovieViewModel>> loadUpcomingMoviesData() async {
    _upcomingMovies = _getMovies(await _webApi.getUpcomingMovies());
    notifyListeners();
    return _upcomingMovies;
  }

  List<MovieViewModel> _getMovies(List<Movie> futureMovies) {
    return futureMovies.map((item) => MovieViewModel(movie: item)).toList();
  }
}
