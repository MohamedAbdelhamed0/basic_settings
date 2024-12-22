import 'package:basic_settings/settings/constants.dart';
import 'package:basic_settings/settings/presenter/controllers/cubit/settings_cubit.dart';
import 'package:basic_settings/settings/presenter/controllers/cubit/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../l10n/app_translations.dart';
import '../themes/app_themes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _showColorPicker(BuildContext context, Color currentColor) {
    Color pickedColor = currentColor;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick a color'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: currentColor,
            onColorChanged: (color) {
              pickedColor = color;
            },
            labelTypes: const [],
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Done'),
            onPressed: () {
              context.read<SettingsCubit>().updateThemeColor(pickedColor);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        final currentLocale = Localizations.localeOf(context).languageCode;

        return Directionality(
          textDirection: AppThemes.isRTL(currentLocale)
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                AppTranslations.translations[currentLocale]?['settingsTitle'] ??
                    '',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: AppThemes.isRTL(currentLocale)
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  // Theme Toggle
                  ListTile(
                    title: Text(
                      AppTranslations.translations[currentLocale]
                              ?['darkMode'] ??
                          '',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    trailing: Switch(
                      value: state.isDarkMode,
                      onChanged: (value) {
                        context.read<SettingsCubit>().toggleTheme();
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Language Dropdown
                  ListTile(
                    title: Text(AppTranslations.translations[currentLocale]
                            ?['language'] ??
                        ''),
                    trailing: DropdownButton<String>(
                      value: state.currentLanguage,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          context
                              .read<SettingsCubit>()
                              .changeLanguage(newValue);
                        }
                      },
                      items: Languages.supported.entries
                          .map<DropdownMenuItem<String>>(
                            (entry) => DropdownMenuItem<String>(
                              value: entry.key,
                              child: Text(entry.value),
                            ),
                          )
                          .toList(),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Color Picker
                  ListTile(
                    title: const Text('Theme Color'),
                    trailing: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: state.primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    onTap: () => _showColorPicker(context, state.primaryColor),
                  ),

                  const SizedBox(height: 16),

                  // Font Family Dropdown
                  ListTile(
                    title: Text(AppTranslations.translations[currentLocale]
                            ?['fontFamily'] ??
                        'Font Family'),
                    trailing: DropdownButton<String>(
                      value: state.fontFamily,
                      onChanged: (String? newFont) {
                        if (newFont != null) {
                          context
                              .read<SettingsCubit>()
                              .updateFontFamily(newFont);
                        }
                      },
                      items: AppThemes.availableFonts
                          .map<DropdownMenuItem<String>>(
                            (String font) => DropdownMenuItem<String>(
                              value: font,
                              child: Text(
                                font,
                                style: TextStyle(
                                  fontFamily: font,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
