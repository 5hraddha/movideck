import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoviDeckTheme extends ChangeNotifier {
  // Current theme of the app
  bool isDarkTheme = false;

  void toggleCurrentTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  // Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.roboto(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF1C2A40),
    ),
    bodyText2: GoogleFonts.roboto(
      fontSize: 10.0,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF1C2A40),
    ),
    headline1: GoogleFonts.acme(
      fontSize: 30.0,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF191919),
    ),
    headline2: GoogleFonts.acme(
      fontSize: 18.0,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF191919),
    ),
    headline3: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF1C2A40),
    ),
    headline4: GoogleFonts.roboto(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF1C2A40),
    ),
    headline5: GoogleFonts.acme(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: const Color(0xFFFFFFFF),
    ),
    headline6: GoogleFonts.acme(
      fontSize: 10.0,
      fontWeight: FontWeight.normal,
      color: const Color(0xFFECDBBA),
    ),
  );

  // Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.roboto(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: const Color(0xFFECDBBA),
    ),
    bodyText2: GoogleFonts.roboto(
      fontSize: 10.0,
      fontWeight: FontWeight.normal,
      color: const Color(0xFFECDBBA),
    ),
    headline1: GoogleFonts.acme(
      fontSize: 30.0,
      fontWeight: FontWeight.normal,
      color: const Color(0xFFFFFFFF),
    ),
    headline2: GoogleFonts.acme(
      fontSize: 18.0,
      fontWeight: FontWeight.normal,
      color: const Color(0xFFFFFFFF),
    ),
    headline3: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: const Color(0xFFECDBBA),
    ),
    headline4: GoogleFonts.roboto(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: const Color(0xFFECDBBA),
    ),
    headline5: GoogleFonts.acme(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: const Color(0xFFFFFFFF),
    ),
    headline6: GoogleFonts.acme(
      fontSize: 10.0,
      fontWeight: FontWeight.normal,
      color: const Color(0xFFECDBBA),
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFECDBBA),
      appBarTheme: const AppBarTheme(
        foregroundColor: Color(0xFF191919),
        backgroundColor: Color(0xFFECDBBA),
        elevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Color(0xFFECDBBA),
        backgroundColor: Color(0xFF191919),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF191919),
        unselectedItemColor: Color(0xFFECDBBA),
        selectedItemColor: Color(0xFFC84B31),
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF1C2A40),
      appBarTheme: const AppBarTheme(
        foregroundColor: Color(0xFFECDBBA),
        backgroundColor: Color(0xFF1C2A40),
        elevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Color(0xFF1C2A40),
        backgroundColor: Color(0xFFECDBBA),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF191919),
        unselectedItemColor: Color(0xFFECDBBA),
        selectedItemColor: Color(0xFFC84B31),
      ),
      textTheme: darkTextTheme,
    );
  }
}
