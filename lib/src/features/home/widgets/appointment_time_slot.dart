import 'package:flutter/material.dart';

class AppointmentTimeSlot extends StatelessWidget {
  const AppointmentTimeSlot({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      // defaultColumnWidth: ,
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1.2),
      },
      border: TableBorder.all(),
      children: [
        const TableRow(
          children: [
            HeaderRowCell(text: 'Date'),
            HeaderRowCell(text: 'Time Slot'),
            HeaderRowCell(text: 'States'),
          ],
        ),
        TableRow(children: [
          const Text(
            '2024 Feb. 19',
            textAlign: TextAlign.center,
          ),
          const Text('10:00 - 11:00'),
          Row(
            children: [
              FilledButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                ),
                onPressed: () {
                  // Add your onPressed function for "Change" button here
                },
                child: Text(
                  'Change',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                // style: Theme.of(context).textTheme.labelMedium,
              ),
              TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                ),
                onPressed: () {},
                child: Text(
                  'cancel',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ],
          ),
        ]),
      ],
    );
    // return Table(
    //   border: TableBorder.all(),
    //   columnWidths: const {
    //     0: FlexColumnWidth(3), // Adjust column widths as needed
    //     1: FlexColumnWidth(2),
    //     2: FlexColumnWidth(3),
    //   },
    //   children: [
    //     // Header Row
    //     TableRow(children: [
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Text('Date'),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Text('Time Slot'),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Text('States'),
    //       ),
    //     ]),
    //     // Data Row
    //     TableRow(children: [
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Text('2024 Feb. 19'),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Text('10:00 - 11:00'),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Row(
    //           children: [
    //             Expanded(
    //               child: TextButton(
    //                 onPressed: () {
    //                   // Add your onPressed function for "Change" button here
    //                 },
    //                 child: Text('Change'),
    //               ),
    //             ),
    //             Expanded(
    //               child: FilledButton.tonal(
    //                 style: FilledButton.styleFrom(
    //                     padding: EdgeInsets.zero,
    //                     backgroundColor:
    //                         Theme.of(context).colorScheme.surfaceVariant),
    //                 onPressed: () {
    //                   // Add your onPressed function for "Cancel" button here
    //                 },
    //                 child: Text(
    //                   'Cancel',
    //                   style: Theme.of(context).textTheme.labelMedium,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ]),
    //   ],
    // );
  }
}

class HeaderRowCell extends StatelessWidget {
  const HeaderRowCell({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
