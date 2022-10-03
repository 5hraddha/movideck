import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/widgets.dart';

class MovieDetailScreen extends StatelessWidget {
  final String imageUrl;
  final movieDetail;
  const MovieDetailScreen({
    super.key,
    required this.imageUrl,
    required this.movieDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomAppBar(
            imagePath: 'https://image.tmdb.org/t/p/original/${imageUrl}',
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
                    '${movieDetail.title}',
                    style: GoogleFonts.acme(
                      fontSize: 30.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    '${movieDetail.overview}',
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
      ),
    );
  }
}
