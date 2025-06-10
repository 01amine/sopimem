import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Define your primary color explicitly
  static const Color primaryRed = Color(0xffC2072C);
  static const Color primaryWhite = Colors.white;
  static const Color lightGrey = Color(0xFFEEEEEE);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryRed,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: _createMaterialColor(primaryRed),
    ).copyWith(
      secondary: primaryWhite,
      surface: primaryWhite,
      onPrimary: primaryWhite,
      onSecondary: Colors.black,
      onSurface: Colors.black87,
      error: Colors.redAccent,
      onError: primaryWhite,
    ),
    scaffoldBackgroundColor: primaryWhite,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryRed,
      foregroundColor: primaryWhite,
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: Colors.black87,
      displayColor: Colors.black87,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryRed,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryRed,
        foregroundColor: primaryWhite,
        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryRed,
        textStyle: GoogleFonts.poppins(),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightGrey,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primaryRed, width: 2),
      ),
      labelStyle: GoogleFonts.poppins(color: Colors.black54),
      hintStyle: GoogleFonts.poppins(color: Colors.black38),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
    cardTheme: CardTheme(
      color: primaryWhite,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
  );
}

MaterialColor _createMaterialColor(Color color) {
  List<double> strengths = <double>[.05];
  final Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(i * 0.1);
  }

  for (final strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
