import 'package:crafty_bay/app/provider/locale_provider.dart';
import 'package:crafty_bay/app/provider/theme_provider.dart';
import 'package:crafty_bay/features/auths/presentation/widgets/app_logo.dart';
import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Spacer(),
              AppLogo(),
              LocaleChangerDropDown(),
              ThemeChangerDropdown(),
              Spacer(),
              CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text('${localizations?.version} 1.0.0'),
            ],
          ),
        ),
      ),
    );
  }
}

class LocaleChangerDropDown extends StatelessWidget {
  const LocaleChangerDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, _) {
        return DropdownButton<Locale>(
          value: localeProvider.currentLocale,
          items: localeProvider.supportedLocales.map((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e.languageCode.toUpperCase()),);
        }).toList(), onChanged: (Locale? newLocale){
          if (newLocale  != null){
            localeProvider.changeLocale(newLocale);
          }
        });
      },
    );
  }
}

class ThemeChangerDropdown extends StatelessWidget {
  const ThemeChangerDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return DropdownButton<ThemeMode>(
          value: themeProvider.currentThemeMode,
          items: themeProvider.themeModes.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e.toString().toUpperCase()),
            );
          }).toList(),
          onChanged: (ThemeMode? newThemeMode) {
            if (newThemeMode != null) {
              themeProvider.changeTheme(newThemeMode);
            }
          },
        );
      },
    );
  }
}