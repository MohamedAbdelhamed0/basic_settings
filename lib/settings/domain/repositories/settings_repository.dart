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

  Future<double> getTextScaleFactor();
  Future<void> saveTextScaleFactor(double value);

  Future<bool> getBoldText();
  Future<void> saveBoldText(bool value);

  Future<bool> getEnableAnimations();
  Future<void> saveEnableAnimations(bool value);

  Future<double> getAnimationSpeed();
  Future<void> saveAnimationSpeed(double value);

  Future<bool> getEnableHaptics();
  Future<void> saveEnableHaptics(bool value);

  Future<String> getLayoutDensity();
  Future<void> saveLayoutDensity(String value);

  Future<bool> getFullScreenMode();
  Future<void> saveFullScreenMode(bool value);

  Future<bool> getReduceMotion();
  Future<void> saveReduceMotion(bool value);

  Future<bool> getHighContrast();
  Future<void> saveHighContrast(bool value);
}
