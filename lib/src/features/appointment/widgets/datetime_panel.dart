import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DateTimePanel extends StatelessWidget {
  const DateTimePanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          MonthDisplay(),
          SizedBox(height: 30),
          SizedBox(
            height: 280,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DatePicker(),
                TimeslotPicker(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
