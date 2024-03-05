import 'package:brando/src/features/booking/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DateTimePanel extends StatelessWidget {
  const DateTimePanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        MonthDisplay(),
        SizedBox(height: 30),
        SizedBox(
          height: 280,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DatePicker(),
              TimeslotPicker(),
            ],
          ),
        ),
      ],
    );
  }
}
