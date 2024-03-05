import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/booking/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MonthDisplay extends ConsumerWidget {
  const MonthDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(bookingProvider).appointment.date;

    return Text(
      selectedDate.formattedMonth,
      style: GoogleFonts.libreBaskerville(
        textStyle: Theme.of(context).textTheme.headlineMedium,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
