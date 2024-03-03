import 'package:flutter/material.dart';

class TimeslotPicker extends StatefulWidget {
  const TimeslotPicker({
    super.key,
  });

  static const List<String> timeslots = [
    '10:00 - 11:00',
    '11:00 - 12:00',
    '12:00 - 13:00',
    '13:00 - 14:00',
    '14:00 - 15:00',
    '15:00 - 16:00',
    '16:00 - 17:00',
    '17:00 - 18:00',
  ];

  @override
  State<TimeslotPicker> createState() => _TimeslotPickerState();
}

class _TimeslotPickerState extends State<TimeslotPicker> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: TimeslotPicker.timeslots
          .map(
            (timeslot) => Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              child: Text(timeslot),
            ),
          )
          .toList(),

      // [
      //   Text(
      //     '10:00 - 11:00',
      //   )
      // ],
    );
  }
}
