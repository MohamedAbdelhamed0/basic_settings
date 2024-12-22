import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final availableFonts = [
    'Roboto',
    'Lato',
    'OpenSans',
    'Montserrat',
    'Raleway',
    'Poppins',
    'PlayfairDisplay',
    'Quicksand',
    'SourceSansPro',
    'Ubuntu',
  ];

  static bool isRTL(String languageCode) {
    return ['ar', 'fa', 'he', 'ur'].contains(languageCode);
  }

  static TextAlign getTextAlign(String languageCode) {
    return isRTL(languageCode) ? TextAlign.right : TextAlign.left;
  }

  static TextTheme _getTextTheme(String fontFamily) {
    switch (fontFamily) {
      case 'Lato':
        return GoogleFonts.latoTextTheme();
      case 'OpenSans':
        return GoogleFonts.openSansTextTheme();
      case 'Montserrat':
        return GoogleFonts.montserratTextTheme();
      case 'Raleway':
        return GoogleFonts.ralewayTextTheme();
      case 'Poppins':
        return GoogleFonts.poppinsTextTheme();
      case 'PlayfairDisplay':
        return GoogleFonts.playfairDisplayTextTheme();
      case 'Quicksand':
        return GoogleFonts.quicksandTextTheme();
      case 'SourceSansPro':
        return GoogleFonts.sourceCodeProTextTheme();
      case 'Ubuntu':
        return GoogleFonts.ubuntuTextTheme();
      default:
        return GoogleFonts.robotoTextTheme();
    }
  }

  static ThemeData lightTheme({
    Color seedColor = Colors.deepPurple,
    String fontFamily = 'Roboto',
    String languageCode = 'en',
  }) {
    final baseTheme = ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
      useMaterial3: true,
    );

    return baseTheme.copyWith(
      textTheme: _getTextTheme(fontFamily).apply(
        bodyColor: baseTheme.colorScheme.onBackground,
        displayColor: baseTheme.colorScheme.onBackground,
      ),
    );
  }

  static ThemeData darkTheme({
    Color seedColor = Colors.deepPurple,
    String fontFamily = 'Roboto',
    String languageCode = 'en',
  }) {
    final baseTheme = ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
    );

    return baseTheme.copyWith(
      textTheme: _getTextTheme(fontFamily).apply(
        bodyColor: baseTheme.colorScheme.onBackground,
        displayColor: baseTheme.colorScheme.onBackground,
      ),
    );
  }
}
