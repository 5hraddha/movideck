import 'package:flutter/material.dart';
import '../components/components.dart';
import '../movideck_theme.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildNowPlaying(),
      ],
    );
  }

  Widget _buildNowPlaying() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text(
            'Now Playing',
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
      ],
    );
  }
}
