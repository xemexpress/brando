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
  final double buttonHeight = 20;

  void changeAppointment(Appointment? appointment) {
    ref
        .read(appointmentControllerProvider.notifier)
        .updateAppointment(appointment);

    // Navigator.of(context).push(BookingScreen.route());
    Navigator.of(context).pushNamed(BookingScreen.routeName);
  }

  void cancelAppointment() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return const CancelAppointmentDialog();
      },
    );
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
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Wrap(
                              alignment: WrapAlignment.spaceEvenly,
                              runSpacing: 3,
                              spacing: 3,
                              children: [
                                MyButton(
                                  text: 'change',
                                  onPressed: () =>
                                      changeAppointment(appointment),
                                  height: buttonHeight,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  textStyle:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                MyButton(
                                  text: 'cancel',
                                  onPressed: cancelAppointment,
                                  height: buttonHeight,
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .surfaceVariant,
                                  textStyle:
                                      Theme.of(context).textTheme.labelMedium,
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
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              onPressed: goToBookingScreen,
                              height: buttonHeight,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ];

                  return rowChildren;
                },
                loading: () => [const Loader(), const Loader()],
                error: (error, stackTrace) {
                  return [
                    Expanded(
                      child: Text(
                        'Error: ${error.toString()}',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    Container(width: 0),
                  ];
                },
              ),
        ),
      ],
    );
  }
}
