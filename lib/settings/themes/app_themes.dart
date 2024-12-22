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

  static final arabicFonts = [
    'Cairo',
    'Almarai',
    'Tajawal',
    'Amiri',
    'Lateef',
    'Scheherazade',
    'Harmattan',
    'ElMessiri',
    'Changa',
    'Reem Kufi',
  ];

  static bool isRTL(String languageCode) {
    return ['ar', 'fa', 'he', 'ur'].contains(languageCode);
  }

  static TextAlign getTextAlign(String languageCode) {
    return isRTL(languageCode) ? TextAlign.right : TextAlign.left;
  }

  static String getDefaultFontForLanguage(String languageCode) {
    return languageCode == 'ar' ? 'Cairo' : 'Roboto';
  }

  static bool isFontValidForLanguage(String fontFamily, String languageCode) {
    return getFontsForLanguage(languageCode).contains(fontFamily);
  }

  static TextTheme _getTextTheme(String fontFamily, String languageCode) {
    // Ensure we're using a valid font for the language
    if (!isFontValidForLanguage(fontFamily, languageCode)) {
      fontFamily = getDefaultFontForLanguage(languageCode);
    }

    // If language is Arabic, use Arabic fonts
    if (languageCode == 'ar') {
      switch (fontFamily) {
        case 'Cairo':
          return GoogleFonts.cairoTextTheme();
        case 'Almarai':
          return GoogleFonts.almaraiTextTheme();
        case 'Tajawal':
          return GoogleFonts.tajawalTextTheme();
        case 'Amiri':
          return GoogleFonts.amiriTextTheme();
        case 'Lateef':
          return GoogleFonts.lateefTextTheme();
        case 'Scheherazade':
          return GoogleFonts.scheherazadeNewTextTheme();
        case 'Harmattan':
          return GoogleFonts.harmattanTextTheme();
        case 'ElMessiri':
          return GoogleFonts.elMessiriTextTheme();
        case 'Changa':
          return GoogleFonts.changaTextTheme();
        case 'Reem Kufi':
          return GoogleFonts.reemKufiTextTheme();
        default:
          return GoogleFonts.cairoTextTheme(); // Default Arabic font
      }
    }

    // For non-Arabic languages, use existing fonts
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
      textTheme: _getTextTheme(fontFamily, languageCode).apply(
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
      textTheme: _getTextTheme(fontFamily, languageCode).apply(
        bodyColor: baseTheme.colorScheme.onBackground,
        displayColor: baseTheme.colorScheme.onBackground,
      ),
    );
  }

  static List<String> getFontsForLanguage(String languageCode) {
    return languageCode == 'ar' ? arabicFonts : availableFonts;
  }
}
