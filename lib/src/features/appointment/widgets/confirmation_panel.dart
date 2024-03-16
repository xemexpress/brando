import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmationPanel extends ConsumerWidget {
  const ConfirmationPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Appointment appointment =
        ref.watch(appointmentControllerProvider).appointment;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your booking is all set!',
              style: GoogleFonts.libreBaskerville(
                textStyle: Theme.of(context).textTheme.headlineLarge,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Divider(color: Theme.of(context).colorScheme.onSurface),
            const SizedBox(height: 30),
            Column(
              children: [
                Text(
                  appointment.formattedDate,
                  style: GoogleFonts.libreBaskerville(
                    textStyle: Theme.of(context).textTheme.titleLarge,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  appointment.formattedTimeslot,
                  style: GoogleFonts.libreBaskerville(
                    textStyle: Theme.of(context).textTheme.titleLarge,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Divider(color: Theme.of(context).colorScheme.onSurface),
            Text(
              '* Please attend on time.',
              style: GoogleFonts.libreBaskerville(
                textStyle: Theme.of(context).textTheme.labelMedium,
                wordSpacing: BorderSide.strokeAlignOutside,
              ),
            ),
            Text(
              '* You can change or cancel your booking at least 2 hours ago.',
              style: GoogleFonts.libreBaskerville(
                textStyle: Theme.of(context).textTheme.labelMedium,
                wordSpacing: BorderSide.strokeAlignOutside,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
