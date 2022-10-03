import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../business_logic/view_models/viewmodels.dart';
import '../movideck_theme.dart';

class FilterMovies extends StatelessWidget {
  const FilterMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final themeSwitchProvider = Provider.of<ThemeSwitchViewModel>(context);
    return Center(
      child: Text(
        'Under Construction',
        style: themeSwitchProvider.isDark
            ? MoviDeckTheme.darkTextTheme.headline2
            : MoviDeckTheme.lightTextTheme.headline2,
      ),
    );
  }
}
