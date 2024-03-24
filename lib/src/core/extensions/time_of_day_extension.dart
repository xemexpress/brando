import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  String get formattedHour {
    return hour.toString().padLeft(2, '0');
  }

  String get formattedMinute {
    return minute.toString().padLeft(2, '0');
  }

  String get formattedTime {
    return '$formattedHour:$formattedMinute';
  }

  String get formattedTimeCompact {
    return '$formattedHour$formattedMinute';
  }
}
