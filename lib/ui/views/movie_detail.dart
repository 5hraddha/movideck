import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../business_logic/view_models/viewmodels.dart';
import '../../services/service_locator.dart';
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
            width: double.infinity,
            height: 400.0,
            decoration: const BoxDecoration(
              color: Color(0xFFC84B31),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
            ),
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
                const SizedBox(height: 20.0),
                Text(
                  '${model.overview}',
                  style: GoogleFonts.roboto(
                    height: 1.4,
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
