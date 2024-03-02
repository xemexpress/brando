import 'package:flutter/material.dart';

Color getCompensatedColor(Color color) {
  // This function takes a Flutter Color object and returns a new Color object
  // that looks the same at 0.5 opacity (assuming a white background).

  // Args:
  //     color: A Flutter Color object.

  // Returns:
  //     A new Flutter Color object representing the compensated color.

  // Extract individual color components from the Color object
  int red = color.red;
  int green = color.green;
  int blue = color.blue;

  // Calculate the mixed color components at 0.5 opacity
  int mixedRed = (red * 2).toInt();
  int mixedGreen = (green * 2).toInt();
  int mixedBlue = (blue * 2).toInt();

  // Create and return the compensated color object
  return Color.fromRGBO(mixedRed, mixedGreen, mixedBlue, 1);
}
