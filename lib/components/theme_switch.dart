import 'package:flutter/material.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  bool _isDarkTheme = false;

  void toggleTheme(value) {
    setState(() {
      _isDarkTheme = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isDarkTheme,
      onChanged: toggleTheme,
      trackColor: MaterialStateProperty.all(const Color(0xFFC84B31)),
      activeColor: Colors.white,
      splashRadius: 10.0,
      inactiveThumbColor: Colors.white,
      activeThumbImage: const AssetImage('assets/images/night.png'),
      inactiveThumbImage: const AssetImage('assets/images/day.png'),
    );
  }
}
