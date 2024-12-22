import 'package:flutter/material.dart';
import '../l10n/app_translations.dart';
import '../themes/app_themes.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context).languageCode;
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final textAlign = AppThemes.getTextAlign(currentLocale);

    return Directionality(
      textDirection: AppThemes.isRTL(currentLocale)
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              AppTranslations.translations[currentLocale]?['helloWorld'] ?? ''),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: AppThemes.isRTL(currentLocale)
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Text(
                AppTranslations.translations[currentLocale]
                        ?['welcomeMessage'] ??
                    '',
                style: theme.textTheme.headlineMedium,
                textAlign: textAlign,
              ),
              const SizedBox(height: 24),
              Text(
                AppTranslations.translations[currentLocale]?['colorDemo'] ?? '',
                style: theme.textTheme.headlineSmall,
                textAlign: textAlign,
              ),
              const SizedBox(height: 24),
              // Colored Card
              Card(
                color: primaryColor.withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    AppTranslations.translations[currentLocale]
                            ?['coloredCard'] ??
                        '',
                    style: TextStyle(color: primaryColor),
                    textAlign: textAlign,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Colored Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.all(16),
                ),
                onPressed: () {},
                child: Text(
                  AppTranslations.translations[currentLocale]
                          ?['coloredButton'] ??
                      '',
                  textAlign: textAlign,
                ),
              ),
              const SizedBox(height: 16),
              // Colored Text
              Text(
                AppTranslations.translations[currentLocale]?['coloredText'] ??
                    '',
                style: TextStyle(color: primaryColor, fontSize: 18),
                textAlign: textAlign,
              ),
              const SizedBox(height: 16),
              // Container with colored border
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  AppTranslations.translations[currentLocale]
                          ?['coloredBorder'] ??
                      '',
                  textAlign: textAlign,
                ),
              ),
              const SizedBox(height: 16),
              // Linear Progress Indicator
              Column(
                children: [
                  Text(
                    AppTranslations.translations[currentLocale]
                            ?['progressIndicator'] ??
                        '',
                    textAlign: textAlign,
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: 0.7,
                    backgroundColor: primaryColor.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Circular Progress Indicator
              Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
