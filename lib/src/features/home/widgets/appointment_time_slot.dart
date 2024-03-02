import 'package:brando/src/features/booking/views/booking_screen.dart';
import 'package:brando/src/features/home/widgets/widgets.dart';
import 'package:brando/src/models/models.dart';
import 'package:flutter/material.dart';

class AppointmentTimeSlot extends StatefulWidget {
  const AppointmentTimeSlot({
    super.key,
    this.appointment,
  });
  final Appointment? appointment;

  @override
  State<AppointmentTimeSlot> createState() => _AppointmentTimeSlotState();
}

class _AppointmentTimeSlotState extends State<AppointmentTimeSlot> {
  reschedule() {
    print('Reschedule');
  }

  cancelAppointment() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          elevation: 8.0,
          shadowColor: Theme.of(context).colorScheme.surfaceVariant,
          content: SizedBox(
            height: 80,
            width: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Are you sure to cancel?'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      text: 'No',
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      horizontalPadding: 22,
                    ),
                    const SizedBox(
                      width: 22,
                    ),
                    MyButton(
                      text: 'Yes',
                      onPressed: confrimCancellation,
                      backgroundColor:
                          Theme.of(context).colorScheme.surfaceVariant,
                      horizontalPadding: 22,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  confrimCancellation() {
    print('Yes');
  }

  goToBookingScreen() {
    Navigator.of(context).pushReplacement(BookingScreen.route());
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> rowChildren = widget.appointment != null
        ? [
            Table(
              children: [
                TableRow(
                  children: [
                    RightBordered(
                      child: TableRowCell(
                        child: widget.appointment!.formattedDate,
                      ),
                    ),
                    TableRowCell(
                      child:
                          '${widget.appointment!.formattedStartTime} - ${widget.appointment!.formattedEndTime}',
                    ),
                  ],
                )
              ],
            ),
            TableRowCell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                    text: 'Change',
                    onPressed: reschedule,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  MyButton(
                    text: 'Cancel',
                    onPressed: cancelAppointment,
                    backgroundColor:
                        Theme.of(context).colorScheme.surfaceVariant,
                  ),
                ],
              ),
            )
          ]
        : [
            const TableRowCell(
              child: 'you don\'t have an appointment yet.',
            ),
            TableRowCell(
              child: MyButton(
                text: 'make an appointment',
                onPressed: goToBookingScreen,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          ];

    return Table(
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1.2),
      },
      border: TableBorder.all(),
      children: [
        TableRow(
          children: [
            Table(
              children: const [
                TableRow(
                  children: [
                    RightBordered(
                      child: TableHeaderCell(child: 'Date'),
                    ),
                    TableHeaderCell(child: 'Time Slot'),
                  ],
                ),
              ],
            ),
            const TableHeaderCell(child: 'States'),
          ],
        ),
        TableRow(
          children: rowChildren,
        ),
      ],
    );
  }
}
