import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff365e9d),
    surfaceTint: Color(0xff365e9d),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xff00326a),
    onPrimaryContainer: Color(0xffd9e4f8),
    secondary: Color(0xff545f70),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xffdbe6fa),
    onSecondaryContainer: Color(0xff5c6778),
    tertiary: Color(0xff384dcf),
    onTertiary: Color(0xffffffff),
    tertiaryContainer: Color(0xff5468e9),
    onTertiaryContainer: Color(0xfffffbff),
    error: Color(0xffba1a1a),
    onError: Color(0xffffffff),
    errorContainer: Color(0xffffdad6),
    onErrorContainer: Color(0xff93000a),
    surface: Color(0xfffcf9f8),
    onSurface: Color(0xff1b1c1c),
    onSurfaceVariant: Color(0xff434749),
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xffaac7ff),
    surfaceTint: Color(0xffaac7ff),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xff00326a),
    onPrimaryContainer: Color(0xffd9e4f8),
    secondary: Color(0xffffffff),
    onSecondary: Color(0xff263140),
    secondaryContainer: Color(0xffd8e3f7),
    onSecondaryContainer: Color(0xff5a6576),
    tertiary: Color(0xffbbc3ff),
    onTertiary: Color(0xff001b95),
    tertiaryContainer: Color(0xff7486ff),
    onTertiaryContainer: Color(0xff00126f),
    error: Color(0xffffb4ab),
    onError: Color(0xff690005),
    errorContainer: Color(0xff93000a),
    onErrorContainer: Color(0xffffdad6),
    surface: Color(0xff131313),
    onSurface: Color(0xffe4e2e1),
    onSurfaceVariant: Color(0xffc3c7c8),
  );

  static ThemeData themeData(bool isDarkTheme) {
    final color = isDarkTheme ? darkColorScheme : lightColorScheme;

    return ThemeData(
        useMaterial3: true,
        colorScheme: color
    );
  }
}