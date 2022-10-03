import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String imagePath;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    required this.imagePath,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.cover,
        height: 32.0,
      ),
      iconTheme: const IconThemeData(
        color: Color(0xFFC84B31),
      ),
      backgroundColor: Colors.grey,
      centerTitle: centerTitle,
      expandedHeight: 400.0,
      pinned: true,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7), BlendMode.dstATop),
              image: NetworkImage(imagePath),
            ),
          ),
        ),
      ),
    );
  }
}
