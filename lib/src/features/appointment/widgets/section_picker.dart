import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SectionPicker extends ConsumerWidget {
  const SectionPicker({super.key});

  static const List<(TimeOfDay, TimeOfDay)> timeslots = [
    (TimeOfDay(hour: 10, minute: 0), TimeOfDay(hour: 11, minute: 0)),
    (TimeOfDay(hour: 11, minute: 0), TimeOfDay(hour: 12, minute: 0)),
    (TimeOfDay(hour: 12, minute: 0), TimeOfDay(hour: 13, minute: 0)),
    (TimeOfDay(hour: 13, minute: 0), TimeOfDay(hour: 14, minute: 0)),
    (TimeOfDay(hour: 14, minute: 0), TimeOfDay(hour: 15, minute: 0)),
    (TimeOfDay(hour: 15, minute: 0), TimeOfDay(hour: 16, minute: 0)),
    (TimeOfDay(hour: 16, minute: 0), TimeOfDay(hour: 17, minute: 0)),
    (TimeOfDay(hour: 17, minute: 0), TimeOfDay(hour: 18, minute: 0)),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(width: 1.2),
          right: BorderSide(width: 1.2),
          bottom: BorderSide(width: 1.2),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: timeslots.map((timeslot) {
            final paddedTimeslot = PaddedTimeslot(timeslot);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                paddedTimeslot,
                Divider(
                  color: timeslots.indexOf(timeslot) != timeslots.length - 1
                      ? Theme.of(context).colorScheme.onSurface
                      : Theme.of(context).colorScheme.surface,
                  endIndent: 15,
                  height: 0,
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
