import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/web_api/web_api_implementation.dart';
import '../models/models.dart';
import 'movie_view_model.dart';

List<MovieViewModel> getMovies(List<Movie> futureMovies) {
  return futureMovies.map((item) => MovieViewModel(movie: item)).toList();
}

//Get now playing movies
final nowPlayingMoviesDataProvider = FutureProvider<List<Movie>>((ref) async {
  return ref.read(webApiProvider).getNowPlayingMovies();
});

//Get popular movies
final popularMoviesDataProvider = FutureProvider<List<Movie>>((ref) async {
  return ref.read(webApiProvider).getPopularMovies();
});

//Get top rated movies
final topRatedMoviesDataProvider = FutureProvider<List<Movie>>((ref) async {
  return ref.read(webApiProvider).getTopRatedMovies();
});

//Get upcoming movies
final upcomingMoviesDataProvider = FutureProvider<List<Movie>>((ref) async {
  return ref.read(webApiProvider).getUpcomingMovies();
});
