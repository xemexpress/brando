import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingSummary extends ConsumerWidget {
  const BookingSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppointmentState myAppointmentState =
        ref.watch(appointmentControllerProvider);

    final BookingStage stage = myAppointmentState.stage;
    final DateTime date = myAppointmentState.appointment.date;
    final TimeOfDay startTime = myAppointmentState.appointment.startTime;
    final TimeOfDay endTime = myAppointmentState.appointment.endTime;

    return SizedBox(
      height: 200,
      child: Center(
        child: stage == BookingStage.confirmation
            ? Text(
                'See you there!',
                style: GoogleFonts.libreBaskerville(
                  textStyle: Theme.of(context).textTheme.headlineLarge,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your booking time slot is',
                    style: GoogleFonts.libreBaskerville(
                      textStyle: Theme.of(context).textTheme.displaySmall,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  DateTimeDisplay(
                    date: date,
                    time: startTime,
                  ),
                  Text(
                    'to',
                    style: GoogleFonts.libreBaskerville(
                      textStyle: Theme.of(context).textTheme.headlineMedium,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DateTimeDisplay(
                    date: date,
                    time: endTime,
                  ),
                ],
              ),
      ),
    );
  }
}
