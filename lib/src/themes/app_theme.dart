import 'package:brando/src/themes/themes.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // static ThemeData defaultTheme(Brightness brightness) => ThemeData.from(
  static ThemeData defaultTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Pallete.seedColor,
      primary: Pallete.primary,
      // brightness: brightness,
    ),
  ).copyWith(
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: Pallete.seedColor,
      foregroundColor: Pallete.primary,
      centerTitle: true,
      elevation: 1,
    ),
  );
}
