import 'package:flutter/foundation.dart';
import '../../services/service_locator.dart';
import '../../services/web_api/web_api.dart';
import '../models/models.dart';
import 'movie_viewmodel.dart';

class HomeViewModel extends ChangeNotifier {
  final WebApi _webApi = serviceLocator<WebApi>();

  List<MovieViewModel> _nowPlayingMovies = [];
  List<MovieViewModel> _popularMovies = [];
  List<MovieViewModel> _topRatedMovies = [];
  List<MovieViewModel> _upcomingMovies = [];

  List<MovieViewModel> get nowPlayingMovies => _nowPlayingMovies;
  List<MovieViewModel> get popularMovies => _popularMovies;
  List<MovieViewModel> get topRatedMovies => _topRatedMovies;
  List<MovieViewModel> get upcomingMovies => _upcomingMovies;

  void loadData() async {
    //Load all data from different api endpoints
    _nowPlayingMovies = _getMovies(await _webApi.getNowPlayingMovies());
    _popularMovies = _getMovies(await _webApi.getPopularMovies());
    _topRatedMovies = _getMovies(await _webApi.getTopRatedMovies());
    _upcomingMovies = _getMovies(await _webApi.getUpcomingMovies());
    notifyListeners();
  }

  List<MovieViewModel> _getMovies(List<Movie> futureMovies) {
    return futureMovies.map((item) => MovieViewModel(movie: item)).toList();
  }
}
