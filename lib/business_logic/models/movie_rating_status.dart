import 'package:flutter/material.dart';

enum MovieRatingStatus {
  good,
  ok,
  bad,
}

extension MovieRatingStatusExtension on MovieRatingStatus {
  Color get color {
    switch (this) {
      case MovieRatingStatus.bad:
        return const Color(0xFFE7442E);
      case MovieRatingStatus.good:
        return const Color(0xFF29B342);
      case MovieRatingStatus.ok:
        return const Color(0xFFEFC60F);
    }
  }
}
