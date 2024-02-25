import 'package:brando/src/features/home/widgets/state_button.dart';
import 'package:brando/src/features/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AppointmentTimeSlot extends StatelessWidget {
  const AppointmentTimeSlot({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1.2),
      },
      border: TableBorder.all(),
      children: [
        const TableRow(
          children: [
            TableHeaderCell(child: 'Date'),
            TableHeaderCell(child: 'Time Slot'),
            TableHeaderCell(child: 'States'),
          ],
        ),
        TableRow(
          children: [
            const TableRowCell(child: '2024 Feb. 19'),
            const TableRowCell(child: '10:00 - 11:00'),
            TableRowCell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StateButton(
                    text: 'Change',
                    onPressed: () {
                      print('Change booking.');
                    },
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  StateButton(
                    text: 'Cancel',
                    onPressed: () {
                      print('Cancel booking.');
                    },
                    backgroundColor:
                        Theme.of(context).colorScheme.surfaceVariant,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
