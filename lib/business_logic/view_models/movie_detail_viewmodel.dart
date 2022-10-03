import 'package:flutter/foundation.dart';
import '../../services/service_locator.dart';
import '../../services/web_api/web_api.dart';
import '../models/models.dart';

class MovieDetailViewModel extends ChangeNotifier {
  final WebApi _webApi = serviceLocator<WebApi>();
  late MovieDetail _movieDetail;

  MovieDetail get movieDetail => _movieDetail;
  int get id => _movieDetail.id;
  String get title => _movieDetail.title;
  String get overview => _movieDetail.overview;
  String? get releaseDate => _movieDetail.releaseDate;
  String get language => _movieDetail.originalLanguage;
  int? get runtime => _movieDetail.runtime;

  Future<MovieDetail> loadData(int movieId) async {
    _movieDetail = await _webApi.getMovieDetail(movieId);
    notifyListeners();
    return _movieDetail;
  }
}
