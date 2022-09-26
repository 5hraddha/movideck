import 'package:flutter/material.dart';
import '../components/components.dart';
import '../controllers/movies.dart';
import '../models/models.dart';
import '../screens/screens.dart';
import '../repository/movie_repository.dart';
import '../movideck_theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = MovieController(MovieRepository());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildMoviesSection(
            context,
            _controller.fetchNowPlayingMovies,
            'Now Playing',
          ),
          _buildMoviesSection(
            context,
            _controller.fetchPopularMovies,
            'Popular',
          ),
          _buildMoviesSection(
            context,
            _controller.fetchTopRatedMovies,
            'Top Rated',
          ),
          _buildMoviesSection(
            context,
            _controller.fetchUpcomingMovies,
            'Upcoming',
          ),
        ],
      ),
    );
  }

  Widget _buildMoviesSection(
    BuildContext context,
    Function apiMethod,
    String sectionTitle,
  ) {
    return FutureBuilder<List<Movie>>(
      future: apiMethod(),
      builder: (context, snapshot) {
        final movies = snapshot.data;
        if (movies == null) {
          return const SizedBox.shrink();
        }
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
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FutureBuilder(
                            future:
                                _controller.fetchMovieDetail(movies[index].id),
                            builder: (context, snapshot) {
                              final movieDetail = snapshot.data;
                              if (movieDetail == null) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return MovieDetailScreen(
                                imageUrl: movies[index].posterPath!,
                                movieDetail: movieDetail,
                              );
                            },
                          ),
                        ),
                      );
                    },
                    child: MovieCard(movie: movies[index]),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 1.0),
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        );
      },
    );
  }
}
