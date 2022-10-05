import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business_logic/view_models/viewmodels.dart';
import '../widgets/item_separator.dart';
import '../widgets/widgets.dart';
import '../movideck_theme.dart';

class MovieDetail extends ConsumerWidget {
  final int movieId;
  final String posterUrl;

  const MovieDetail({
    super.key,
    required this.movieId,
    required this.posterUrl,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Providers
    final _themeNotifier = ref.watch(themeNotifierProvider);
    final _movieDetailDataProvider =
        ref.watch(movieDetailsDataProvider(movieId));

    return Scaffold(
      extendBody: true,
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomAppBar(
            imagePath: posterUrl,
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(28.0),
              width: double.infinity,
              height: 400.0,
              child: _movieDetailDataProvider.when(
                data: (data) =>
                    _buildDetails(_themeNotifier, getMovieDetail(data)),
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const SizedBox.shrink(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build floating action button to add a movie as favorite
  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      splashColor: const Color(0xFFB5251B),
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 25.0,
      ),
      onPressed: () {},
    );
  }

  //Build details section
  Widget _buildDetails(
      ThemeSwitchProvider _themeNotifier, MovieDetailDataProvider movieDetail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTitle(_themeNotifier, movieDetail.title),
        const SizedBox(height: 6.0),
        _buildSubtitle(_themeNotifier, '2020', '2h 9min', 'Fantasy'),
        const SizedBox(height: 20.0),
        Text(
          '${movieDetail.overview}',
          style: _themeNotifier.isDark
              ? MoviDeckTheme.darkTextTheme.bodyText1
              : MoviDeckTheme.lightTextTheme.bodyText1,
        ),
      ],
    );
  }

  Widget _buildTitle(ThemeSwitchProvider _themeNotifier, String title) {
    return Text(
      '$title',
      style: _themeNotifier.isDark
          ? MoviDeckTheme.darkTextTheme.headline1
          : MoviDeckTheme.lightTextTheme.headline1,
    );
  }

  Widget _buildSubtitle(ThemeSwitchProvider _themeNotifier, String year,
      String runtime, String genre) {
    return Row(
      children: [
        //Year of Release
        Text(
          year.toString(),
          style: _themeNotifier.isDark
              ? MoviDeckTheme.darkTextTheme.headline4
              : MoviDeckTheme.lightTextTheme.headline4,
        ),
        const ItemSeparator(separatorColor: Color(0xFFB5251B)),
        //Runtime
        Text(
          runtime.toString(),
          style: _themeNotifier.isDark
              ? MoviDeckTheme.darkTextTheme.headline4
              : MoviDeckTheme.lightTextTheme.headline4,
        ),
        const ItemSeparator(separatorColor: Color(0xFFB5251B)),
        //Genre
        Text(
          genre.toString(),
          style: _themeNotifier.isDark
              ? MoviDeckTheme.darkTextTheme.headline4
              : MoviDeckTheme.lightTextTheme.headline4,
        ),
      ],
    );
  }
}
