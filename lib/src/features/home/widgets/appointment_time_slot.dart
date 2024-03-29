import 'package:brando/generated/l10n.dart';
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
        .localUpdateAppointment(appointment);

    Navigator.of(context).pushReplacementNamed(BookingScreen.routeName);
  }

  void goToCancelAppointment() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return const CancelAppointmentDialog();
      },
    );
  }

  void goToBookingScreen() {
    ref.read(appointmentControllerProvider.notifier).isCreatingNew(true);

    Navigator.of(context).pushReplacementNamed(BookingScreen.routeName);
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
              children: [
                TableRow(
                  children: [
                    TableHeaderCell(
                      rightBordered: true,
                      child: S.of(context).home_date,
                    ),
                    TableHeaderCell(child: S.of(context).home_timeSlot),
                  ],
                ),
              ],
            ),
            TableHeaderCell(child: S.of(context).home_states),
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
                                    child: appointment.formattedDate(
                                        S.of(context).common_locale),
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
                                  text: S.of(context).home_change,
                                  onPressed: () =>
                                      changeAppointment(appointment),
                                  height: buttonHeight,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  textStyle:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                MyButton(
                                  text: S.of(context).home_cancel,
                                  onPressed: goToCancelAppointment,
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
                          TableRowCell(
                            child:
                                S.of(context).home_youDontHaveAnAppointmentYet,
                          ),
                          TableRowCell(
                            child: MyButton(
                              text: S.of(context).home_makeAnAppointment,
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
                        S.of(context).home_errorMessage(error.toString()),
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
