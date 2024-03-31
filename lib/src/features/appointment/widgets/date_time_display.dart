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

    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          DisplayTextBox(
            date?.formattedDate(S.of(context).common_locale) ?? '',
            width: context.responsive(200, lg: 230),
          ),
          const SizedBox(width: 10),
          DisplayTextBox(time?.formattedHour ?? '', width: timeWidth),
          const SizedBox(width: 5),
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              ':',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 5),
          DisplayTextBox(time?.formattedMinute ?? '', width: timeWidth),
        ],
      ),
    );
  }
}
