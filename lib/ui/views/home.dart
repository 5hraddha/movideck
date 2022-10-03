import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../business_logic/view_models/viewmodels.dart';
import '../../services/service_locator.dart';
import '../views/views.dart';
import '../widgets/widgets.dart';
import '../movideck_theme.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final HomeViewModel model = serviceLocator<HomeViewModel>();

  // List of section titles to display on the home view
  static const List<String> sectionTitles = [
    'Now Playing',
    'Popular',
    'Top Rated',
    'Upcoming',
  ];

  @override
  Widget build(BuildContext context) {
    final themeSwitchProvider = Provider.of<ThemeSwitchViewModel>(context);
    return ListView.builder(
      itemCount: sectionTitles.length,
      itemBuilder: (context, index) {
        return _buildMoviesSection(
            context,
            themeSwitchProvider,
            _getLoadDataMethod(model, sectionTitles[index]),
            sectionTitles[index]);
      },
    );
  }

  //Build each section of the home view
  Widget _buildMoviesSection(
    BuildContext context,
    ThemeSwitchViewModel provider,
    Function loadDataMethod,
    String sectionTitle,
  ) {
    // final currentMoviesModel = _getMovieModel(model, sectionTitle);
    return FutureBuilder<List<MovieViewModel>>(
      future: loadDataMethod(),
      builder: (context, snapshot) {
        final currentMoviesModel = _getMovieModel(model, sectionTitle);
        if (currentMoviesModel.length == 0) {
          return const SizedBox.shrink();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildSectionTitle(provider, sectionTitle),
            const SizedBox(height: 10.0),
            _buildSectionHorizontalList(currentMoviesModel),
            const SizedBox(height: 10.0),
          ],
        );
      },
    );
  }

  // Build section title
  Widget _buildSectionTitle(
      ThemeSwitchViewModel provider, String sectionTitle) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, top: 10.0),
      child: Text(
        '$sectionTitle',
        style: provider.isDark
            ? MoviDeckTheme.darkTextTheme.headline2
            : MoviDeckTheme.lightTextTheme.headline2,
      ),
    );
  }

  // Build horizontal scrollable list of movies
  Widget _buildSectionHorizontalList(List<MovieViewModel> currentMoviesModel) {
    return SizedBox(
      height: 200.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: currentMoviesModel.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetail(
                    movieId: currentMoviesModel[index].id,
                    posterUrl: currentMoviesModel[index].posterUrl,
                  ),
                ),
              );
            },
            child: MovieCard(movie: currentMoviesModel[index]),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 1.0),
      ),
    );
  }

  //Get the appropriate MovieViewModel according to the section title
  List<MovieViewModel> _getMovieModel(
      HomeViewModel model, String sectionTitle) {
    switch (sectionTitle) {
      case 'Now Playing':
        return model.nowPlayingMovies;
      case 'Popular':
        return model.popularMovies;
      case 'Top Rated':
        return model.topRatedMovies;
      case 'Upcoming':
        return model.upcomingMovies;
      default:
        return model.nowPlayingMovies;
    }
  }

  //Get the appropriate LoadDataMethod according to the section title
  Function _getLoadDataMethod(HomeViewModel model, String sectionTitle) {
    switch (sectionTitle) {
      case 'Now Playing':
        return model.loadNowPlayingMoviesData;
      case 'Popular':
        return model.loadPopularMoviesData;
      case 'Top Rated':
        return model.loadTopRatedMoviesData;
      case 'Upcoming':
        return model.loadUpcomingMoviesData;
      default:
        return model.loadNowPlayingMoviesData;
    }
  }
}
