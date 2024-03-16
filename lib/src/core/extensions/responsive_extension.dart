import 'package:brando/src/core/core.dart';
import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {
  T responsive<T>(
    T defaultVal, {
    T? sm,
    T? md,
    T? lg,
    T? xl,
  }) {
    final wd = MediaQuery.of(this).size.width;

    return wd >= ScreenSize.ultraScreenWidth
        ? (xl ?? lg ?? md ?? sm ?? defaultVal)
        : wd >= ScreenSize.desktopScreenWidth
            ? (lg ?? md ?? sm ?? defaultVal)
            : wd >= ScreenSize.tabletScreenWidth
                ? (md ?? sm ?? defaultVal)
                : wd >= ScreenSize.mobileLandscapeScreenWidth
                    ? (sm ?? defaultVal)
                    : defaultVal;
  }
}
