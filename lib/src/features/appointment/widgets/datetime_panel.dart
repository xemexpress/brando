import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DateTimePanel extends StatelessWidget {
  const DateTimePanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const List<Widget> mainBodyChildren = [
      DatePicker(),
      TimeslotPicker(),
    ];

    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const MonthDisplay(),
            ...context.responsive(
              [
                ...mainBodyChildren,
                const SizedBox(height: 30),
              ],
              md: [
                const SizedBox(
                  height: 280,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: mainBodyChildren,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
