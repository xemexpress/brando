import 'package:brando/src/themes/theme_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeControllerProvider =
    StateNotifierProvider<ThemeController, ThemeState>((ref) {
  return ThemeController();
});
