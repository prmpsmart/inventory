import 'package:flutter/material.dart';

class AppColorPallete {
  static const Color primary = Color(0xffff9900);
  static const Color white = Color(0xffffffff);
  static const Color green = Color(0xff0AA849);
  static const Color blue = Color(0xff04226b);
  static const Color red = Color(0xffAB2F14);
  static const Color black = Color(0xff000000);
  static const Color darkGrey = Color(0xff3e3e3e);
  static const Color grey = Color(0xff8f8f8f);
}

class AppTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Karla',
    primaryColor: AppColorPallete.primary,
    primarySwatch: MaterialColor(AppColorPallete.primary.value, {
      50: AppColorPallete.primary.withOpacity(0.1),
      100: AppColorPallete.primary.withOpacity(0.2),
      200: AppColorPallete.primary.withOpacity(0.3),
      300: AppColorPallete.primary.withOpacity(0.4),
      400: AppColorPallete.primary.withOpacity(0.5),
      500: AppColorPallete.primary,
      600: AppColorPallete.primary.withOpacity(0.7),
      700: const Color.fromARGB(255, 246, 220, 180).withOpacity(0.8),
      800: AppColorPallete.primary.withOpacity(0.9),
      900: AppColorPallete.primary,
    }),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColorPallete.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColorPallete.white,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColorPallete.green,
    ),
  );
}
