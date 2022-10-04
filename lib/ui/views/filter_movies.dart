import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business_logic/view_models/viewmodels.dart';
import '../movideck_theme.dart';

class FilterMovies extends ConsumerWidget {
  const FilterMovies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _themeNotifier = ref.watch(themeNotifierProvider);
    return Center(
      child: Text(
        'Under Construction',
        style: _themeNotifier.isDark
            ? MoviDeckTheme.darkTextTheme.headline2
            : MoviDeckTheme.lightTextTheme.headline2,
      ),
    );
  }
}
