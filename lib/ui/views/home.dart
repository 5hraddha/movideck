import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business_logic/view_models/genre_data_provider.dart';
import '../../business_logic/view_models/view_models.dart';
import '../views/views.dart';
import '../widgets/widgets.dart';
import '../movideck_theme.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  // List of section titles to display on the home view
  static const List<String> sectionTitles = [
    'Now Playing',
    'Popular',
    'Top Rated',
    'Upcoming',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Providers
    final _themeNotifier = ref.watch(themeNotifierProvider);
    final _genresDataProvider = ref.watch(genreDataProvider);
    final _nowPlayingMoviesDataProvider =
        ref.watch(nowPlayingMoviesDataProvider);
    final _popularMoviesDataProvider = ref.watch(popularMoviesDataProvider);
    final _topRatedMoviesDataProvider = ref.watch(topRatedMoviesDataProvider);
    final _upcomingMoviesDataProvider = ref.watch(upcomingMoviesDataProvider);
    final _dataProviders = [
      _nowPlayingMoviesDataProvider,
      _popularMoviesDataProvider,
      _topRatedMoviesDataProvider,
      _upcomingMoviesDataProvider,
    ];

    return Container(
      child: _genresDataProvider.when(
        data: (data) {
          final genreList = getGenres(data);
          return ListView.builder(
              itemCount: sectionTitles.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Build section title
                    _buildSectionTitle(_themeNotifier, sectionTitles[index]),
                    const SizedBox(height: 10.0),
                    //Build the horizontal scrollable section list
                    _dataProviders[index].when(
                      data: (data) {
                        final movieViewModelData = getMovies(data);
                        return _buildSectionHorizontalList(
                            movieViewModelData, genreList);
                      },
                      error: (error, stackTrace) => Text(error.toString()),
                      loading: () => const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 10.0),
                  ],
                );
              });
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const SizedBox.shrink(),
      ),
    );
  }

  // Build section title
  Widget _buildSectionTitle(
      ThemeSwitchProvider themeNotifier, String sectionTitle) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, top: 10.0),
      child: Text(
        '$sectionTitle',
        style: themeNotifier.isDark
            ? MoviDeckTheme.darkTextTheme.headline2
            : MoviDeckTheme.lightTextTheme.headline2,
      ),
    );
  }

  //Build the horizontal scrollable section list
  Widget _buildSectionHorizontalList(
    List<MovieViewModel> movieViewModelData,
    List<GenreDataProvider> genreList,
  ) {
    return SizedBox(
      height: 200.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: movieViewModelData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              //Get the genres of the movie
              final movieGenreList = _getMovieGenres(
                  genreList, movieViewModelData[index].genreIds);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetail(
                    movieId: movieViewModelData[index].id,
                    posterUrl: movieViewModelData[index].posterUrl,
                    userRating: movieViewModelData[index].voteAverage,
                    ratingColor: movieViewModelData[index].movieRatingColor,
                    releaseDate: movieViewModelData[index].releaseDate,
                    movieGenreList: movieGenreList,
                  ),
                ),
              );
            },
            child: MovieCard(movie: movieViewModelData[index]),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 1.0),
      ),
    );
  }

  //Get the genres of the movie
  List<String?> _getMovieGenres(
      List<GenreDataProvider> genreList, List<int?>? genre_ids) {
    final List<String?> movieGenreList = [];
    for (final movieGenreId in genre_ids!) {
      for (final genreData in genreList) {
        if (movieGenreId == genreData.id) {
          movieGenreList.add(genreData.name);
        }
      }
    }
    return movieGenreList;
  }
}
