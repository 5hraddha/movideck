import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../business_logic/view_models/viewmodels.dart';
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
    final _movieDetailDataProvider =
        ref.watch(movieDetailsDataProvider(movieId));

    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFFB5251B),
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
              color: const Color(0xFFB5251B),
              width: double.infinity,
              height: 400.0,
              child: _movieDetailDataProvider.when(
                data: (data) => _buildDetails(getMovieDetail(data)),
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
  Widget _buildDetails(MovieDetailDataProvider movieDetail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '${movieDetail.title}',
          style: GoogleFonts.acme(
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6.0),
        Text(
          '2022 | 2h 9 min | Fantasy | PG',
          style: MoviDeckTheme.lightTextTheme.headline5,
        ),
        const SizedBox(height: 20.0),
        Text(
          '${movieDetail.overview}',
          style: GoogleFonts.roboto(
            height: 1.4,
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: const Color(0xFFECDBBA),
          ),
        ),
      ],
    );
  }
}
