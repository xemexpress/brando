import 'package:flutter/material.dart';
import 'package:brando/src/features/booking/widgets/widgets.dart';

class DaysOfWeekLabel extends StatelessWidget {
  DaysOfWeekLabel({
    super.key,
  });

  final List<String> daysOfWeek = [
    'Su',
    'Mo',
    'Tu',
    'We',
    'Th',
    'Fr',
    'Sa',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 0.25,
        ),
      ),
      child: Row(
        children: daysOfWeek
            .map(
              (i) => DayOfWeek(i),
            )
            .toList(),
      ),
    );
  }
}
