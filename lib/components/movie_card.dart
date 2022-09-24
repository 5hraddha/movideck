import 'package:flutter/material.dart';
import '../movideck_theme.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

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
            _buildBanner(),
            _buildDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return SizedBox(
      width: double.infinity,
      height: 136.0,
      child: Image.asset(
        'assets/images/boss-baby.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildDetails() {
    return Container(
      height: 56.0,
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
          _buildTitle(),
          _buildSubtitle(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'The Boss Baby: Family Business',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: MoviDeckTheme.lightTextTheme.headline5,
    );
  }

  Widget _buildSubtitle() {
    return Text(
      '2021 | 1 h 30 min | PG',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: MoviDeckTheme.lightTextTheme.headline6,
    );
  }
}
