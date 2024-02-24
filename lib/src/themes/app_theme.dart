import 'package:brando/src/themes/themes.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData currentTheme({
    Brightness brightness = Brightness.light,
  }) =>
      brightness == Brightness.light
          ? ThemeData.from(
              colorScheme: ColorScheme.fromSeed(
                brightness: Brightness.light,
                seedColor: Pallete.primary,
              ).copyWith(
                primary: Pallete.primary,
                onPrimary: Pallete.onPrimary,
                surfaceVariant: Pallete.surfaceVariant,
              ),
            ).copyWith(
              appBarTheme: const AppBarTheme().copyWith(
                backgroundColor: Pallete.primary,
              ),
            )
          : ThemeData(
              brightness: Brightness.dark,
            );
  // ThemeData.from(
  //   colorScheme: ColorScheme.fromSeed(
  //     seedColor: Pallete.seedColor,
  //     primary: Pallete.primary,
  //     brightness: brightness,
  //   ),
  // ).copyWith(
  //   appBarTheme: const AppBarTheme().copyWith(
  //     backgroundColor: Pallete.seedColor,
  //     foregroundColor: Pallete.primary,
  //     centerTitle: true,
  //     elevation: 1,
  //   ),
  // );
}
