import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MonthDisplay extends ConsumerWidget {
  const MonthDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate =
        ref.watch(appointmentControllerProvider).appointment.date;

    return Padding(
      padding: context.responsive(
        const EdgeInsets.symmetric(vertical: 20.0),
        md: const EdgeInsets.only(bottom: 30),
      ),
      child: Text(
        selectedDate.formattedMonth,
        style: GoogleFonts.libreBaskerville(
          textStyle: context.responsive(
            Theme.of(context).textTheme.headlineSmall,
            md: Theme.of(context).textTheme.headlineMedium,
          ),
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
