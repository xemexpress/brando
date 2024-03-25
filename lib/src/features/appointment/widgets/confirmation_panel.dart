import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:brando/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmationPanel extends ConsumerWidget {
  const ConfirmationPanel({super.key});

  Widget _buildDivider(BuildContext context) {
    return Divider(
      color: Theme.of(context).colorScheme.onSurface,
      thickness: context.responsive(0.5, md: 1),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Appointment appointment =
        ref.watch(appointmentControllerProvider).appointment;

    final Widget appointmentDateTime = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          appointment.formattedDate,
          style: GoogleFonts.libreBaskerville(
            textStyle: context.responsive(
              Theme.of(context).textTheme.titleMedium,
              md: Theme.of(context).textTheme.titleLarge,
            ),
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          appointment.formattedTimeslot,
          style: GoogleFonts.libreBaskerville(
            textStyle: context.responsive(
              Theme.of(context).textTheme.titleMedium,
              md: Theme.of(context).textTheme.titleLarge,
            ),
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          context.responsive(
            const SizedBox(height: 110),
            md: const SizedBox(height: 230),
          ),
          Text(
            'Your booking is all set!',
            style: GoogleFonts.libreBaskerville(
              textStyle: context.responsive(
                Theme.of(context).textTheme.headlineSmall,
                md: Theme.of(context).textTheme.headlineLarge,
              ),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _buildDivider(context),
          const SizedBox(height: 30),
          context.responsive(
            appointmentDateTime,
            md: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                appointmentDateTime,
                const Positioned(
                  bottom: -270,
                  child: ChangeTimeButton(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          _buildDivider(context),
          Text(
            '* Please attend on time.',
            style: GoogleFonts.libreBaskerville(
              textStyle: context.responsive(
                Theme.of(context).textTheme.labelSmall,
                md: Theme.of(context).textTheme.labelMedium,
              ),
              wordSpacing: BorderSide.strokeAlignOutside,
            ),
          ),
          Text(
            '* You can change or cancel your booking at least 2 hours ago.',
            style: GoogleFonts.libreBaskerville(
              textStyle: context.responsive(
                Theme.of(context).textTheme.labelSmall,
                md: Theme.of(context).textTheme.labelMedium,
              ),
              wordSpacing: BorderSide.strokeAlignOutside,
            ),
            textAlign: TextAlign.center,
          ),
          context.responsive(
            const SizedBox(),
            md: const SizedBox(height: 230),
          ),
          context.responsive(
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: ChangeTimeButton(),
            ),
            md: const SizedBox(),
          ),
        ],
      ),
    );
  }
}
