import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business_logic/utils/helper_functions.dart';
import '../../business_logic/view_models/view_models.dart';
import '../widgets/widgets.dart';
import '../movideck_theme.dart';

class MovieDetail extends ConsumerWidget {
  final int movieId;
  final String posterUrl;
  final num? userRating;
  final Color ratingColor;
  final String? releaseDate;
  final List<String?> movieGenreList;

  const MovieDetail({
    super.key,
    required this.movieId,
    required this.posterUrl,
    required this.userRating,
    required this.ratingColor,
    required this.releaseDate,
    required this.movieGenreList,
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
              height: 600.0,
              child: _movieDetailDataProvider.when(
                data: (data) => _buildDetails(
                  ref,
                  _themeNotifier,
                  getMovieDetail(data),
                ),
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
    WidgetRef ref,
    ThemeSwitchProvider _themeNotifier,
    MovieDetailDataProvider movieDetail,
  ) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitle(_themeNotifier, movieDetail.title),
            const SizedBox(height: 6.0),
            _buildSubtitle(
              _themeNotifier,
              movieDetail.language,
              movieDetail.runtime,
            ),
            const SizedBox(height: 20.0),
            _buildOverview(_themeNotifier, movieDetail.overview),
            const SizedBox(height: 20.0),
            _buildSectionTitle(_themeNotifier, 'Cast'),
            const SizedBox(height: 6.0),
            _buildCastSectionHorizontalList(ref, movieDetail.id),
          ],
        ),
        Positioned(
          top: 0.0,
          right: 0.0,
          child: CircularRatingIndicator(
            circleSize: 40.0,
            userRating: userRating,
            ratingColor: ratingColor,
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(ThemeSwitchProvider _themeNotifier, String title) {
    return Container(
      margin: const EdgeInsets.only(right: 35.0),
      child: Text(
        '$title',
        style: _themeNotifier.isDark
            ? MoviDeckTheme.darkTextTheme.headline1
            : MoviDeckTheme.lightTextTheme.headline1,
      ),
    );
  }

  Widget _buildSubtitle(
    ThemeSwitchProvider _themeNotifier,
    String language,
    int? runtime,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 36.0),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          //Year of Release
          Text(
            getYear(releaseDate),
            style: _themeNotifier.isDark
                ? MoviDeckTheme.darkTextTheme.headline4
                : MoviDeckTheme.lightTextTheme.headline4,
          ),
          const ItemSeparator(separatorColor: Color(0xFFB5251B)),
          //Language
          Text(
            language,
            style: _themeNotifier.isDark
                ? MoviDeckTheme.darkTextTheme.headline4
                : MoviDeckTheme.lightTextTheme.headline4,
          ),
          const ItemSeparator(separatorColor: Color(0xFFB5251B)),
          //Runtime
          Text(
            getRuntime(runtime),
            style: _themeNotifier.isDark
                ? MoviDeckTheme.darkTextTheme.headline4
                : MoviDeckTheme.lightTextTheme.headline4,
          ),
          const ItemSeparator(separatorColor: Color(0xFFB5251B)),
          //Genre
          Wrap(
            children: [
              ...movieGenreList.map((genre) {
                return Text(
                  (movieGenreList.last == genre) ? '$genre' : '$genre, ',
                  style: _themeNotifier.isDark
                      ? MoviDeckTheme.darkTextTheme.headline4
                      : MoviDeckTheme.lightTextTheme.headline4,
                );
              }),
            ],
          ),
        ],
      ),
    );
  }

  // Build section title
  Widget _buildSectionTitle(
      ThemeSwitchProvider themeNotifier, String sectionTitle) {
    return Text(
      '$sectionTitle',
      style: themeNotifier.isDark
          ? MoviDeckTheme.darkTextTheme.headline2
          : MoviDeckTheme.lightTextTheme.headline2,
    );
  }

  Widget _buildOverview(
    ThemeSwitchProvider _themeNotifier,
    String overview,
  ) {
    return Text(
      '$overview',
      style: _themeNotifier.isDark
          ? MoviDeckTheme.darkTextTheme.bodyText1
          : MoviDeckTheme.lightTextTheme.bodyText1,
    );
  }

  Widget _buildCastSectionHorizontalList(WidgetRef ref, int movieId) {
    final _castDataProvider = ref.watch(castDataProvider(movieId));
    return _castDataProvider.when(
      data: (data) {
        final movieCastList = getCasts(data);
        return SizedBox(
          height: 200.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: movieCastList.length,
            separatorBuilder: (context, index) => const SizedBox(width: 1.0),
            itemBuilder: (context, index) =>
                CastCard(cast: movieCastList[index]),
          ),
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const SizedBox.shrink(),
    );
  }
}
