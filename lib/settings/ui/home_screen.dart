import 'package:basic_settings/settings/constants.dart';
import 'package:basic_settings/settings/presenter/controllers/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../l10n/app_translations.dart';
import '../themes/app_themes.dart';
import 'settings_screen.dart';
import '../presenter/controllers/cubit/settings_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context).languageCode;
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Directionality(
          textDirection: AppThemes.isRTL(currentLocale)
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                AppTranslations.translations[currentLocale]?['helloWorld'] ??
                    '',
                style: theme.textTheme.titleLarge,
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    icon: const Icon(Icons.settings_outlined),
                    tooltip: AppTranslations.translations[currentLocale]
                            ?['settingsTitle'] ??
                        '',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Theme Preview Section
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.palette_outlined, color: primaryColor),
                              const SizedBox(width: 8),
                              Text(
                                AppTranslations.translations[currentLocale]
                                        ?['themePreview'] ??
                                    '',
                                style: theme.textTheme.titleLarge,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: Card(
                                  color: primaryColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        Icon(
                                          state.isDarkMode
                                              ? Icons.dark_mode
                                              : Icons.light_mode,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          state.isDarkMode
                                              ? (AppTranslations.translations[
                                                          currentLocale]
                                                      ?['darkMode'] ??
                                                  '')
                                              : 'Light Mode',
                                          style: theme.textTheme.bodyLarge
                                              ?.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Card(
                                  color: primaryColor.withOpacity(0.2),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.color_lens,
                                          color: primaryColor,
                                          size: 32,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          AppTranslations.translations[
                                                      currentLocale]
                                                  ?['themeColor'] ??
                                              '',
                                          style: TextStyle(
                                            color: primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Typography Preview Section
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.text_fields, color: primaryColor),
                              const SizedBox(width: 8),
                              Text(
                                AppTranslations.translations[currentLocale]
                                        ?['typographyPreview'] ??
                                    '',
                                style: theme.textTheme.titleLarge,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            AppTranslations.translations[currentLocale]
                                    ?['currentFont'] ??
                                '',
                            style: TextStyle(
                              fontFamily: state.fontFamily,
                              fontSize: 20,
                              color: primaryColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            AppTranslations.translations[currentLocale]
                                    ?['headingExample'] ??
                                '',
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontFamily: state.fontFamily,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            AppTranslations.translations[currentLocale]
                                    ?['paragraphExample'] ??
                                '',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontFamily: state.fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Language Preview Section
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.language, color: primaryColor),
                              const SizedBox(width: 8),
                              Text(
                                AppTranslations.translations[currentLocale]
                                        ?['languagePreview'] ??
                                    '',
                                style: theme.textTheme.titleLarge,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppTranslations.translations[currentLocale]
                                          ?['currentLanguage'] ??
                                      '',
                                  style: TextStyle(color: primaryColor),
                                ),
                                Text(
                                  Languages.supported[state.currentLanguage] ??
                                      '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Interactive Elements Preview
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.touch_app, color: primaryColor),
                              const SizedBox(width: 8),
                              Text(
                                AppTranslations.translations[currentLocale]
                                        ?['interactiveElements'] ??
                                    '',
                                style: theme.textTheme.titleLarge,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  icon: const Icon(Icons.favorite),
                                  label: const Text('Button'),
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: OutlinedButton.icon(
                                  icon: const Icon(Icons.star),
                                  label: const Text('Button'),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: LinearProgressIndicator(
                              value: 0.7,
                              backgroundColor: primaryColor.withOpacity(0.2),
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(primaryColor),
                              minHeight: 8,
                            ),
                          ),
                        ],
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
