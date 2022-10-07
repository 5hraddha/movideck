import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business_logic/view_models/view_models.dart';
import '../movideck_theme.dart';

class CastCard extends ConsumerWidget {
  const CastCard({super.key, required this.cast});
  final CastDataProvider cast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                _buildBanner(ref, cast.profileImageUrl),
                _buildDetails(cast.name, cast.character),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Build the card's banner
  Widget _buildBanner(WidgetRef ref, String? imageUrl) {
    final _themeNotifier = ref.watch(themeNotifierProvider);
    return SizedBox(
      width: double.infinity,
      height: 136.0,
      child: (imageUrl != null)
          ? Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.9), BlendMode.dstATop),
                  image: NetworkImage(imageUrl),
                ),
              ),
            )
          : Container(
              color: Colors.grey,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Icon(
                  Icons.person,
                  color: _themeNotifier.isDark
                      ? const Color(0xFFECDBBA)
                      : const Color(0xFF1C2A40),
                ),
              ),
            ),
    );
  }

  // Build the card's details text section
  Widget _buildDetails(String name, String character) {
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
            _buildTitle(name),
            _buildSubtitle(character),
          ],
        ),
      ),
    );
  }

  // Build the card's title
  Widget _buildTitle(String name) {
    return Text(
      name.toString(),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: MoviDeckTheme.lightTextTheme.headline5,
    );
  }

  // Build the card's subtitle
  Widget _buildSubtitle(String character) {
    return Text(
      character.toString(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: MoviDeckTheme.lightTextTheme.headline6,
    );
  }
}
