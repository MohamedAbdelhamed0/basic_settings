import 'package:basic_settings/settings/domain/repositories/settings_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository _repository;

  SettingsCubit(this._repository) : super(SettingsState.initial()) {
    loadSettings();
  }

  Future<void> loadSettings() async {
    final isDark = await _repository.getThemeMode();
    final language = await _repository.getLanguage();
    final color = await _repository.getThemeColor();
    final font = await _repository.getFontFamily();
    emit(state.copyWith(
      isDarkMode: isDark,
      currentLanguage: language,
      primaryColor: color,
      fontFamily: font,
    ));
  }

  Future<void> toggleTheme() async {
    final newTheme = !state.isDarkMode;
    await _repository.saveThemeMode(newTheme);
    emit(state.copyWith(isDarkMode: newTheme));
  }

  Future<void> changeLanguage(String languageCode) async {
    await _repository.saveLanguage(languageCode);
    emit(state.copyWith(currentLanguage: languageCode));
  }

  Future<void> updateThemeColor(Color color) async {
    await _repository.saveThemeColor(color);
    emit(state.copyWith(primaryColor: color));
  }

  Future<void> updateFontFamily(String fontFamily) async {
    await _repository.saveFontFamily(fontFamily);
    emit(state.copyWith(fontFamily: fontFamily));
  }
}
