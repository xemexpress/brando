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
  void changeAppointment(Appointment? appointment) {
    ref
        .read(appointmentControllerProvider.notifier)
        .updateAppointment(appointment);

    // Navigator.of(context).push(BookingScreen.route());
    Navigator.of(context).pushNamed(BookingScreen.routeName);
  }

  void popOut() {
    Navigator.of(context).pop();
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
                Text(
                  'Are you sure to cancel?',
                  style: context.responsive(
                    Theme.of(context).textTheme.titleLarge,
                    md: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      text: 'No',
                      onPressed: popOut,
                      horizontalPadding: 22,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      textStyle: context.responsive(
                        Theme.of(context).textTheme.titleLarge,
                        md: Theme.of(context).textTheme.titleMedium,
                      ),
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

  void confrimCancellation() {
    try {
      Navigator.of(context).pop();

      ref.read(appointmentControllerProvider.notifier).cancelAppointment();
    } on GenericAppointmentException catch (e) {
      showFeedback(message: e.message);
    }
  }

  void goToBookingScreen() {
    Navigator.of(context).pushReplacement(BookingScreen.route());
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: context.responsive(
        const {
          0: FlexColumnWidth(2.4),
          1: FlexColumnWidth(2),
        },
        md: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(1.2),
        },
      ),
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
                                  text: 'change',
                                  onPressed: () =>
                                      changeAppointment(appointment),
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                ),
                                MyButton(
                                  text: 'cancel',
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
