import 'package:crafty_bay/features/auths/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    late Widget widget;
    switch (settings.name) {
      case SplashScreen.name:
        widget = SplashScreen();
    }
    return MaterialPageRoute(builder: (_) => widget);
  }
}
