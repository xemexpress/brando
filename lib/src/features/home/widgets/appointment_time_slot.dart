import 'package:brando/src/apis/appointment/appointment.dart';
import 'package:brando/src/common/common.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/appointment/views/booking_screen.dart';
import 'package:brando/src/features/home/controllers/controllers.dart';
import 'package:brando/src/features/home/widgets/widgets.dart';
import 'package:brando/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppointmentTimeSlot extends ConsumerStatefulWidget {
  const AppointmentTimeSlot({
    super.key,
  });

  @override
  ConsumerState<AppointmentTimeSlot> createState() =>
      _AppointmentTimeSlotState();
}

class _AppointmentTimeSlotState extends ConsumerState<AppointmentTimeSlot> {
  changeAppointment(Appointment? appointment) {
    ref
        .read(appointmentControllerProvider.notifier)
        .updateAppointment(appointment);

    Navigator.of(context).push(BookingScreen.route());
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
    try {
      Navigator.of(context).pop();

      ref.read(appointmentControllerProvider.notifier).cancelAppointment();
    } on GenericAppointmentException catch (e) {
      showFeedback(message: e.message);
    }
  }

  goToBookingScreen() {
    Navigator.of(context).pushReplacement(BookingScreen.route());
  }

  @override
  Widget build(BuildContext context) {
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
                    TableHeaderCell(
                      rightBordered: true,
                      child: 'Date',
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
          children: ref.watch(currentAppointmentStreamProvider).when(
                data: (appointment) {
                  final List<Widget> rowChildren = appointment != null
                      ? [
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  TableRowCell(
                                    rightBordered: true,
                                    child: appointment.formattedDate,
                                  ),
                                  TableRowCell(
                                    child:
                                        '${appointment.formattedStartTime} - ${appointment.formattedEndTime}',
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
                                  onPressed: () =>
                                      changeAppointment(appointment),
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                ),
                                MyButton(
                                  text: 'Cancel',
                                  onPressed: cancelAppointment,
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .surfaceVariant,
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
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ];

                  return rowChildren;
                },
                loading: () => [
                  const Loader(),
                  const Loader(),
                ],
                error: (error, stackTrace) {
                  return [
                    Expanded(
                      child: Text(
                        'Error: ${error.toString()}',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    Container(
                      width: 0,
                    ),
                  ];
                },
              ),
        ),
      ],
    );
  }
}
