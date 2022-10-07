import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/web_api/web_api_implementation.dart';
import '../models/movie_detail.dart';

class MovieDetailDataProvider {
  final MovieDetail movieDetail;

  MovieDetailDataProvider({required this.movieDetail});

  int get id => movieDetail.id;
  String get title => movieDetail.title;
  String get overview => movieDetail.overview;
  String get language => movieDetail.originalLanguage;
  int? get runtime => movieDetail.runtime;
}

//Get movie detail from model
MovieDetailDataProvider getMovieDetail(MovieDetail movieDetail) {
  return MovieDetailDataProvider(movieDetail: movieDetail);
}

//Get movie details
final movieDetailsDataProvider =
    FutureProvider.family<MovieDetail, int>((ref, movieId) async {
  return ref.read(webApiProvider).getMovieDetail(movieId);
});
