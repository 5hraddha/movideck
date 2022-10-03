import 'package:flutter/material.dart';

import '../../business_logic/view_models/movie_viewmodel.dart';
import '../../services/service_locator.dart';
import '../../business_logic/view_models/home_viewmodel.dart';
import '../views/views.dart';
import '../widgets/widgets.dart';
import '../movideck_theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeViewModel model = serviceLocator<HomeViewModel>();
  static const List<String> sectionTitles = [
    'Now Playing',
    'Popular',
    'Top Rated',
    'Upcoming',
  ];

  @override
  void initState() {
    model.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sectionTitles.length,
      itemBuilder: (context, index) {
        return _buildMoviesSection(context, model, sectionTitles[index]);
      },
    );
  }

  Widget _buildMoviesSection(
    BuildContext context,
    HomeViewModel model,
    String sectionTitle,
  ) {
    final currentMoviesModel = _getMovieModel(model, sectionTitle);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 18.0, top: 10.0),
          child: Text(
            '$sectionTitle',
            style: MoviDeckTheme.lightTextTheme.headline2,
          ),
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: 200.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: currentMoviesModel.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => FutureBuilder(
                  //    future: _controller.fetchMovieDetail(movies[index].id),
                  //       builder: (context, snapshot) {
                  //         final movieDetail = snapshot.data;
                  //         if (movieDetail == null) {
                  //           return const Center(
                  //             child: CircularProgressIndicator(),
                  //           );
                  //         }
                  //         return MovieDetailScreen(
                  //           imageUrl: movies[index].posterPath!,
                  //           movieDetail: movieDetail,
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // );
                },
                child: MovieCard(movie: currentMoviesModel[index]),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 1.0),
          ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }

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
}
