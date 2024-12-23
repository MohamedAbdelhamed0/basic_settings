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

    TextTheme baseTheme;
    // If language is Arabic, use Arabic fonts
    if (languageCode == 'ar') {
      baseTheme = switch (fontFamily) {
        'Cairo' => GoogleFonts.cairoTextTheme(),
        'Almarai' => GoogleFonts.almaraiTextTheme(),
        'Tajawal' => GoogleFonts.tajawalTextTheme(),
        'Amiri' => GoogleFonts.amiriTextTheme(),
        'Lateef' => GoogleFonts.lateefTextTheme(),
        'Scheherazade' => GoogleFonts.scheherazadeNewTextTheme(),
        'Harmattan' => GoogleFonts.harmattanTextTheme(),
        'ElMessiri' => GoogleFonts.elMessiriTextTheme(),
        'Changa' => GoogleFonts.changaTextTheme(),
        'Reem Kufi' => GoogleFonts.reemKufiTextTheme(),
        _ => GoogleFonts.cairoTextTheme(),
      };
    } else {
      baseTheme = switch (fontFamily) {
        'Lato' => GoogleFonts.latoTextTheme(),
        'OpenSans' => GoogleFonts.openSansTextTheme(),
        'Montserrat' => GoogleFonts.montserratTextTheme(),
        'Raleway' => GoogleFonts.ralewayTextTheme(),
        'Poppins' => GoogleFonts.poppinsTextTheme(),
        'PlayfairDisplay' => GoogleFonts.playfairDisplayTextTheme(),
        'Quicksand' => GoogleFonts.quicksandTextTheme(),
        'SourceSansPro' => GoogleFonts.sourceCodeProTextTheme(),
        'Ubuntu' => GoogleFonts.ubuntuTextTheme(),
        _ => GoogleFonts.robotoTextTheme(),
      };
    }

    // Apply overflow ellipsis to all text styles
    return baseTheme.copyWith(
      bodyLarge: baseTheme.bodyLarge?.copyWith(overflow: TextOverflow.ellipsis),
      bodyMedium:
          baseTheme.bodyMedium?.copyWith(overflow: TextOverflow.ellipsis),
      bodySmall: baseTheme.bodySmall?.copyWith(overflow: TextOverflow.ellipsis),
      displayLarge:
          baseTheme.displayLarge?.copyWith(overflow: TextOverflow.ellipsis),
      displayMedium:
          baseTheme.displayMedium?.copyWith(overflow: TextOverflow.ellipsis),
      displaySmall:
          baseTheme.displaySmall?.copyWith(overflow: TextOverflow.ellipsis),
      headlineLarge:
          baseTheme.headlineLarge?.copyWith(overflow: TextOverflow.ellipsis),
      headlineMedium:
          baseTheme.headlineMedium?.copyWith(overflow: TextOverflow.ellipsis),
      headlineSmall:
          baseTheme.headlineSmall?.copyWith(overflow: TextOverflow.ellipsis),
      titleLarge:
          baseTheme.titleLarge?.copyWith(overflow: TextOverflow.ellipsis),
      titleMedium:
          baseTheme.titleMedium?.copyWith(overflow: TextOverflow.ellipsis),
      titleSmall:
          baseTheme.titleSmall?.copyWith(overflow: TextOverflow.ellipsis),
      labelLarge:
          baseTheme.labelLarge?.copyWith(overflow: TextOverflow.ellipsis),
      labelMedium:
          baseTheme.labelMedium?.copyWith(overflow: TextOverflow.ellipsis),
      labelSmall:
          baseTheme.labelSmall?.copyWith(overflow: TextOverflow.ellipsis),
    );
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
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: baseTheme.colorScheme.surfaceVariant.withOpacity(0.5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: baseTheme.colorScheme.outline),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: baseTheme.colorScheme.outline),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                BorderSide(color: baseTheme.colorScheme.primary, width: 2),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        menuStyle: MenuStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          elevation: MaterialStateProperty.all(6),
          backgroundColor: MaterialStateProperty.all(
            baseTheme.colorScheme.surface,
          ),
        ),
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
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: baseTheme.colorScheme.surfaceVariant.withOpacity(0.5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: baseTheme.colorScheme.outline),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: baseTheme.colorScheme.outline),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                BorderSide(color: baseTheme.colorScheme.primary, width: 2),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        menuStyle: MenuStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          elevation: MaterialStateProperty.all(6),
          backgroundColor: MaterialStateProperty.all(
            baseTheme.colorScheme.surface,
          ),
        ),
      ),
    );
  }

  static List<String> getFontsForLanguage(String languageCode) {
    return languageCode == 'ar' ? arabicFonts : availableFonts;
  }
}
