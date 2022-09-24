import 'package:flutter/material.dart';
import '../components/components.dart';
import '../movideck_theme.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  final List<String> movieCategories = const [
    'Now Playing',
    'New Releases',
    'Popular Movies',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movieCategories.length,
        itemBuilder: (context, index) {
          return _buildMovieCategory(movieCategories[index]);
        });
  }

  Widget _buildMovieCategory(String category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text(
            '$category',
            style: MoviDeckTheme.lightTextTheme.headline2,
          ),
        ),
        const SizedBox(height: 16.0),
        Container(
          height: 200.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              return const MovieCard();
            },
            separatorBuilder: (context, index) => const SizedBox(width: 1.0),
          ),
        ),
        const SizedBox(height: 37.0),
      ],
    );
  }
}
