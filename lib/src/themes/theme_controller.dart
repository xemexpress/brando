import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeState {
  Brightness appBrightness;

  ThemeState({
    required this.appBrightness,
  });

  ThemeState copyWith({
    Brightness? appBrightness,
  }) {
    return ThemeState(
      appBrightness: appBrightness ?? this.appBrightness,
    );
  }
}

class ThemeController extends StateNotifier<ThemeState> {
  ThemeController() : super(ThemeState(appBrightness: Brightness.light));

  void changeBrightness({required Brightness brightness}) {
    state = state.copyWith(appBrightness: brightness);
  }
}
