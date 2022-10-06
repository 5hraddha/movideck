import 'package:flutter/material.dart';

import '../../business_logic/view_models/view_models.dart';
import '../../business_logic/utils/helper_functions.dart';
import '../widgets/widgets.dart';
import '../movideck_theme.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});
  final MovieViewModel movie;

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
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                _buildBanner(movie.posterUrl),
                _buildDetails(movie.title, movie.releaseDate, movie.language),
              ],
            ),
            Positioned(
              top: 118.0,
              right: 10.0,
              child: CircularRatingIndicator(
                circleSize: 32.0,
                userRating: movie.voteAverage,
                ratingColor: movie.movieRatingColor,
              ),
            ),
            _buildAddFavouriteButton(),
          ],
        ),
      ),
    );
  }

  // Build the card's banner
  Widget _buildBanner(String? imageUrl) {
    return Container(
      width: double.infinity,
      height: 136.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.9), BlendMode.dstATop),
          image: NetworkImage(imageUrl!),
        ),
      ),
    );
  }

  // Build the card's details text section
  Widget _buildDetails(String title, String? releaseDate, String language) {
    return Container(
      height: 56.0,
      width: double.infinity,
      padding: const EdgeInsets.all(6.0),
      decoration: const BoxDecoration(
        color: Color(0xFFB5251B),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0)),
      ),
      child: Container(
        margin: const EdgeInsets.only(right: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitle(title),
            _buildSubtitle(releaseDate, language),
          ],
        ),
      ),
    );
  }

  // Build the card's title
  Widget _buildTitle(String title) {
    return Text(
      '$title',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: MoviDeckTheme.lightTextTheme.headline5,
    );
  }

  // Build the card's subtitle
  Widget _buildSubtitle(String? releaseDate, String language) {
    final year = getYear(releaseDate!);
    return Row(
      children: [
        //Year of Release
        Text(
          year.toString(),
          style: MoviDeckTheme.lightTextTheme.headline6,
        ),
        const ItemSeparator(separatorColor: Color(0xFFFFFFFF)),
        //Language
        Text(
          language.toString(),
          style: MoviDeckTheme.lightTextTheme.headline6,
        ),
      ],
    );
  }

  Widget _buildAddFavouriteButton() {
    return Positioned(
      top: 10.0,
      right: 10.0,
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
            color: const Color(0xFF191919),
            borderRadius: BorderRadius.circular(50.0)),
        child: IconButton(
          icon: const Icon(
            Icons.add,
            color: Colors.white,
            size: 15.0,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
