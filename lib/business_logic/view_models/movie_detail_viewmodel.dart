import 'package:flutter/foundation.dart';
import '../models/models.dart';

class MovieDetailViewModel extends ChangeNotifier {
  late MovieDetail _movieDetail;

  MovieDetail get movieDetail => _movieDetail;

  void loadData(int movieId) async {
    //Load all data from different api endpoints
    notifyListeners();
  }
}
