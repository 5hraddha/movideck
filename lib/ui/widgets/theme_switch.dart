import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../business_logic/view_models/theme_switch_view_model.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeSwitchViewModel>(context);
    return Switch(
      value: provider.isDark,
      onChanged: (value) => provider.isDark = value,
      trackColor: MaterialStateProperty.all(const Color(0xFFC84B31)),
      activeColor: Colors.white,
      splashRadius: 10.0,
      inactiveThumbColor: Colors.white,
      activeThumbImage: const AssetImage('assets/images/night.png'),
      inactiveThumbImage: const AssetImage('assets/images/day.png'),
    );
  }
}
