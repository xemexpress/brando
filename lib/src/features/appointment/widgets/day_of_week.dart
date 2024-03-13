import 'package:flutter/material.dart';

class DayOfWeek extends StatelessWidget {
  const DayOfWeek(
    this.day, {
    super.key,
  });

  final String day;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        day,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
