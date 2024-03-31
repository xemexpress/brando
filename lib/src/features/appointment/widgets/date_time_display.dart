import 'package:brando/generated/l10n.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DateTimeDisplay extends StatelessWidget {
  const DateTimeDisplay({
    super.key,
    required this.date,
    required this.time,
  });

  final DateTime? date;
  final TimeOfDay? time;

  @override
  Widget build(BuildContext context) {
    const double timeWidth = 37.0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        DisplayTextBox(
          date?.formattedDate(S.of(context).common_locale) ?? '',
          width: context.responsive(200, lg: 230),
        ),
        const SizedBox(width: 10),
        DisplayTextBox(time?.formattedHour ?? '', width: timeWidth),
        const SizedBox(width: 5),
        const Text(
          ':',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 5),
        DisplayTextBox(time?.formattedMinute ?? '', width: timeWidth),
      ],
    );
  }
}
