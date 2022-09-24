import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './movideck_theme.dart';
import './home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MoviDeckApp());
}

class MoviDeckApp extends StatelessWidget {
  const MoviDeckApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = MoviDeckTheme.light();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: 'MoviDeck',
      home: const Home(),
    );
  }
}
