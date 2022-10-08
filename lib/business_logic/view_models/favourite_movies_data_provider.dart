import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movie_view_model.dart';

final favouriteMoviesDataProvider =
    StateProvider<List<MovieViewModel>>((ref) => []);
