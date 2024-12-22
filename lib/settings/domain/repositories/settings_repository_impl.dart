import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../../domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  static const String _themeKey = 'theme_mode';
  static const String _languageKey = 'language';
  static const String _colorKey = 'theme_color';
  static const String _fontKey = 'font_family';

  @override
  Future<bool> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeKey) ?? false;
  }

  @override
  Future<String> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey) ?? 'en';
  }

  @override
  Future<void> saveThemeMode(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDark);
  }

  @override
  Future<void> saveLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
  }

  @override
  Future<Color> getThemeColor() async {
    final prefs = await SharedPreferences.getInstance();
    return Color(prefs.getInt(_colorKey) ?? Colors.blue.value);
  }

  @override
  Future<void> saveThemeColor(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_colorKey, color.value);
  }

  @override
  Future<String> getFontFamily() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_fontKey) ?? 'Roboto';
  }

  @override
  Future<void> saveFontFamily(String fontFamily) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_fontKey, fontFamily);
  }
}
