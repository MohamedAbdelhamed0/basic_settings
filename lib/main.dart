import 'package:basic_settings/settings/domain/repositories/settings_repository_impl.dart';
import 'package:basic_settings/settings/presenter/controllers/cubit/settings_cubit.dart';
import 'package:basic_settings/settings/presenter/controllers/cubit/settings_state.dart';
import 'package:basic_settings/settings/themes/app_themes.dart';
import 'package:basic_settings/settings/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'settings/l10n/app_translations.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => SettingsCubit(SettingsRepositoryImpl()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return MaterialApp(
          // Add a key to force rebuild when settings change
          key: ValueKey(
              '${state.fontFamily}-${state.currentLanguage}-${state.isDarkMode}'),
          theme: AppThemes.lightTheme(
            seedColor: state.primaryColor,
            fontFamily: state.fontFamily,
            languageCode: state.currentLanguage,
          ),
          darkTheme: AppThemes.darkTheme(
            seedColor: state.primaryColor,
            fontFamily: state.fontFamily,
            languageCode: state.currentLanguage,
          ),
          themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          locale: Locale(state.currentLanguage),
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
            Locale('es'),
            Locale('fr'),
            Locale('de'),
          ],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            if (locale == null) {
              return supportedLocales.first;
            }
            return locale;
          },
          home: const HomeScreen(),
        );
      },
    );
  }
}
