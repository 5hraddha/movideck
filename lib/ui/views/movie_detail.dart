import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../business_logic/view_models/viewmodels.dart';
import '../../services/service_locator.dart';
import '../movideck_theme.dart';
import '../widgets/widgets.dart';

class MovieDetail extends StatelessWidget {
  final int movieId;
  final String posterUrl;
  final MovieDetailViewModel model = serviceLocator<MovieDetailViewModel>();

  MovieDetail({
    super.key,
    required this.movieId,
    required this.posterUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFFB5251B),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        splashColor: const Color(0xFFB5251B),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 25.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: FutureBuilder(
        future: model.loadData(movieId),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const SizedBox.shrink();
          }
          return _buildBody(model, posterUrl);
        },
      ),
    );
  }

  Widget _buildBody(MovieDetailViewModel model, String posterUrl) {
    return CustomScrollView(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${model.title}',
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
                  '${model.overview}',
                  style: GoogleFonts.roboto(
                    height: 1.4,
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFFECDBBA),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddFavouriteButton() {
    return Positioned(
      top: 30.0,
      right: 10.0,
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(50.0)),
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
