import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business_logic/view_models/view_models.dart';
import './movie_detail.dart';
import '../widgets/movie_card.dart';
import '../movideck_theme.dart';

class FavouriteMovies extends ConsumerWidget {
  const FavouriteMovies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Providers
    final _themeNotifier = ref.watch(themeNotifierProvider);
    final _genresDataProvider = ref.watch(genreDataProvider);
    final _favouriteMoviesDataProvider = ref.watch(favouriteMoviesDataProvider);
    return _genresDataProvider.when(
      data: (data) {
        final genreList = getGenres(data);
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: <Widget>[
              //Build section title
              _buildSectionTitle(_themeNotifier, 'Favourite Movies'),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: _buildFavouriteMoviesGrid(
                  context,
                  _themeNotifier,
                  genreList,
                  _favouriteMoviesDataProvider,
                ),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const SizedBox.shrink(),
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

  Widget _buildFavouriteMoviesGrid(
    BuildContext context,
    ThemeSwitchProvider themeNotifier,
    List<GenreDataProvider> genreList,
    List<MovieViewModel> favouriteMovies,
  ) {
    if (favouriteMovies.isEmpty) {
      return SizedBox(
        height: MediaQuery.of(context).size.height / 1.4,
        child: Center(
          child: Text(
            'No favourite movies yet!',
            style: themeNotifier.isDark
                ? MoviDeckTheme.darkTextTheme.headline2
                : MoviDeckTheme.lightTextTheme.headline2,
          ),
        ),
      );
    }

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        mainAxisExtent: 200.0,
      ),
      shrinkWrap: true,
      itemCount: favouriteMovies.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            //Get the genres of the movie
            final movieGenreList =
                _getMovieGenres(genreList, favouriteMovies[index].genreIds);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetail(
                  movieId: favouriteMovies[index].id,
                  posterUrl: favouriteMovies[index].posterUrl,
                  userRating: favouriteMovies[index].voteAverage,
                  ratingColor: favouriteMovies[index].movieRatingColor,
                  releaseDate: favouriteMovies[index].releaseDate,
                  movieGenreList: movieGenreList,
                ),
              ),
            );
          },
          child: MovieCard(
            movie: favouriteMovies[index],
            cardHeight: 200.0,
            isFavourite: true,
          ),
        );
      },
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
