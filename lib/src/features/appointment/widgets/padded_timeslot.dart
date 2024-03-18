import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class PaddedTimeslot extends ConsumerStatefulWidget {
  const PaddedTimeslot(
    this.timeslot, {
    super.key,
    this.highlightable = true,
  });

  final (TimeOfDay, TimeOfDay) timeslot;
  final bool highlightable;

  @override
  ConsumerState<PaddedTimeslot> createState() => _PaddedTimeslotState();
}

class _PaddedTimeslotState extends ConsumerState<PaddedTimeslot> {
  bool isHovered = false;

  void onHover(event) => setState(() {
        isHovered = !isHovered;
      });

  void selectTimeslot() {
    ref
        .read(appointmentControllerProvider.notifier)
        .updateAppointmentTimeslot(widget.timeslot);
  }

  @override
  Widget build(BuildContext context) {
    const double verticalPadding = 9;

    final Appointment myAppointment =
        ref.watch(appointmentControllerProvider).appointment;
    final bool isSelected = isTimeslotExactMatch(
        widget.timeslot, myAppointment.startTime, myAppointment.endTime);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: onHover,
      onExit: onHover,
      child: GestureDetector(
        onTap: widget.highlightable ? selectTimeslot : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.bounceInOut,
          padding: const EdgeInsets.symmetric(vertical: verticalPadding),
          decoration: BoxDecoration(
            color: isSelected && widget.highlightable
                ? Theme.of(context).colorScheme.primary
                : isHovered && widget.highlightable
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.5)
                    : null,
          ),
          child: Container(
            height: 25,
            padding: context.responsive(
              null,
              md: const EdgeInsets.only(right: 15),
            ),
            child: Center(
              child: Text(
                '${widget.timeslot.$1.formattedTime} - ${widget.timeslot.$2.formattedTime}',
                style: GoogleFonts.cabin(
                  textStyle: context.responsive(
                    Theme.of(context).textTheme.titleLarge,
                    md: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
