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
    final currentLocale = Localizations.localeOf(context).languageCode;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
            AppTranslations.translations[currentLocale]?['pickColor'] ?? ''),
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

  Widget _buildSectionHeader(
      String title, IconData icon, BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 8),
          Text(
            title,
            style: theme.textTheme.titleLarge,
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
        final theme = Theme.of(context);

        return Directionality(
          textDirection: AppThemes.isRTL(currentLocale)
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                AppTranslations.translations[currentLocale]?['settingsTitle'] ??
                    '',
                style: theme.textTheme.titleLarge,
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
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
                  // Appearance Section
                  _buildSectionHeader(
                      AppTranslations.translations[currentLocale]
                              ?['appearance'] ??
                          '',
                      Icons.palette_outlined,
                      context),
                  Card(
                    elevation: 2,
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.dark_mode_outlined),
                          title: Text(
                            AppTranslations.translations[currentLocale]
                                    ?['darkMode'] ??
                                '',
                            style: theme.textTheme.titleMedium,
                          ),
                          subtitle: Text(
                            AppTranslations.translations[currentLocale]
                                    ?['darkModeSubtitle'] ??
                                '',
                            style: theme.textTheme.bodyMedium,
                          ),
                          trailing: Switch.adaptive(
                            value: state.isDarkMode,
                            onChanged: (value) =>
                                context.read<SettingsCubit>().toggleTheme(),
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.color_lens_outlined),
                          title: Text(
                            AppTranslations.translations[currentLocale]
                                    ?['themeColor'] ??
                                '',
                            style: theme.textTheme.titleMedium,
                          ),
                          subtitle: Text(
                            AppTranslations.translations[currentLocale]
                                    ?['themeColorSubtitle'] ??
                                '',
                            style: theme.textTheme.bodyMedium,
                          ),
                          trailing: GestureDetector(
                            onTap: () =>
                                _showColorPicker(context, state.primaryColor),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: state.primaryColor,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey.shade300),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Language Section
                  _buildSectionHeader(
                      AppTranslations.translations[currentLocale]
                              ?['language'] ??
                          '',
                      Icons.language_outlined,
                      context),
                  Card(
                    elevation: 2,
                    child: ListTile(
                      leading: const Icon(Icons.translate_outlined),
                      title: Text(
                        AppTranslations.translations[currentLocale]
                                ?['language'] ??
                            '',
                        style: theme.textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        AppTranslations.translations[currentLocale]
                                ?['languageSubtitle'] ??
                            '',
                        style: theme.textTheme.bodyMedium,
                      ),
                      trailing: DropdownButton<String>(
                        value: state.currentLanguage,
                        underline: const SizedBox(),
                        icon: const Icon(Icons.arrow_drop_down),
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
                  ),

                  // Typography Section
                  _buildSectionHeader(
                      AppTranslations.translations[currentLocale]
                              ?['typography'] ??
                          '',
                      Icons.text_fields_outlined,
                      context),
                  Card(
                    elevation: 2,
                    child: ListTile(
                      leading: const Icon(Icons.font_download_outlined),
                      title: Text(
                        AppTranslations.translations[currentLocale]
                                ?['fontFamily'] ??
                            'Font Family',
                        style: theme.textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        AppTranslations.translations[currentLocale]
                                ?['fontFamilySubtitle'] ??
                            '',
                        style: theme.textTheme.bodyMedium,
                      ),
                      trailing: DropdownButton<String>(
                        value: AppThemes.isFontValidForLanguage(
                                state.fontFamily, currentLocale)
                            ? state.fontFamily
                            : AppThemes.getDefaultFontForLanguage(
                                currentLocale),
                        underline: const SizedBox(),
                        icon: const Icon(Icons.arrow_drop_down),
                        onChanged: (String? newFont) {
                          if (newFont != null) {
                            context
                                .read<SettingsCubit>()
                                .updateFontFamily(newFont);
                          }
                        },
                        items: AppThemes.getFontsForLanguage(currentLocale)
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
