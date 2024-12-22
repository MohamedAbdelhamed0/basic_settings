import 'dart:ui';

abstract class SettingsRepository {
  Future<bool> getThemeMode();
  Future<String> getLanguage();
  Future<void> saveThemeMode(bool isDark);
  Future<void> saveLanguage(String languageCode);
  Future<Color> getThemeColor();
  Future<void> saveThemeColor(Color color);
  Future<String> getFontFamily();
  Future<void> saveFontFamily(String fontFamily);
}
