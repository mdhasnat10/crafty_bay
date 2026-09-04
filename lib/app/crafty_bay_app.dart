import 'package:crafty_bay/app/app_theme.dart';
import 'package:crafty_bay/app/provider/locale_provider.dart';
import 'package:crafty_bay/app/routes.dart';
import 'package:crafty_bay/features/auths/presentation/screens/splash_screen.dart';
import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class CraftyBayApp extends StatefulWidget {
  const CraftyBayApp({super.key});

  @override
  State<CraftyBayApp> createState() => _CraftyBayAppState();
}

class _CraftyBayAppState extends State<CraftyBayApp> {


  final LocaleProvider _localeProvider = LocaleProvider();

  @override
  void initState() {
    super.initState();
    _localeProvider.init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _localeProvider,),
      ],
      child: Consumer<LocaleProvider>(
        builder: (context, _, _) {
          return MaterialApp(
            title: 'Crafty Bay',
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            initialRoute: SplashScreen.name,
            onGenerateRoute: AppRoutes.onGenerateRoutes,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,
            supportedLocales: _localeProvider.supportedLocales,
            locale: _localeProvider.currentLocale,
          );
        }
      ),
    );
  }
}
