import 'package:flutter/material.dart';
import 'dart:math';

import '../movideck_theme.dart';

class CircularRatingIndicator extends StatelessWidget {
  const CircularRatingIndicator({
    super.key,
    required this.circleSize,
    required this.userRating,
    required this.ratingColor,
  });

  final double circleSize;
  final num? userRating;
  final Color ratingColor;

  @override
  Widget build(BuildContext context) {
    final valueToShow = ((userRating ?? 0) * 10).ceil();

    return Stack(
      children: [
        _buildOuterCircle(),
        Positioned(
          top: 3.0,
          left: 3.0,
          child: SizedBox(
            width: circleSize,
            height: circleSize,
            child: Stack(
              children: [
                _buildIndicatorTrack(valueToShow),
                _buildIndicatorText(valueToShow),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOuterCircle() {
    return Container(
      width: circleSize + 6,
      height: circleSize + 6,
      decoration:
          const BoxDecoration(color: Color(0xFF191919), shape: BoxShape.circle),
    );
  }

  Widget _buildIndicatorTrack(int valueToShow) {
    return ShaderMask(
      shaderCallback: (rect) {
        return SweepGradient(
            startAngle: 3 * pi / 2,
            endAngle: 7 * pi / 2,
            tileMode: TileMode.repeated,
            stops: [
              valueToShow / 100,
              valueToShow / 100,
            ],
            center: Alignment.center,
            colors: [
              ratingColor,
              Colors.transparent,
            ]).createShader(rect);
      },
      child: Container(
        width: circleSize,
        height: circleSize,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildIndicatorText(int valueToShow) {
    return Center(
      child: Container(
        width: circleSize - 6,
        height: circleSize - 6,
        decoration: const BoxDecoration(
            color: Color(0xFF191919), shape: BoxShape.circle),
        child: Center(
          child: Text(
            '$valueToShow%',
            style: MoviDeckTheme.lightTextTheme.headline6,
          ),
        ),
      ),
    );
  }
}
