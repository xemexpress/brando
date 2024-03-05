import 'package:flutter/material.dart';

bool isTimeslotExactMatch(
  (TimeOfDay, TimeOfDay) timeslot,
  TimeOfDay startTime,
  TimeOfDay endTime,
) {
  return timeslot.$1 == startTime && timeslot.$2 == endTime;
}
