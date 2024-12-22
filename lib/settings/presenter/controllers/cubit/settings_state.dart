import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SettingsState extends Equatable {
  final bool isDarkMode;
  final String currentLanguage;
  final Color primaryColor;
  final String fontFamily;

  const SettingsState({
    required this.isDarkMode,
    required this.currentLanguage,
    required this.primaryColor,
    required this.fontFamily,
  });

  factory SettingsState.initial() {
    return const SettingsState(
      isDarkMode: false,
      currentLanguage: 'en',
      primaryColor: Colors.blue,
      fontFamily: 'Roboto',
    );
  }

  SettingsState copyWith({
    bool? isDarkMode,
    String? currentLanguage,
    Color? primaryColor,
    String? fontFamily,
  }) {
    return SettingsState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      currentLanguage: currentLanguage ?? this.currentLanguage,
      primaryColor: primaryColor ?? this.primaryColor,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }

  @override
  List<Object> get props =>
      [isDarkMode, currentLanguage, primaryColor, fontFamily];
}
