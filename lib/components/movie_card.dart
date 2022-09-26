import 'package:flutter/material.dart';
import '../models/models.dart';
import '../movideck_theme.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.0,
      width: 145.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Card(
        elevation: 1.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: <Widget>[
            _buildBanner(movie.posterPath),
            _buildDetails(movie),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner(String? url) {
    final imageUrl = 'https://image.tmdb.org/t/p/original/$url';
    return SizedBox(
      width: double.infinity,
      height: 136.0,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildDetails(Movie movie) {
    return Container(
      height: 56.0,
      width: double.infinity,
      padding: const EdgeInsets.all(6.0),
      decoration: const BoxDecoration(
        color: Color(0xFFC84B31),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitle(movie.title),
          _buildSubtitle(movie.releaseDate, movie.originalLanguage),
        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      '$title',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: MoviDeckTheme.lightTextTheme.headline5,
    );
  }

  Widget _buildSubtitle(String releaseDate, String language) {
    final year = _getYear(releaseDate);
    return Text(
      '$year | $language',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: MoviDeckTheme.lightTextTheme.headline6,
    );
  }

  String _getYear(String date) {
    return date.substring(0, 4);
  }
}
