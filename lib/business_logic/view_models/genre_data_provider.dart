import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/web_api/web_api_implementation.dart';
import '../models/genre.dart';

class GenreDataProvider {
  final Genre genre;

  GenreDataProvider({required this.genre});

  int? get id => genre.id;
  String? get name => genre.name;
}

List<GenreDataProvider> getGenres(List<Genre> futureGenres) {
  return futureGenres.map((item) => GenreDataProvider(genre: item)).toList();
}

final genreDataProvider = FutureProvider<List<Genre>>((ref) async {
  return ref.read(webApiProvider).getGenres();
});
