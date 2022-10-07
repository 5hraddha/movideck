import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/web_api/web_api_implementation.dart';
import '../models/cast.dart';

class CastDataProvider {
  final Cast cast;

  CastDataProvider({required this.cast});

  String get name => cast.name;
  String get originalName => cast.original_name;
  String get character => cast.character;
  num get popularity => cast.popularity;
  String? get profileImageUrl => (cast.profile_path != null)
      ? 'https://image.tmdb.org/t/p/original/${cast.profile_path}'
      : null;
}

List<CastDataProvider> getCasts(List<Cast> futureCasts) {
  return futureCasts.map((item) => CastDataProvider(cast: item)).toList();
}

final castDataProvider =
    FutureProvider.family<List<Cast>, int>((ref, movieId) async {
  return ref.read(webApiProvider).getCasts(movieId);
});
