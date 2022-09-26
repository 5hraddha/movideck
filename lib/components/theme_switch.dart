import 'package:flutter/material.dart';
import '../movideck_theme.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  bool isDarkTheme = false;

  void _toggleTheme(value) {
    setState(() {
      isDarkTheme = value;
      MoviDeckTheme().toggleCurrentTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isDarkTheme,
      onChanged: _toggleTheme,
      trackColor: MaterialStateProperty.all(const Color(0xFFC84B31)),
      activeColor: Colors.white,
      splashRadius: 10.0,
      inactiveThumbColor: Colors.white,
      activeThumbImage: const AssetImage('assets/images/night.png'),
      inactiveThumbImage: const AssetImage('assets/images/day.png'),
    );
  }
}
