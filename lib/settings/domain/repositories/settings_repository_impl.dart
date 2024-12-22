import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../../domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  static const String _themeKey = 'theme_mode';
  static const String _languageKey = 'language';
  static const String _colorKey = 'theme_color';
  static const String _fontKey = 'font_family';
  static const String _textScaleKey = 'text_scale_factor';
  static const String _boldTextKey = 'bold_text';
  static const String _animationsKey = 'enable_animations';
  static const String _animationSpeedKey = 'animation_speed';
  static const String _hapticsKey = 'enable_haptics';
  static const String _layoutDensityKey = 'layout_density';
  static const String _fullScreenKey = 'full_screen_mode';
  static const String _reduceMotionKey = 'reduce_motion';
  static const String _highContrastKey = 'high_contrast';

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

  @override
  Future<double> getTextScaleFactor() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_textScaleKey) ?? 1.0;
  }

  @override
  Future<void> saveTextScaleFactor(double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_textScaleKey, value);
  }

  @override
  Future<bool> getBoldText() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_boldTextKey) ?? false;
  }

  @override
  Future<void> saveBoldText(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_boldTextKey, value);
  }

  @override
  Future<bool> getEnableAnimations() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_animationsKey) ?? true;
  }

  @override
  Future<void> saveEnableAnimations(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_animationsKey, value);
  }

  @override
  Future<double> getAnimationSpeed() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_animationSpeedKey) ?? 1.0;
  }

  @override
  Future<void> saveAnimationSpeed(double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_animationSpeedKey, value);
  }

  @override
  Future<bool> getEnableHaptics() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hapticsKey) ?? true;
  }

  @override
  Future<void> saveEnableHaptics(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hapticsKey, value);
  }

  @override
  Future<String> getLayoutDensity() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_layoutDensityKey) ?? 'standard';
  }

  @override
  Future<void> saveLayoutDensity(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_layoutDensityKey, value);
  }

  @override
  Future<bool> getFullScreenMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_fullScreenKey) ?? false;
  }

  @override
  Future<void> saveFullScreenMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_fullScreenKey, value);
  }

  @override
  Future<bool> getReduceMotion() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_reduceMotionKey) ?? false;
  }

  @override
  Future<void> saveReduceMotion(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_reduceMotionKey, value);
  }

  @override
  Future<bool> getHighContrast() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_highContrastKey) ?? false;
  }

  @override
  Future<void> saveHighContrast(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_highContrastKey, value);
  }
}
