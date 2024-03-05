import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/booking/controllers/controllers.dart';
import 'package:brando/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        .read(bookingProvider.notifier)
        .updateAppointmentTimeslot(widget.timeslot);
  }

  @override
  Widget build(BuildContext context) {
    const double verticalPadding = 9;

    final Appointment myAppointment = ref.watch(bookingProvider).appointment;
    final bool isSelected = isTimeslotExactMatch(
        widget.timeslot, myAppointment.startTime, myAppointment.endTime);

    return GestureDetector(
      onTap: selectTimeslot,
      child: MouseRegion(
        cursor: widget.highlightable
            ? SystemMouseCursors.basic
            : SystemMouseCursors.click,
        onEnter: onHover,
        onExit: onHover,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.bounceInOut,
          padding: EdgeInsets.only(
            left: 15,
            top: verticalPadding,
            bottom: verticalPadding,
            right: widget.highlightable ? 25 : 0,
          ),
          decoration: BoxDecoration(
              color: isHovered && widget.highlightable
                  ? Theme.of(context).colorScheme.primary.withOpacity(0.5)
                  : null),
          child: Container(
            color: isSelected && widget.highlightable
                ? Theme.of(context).colorScheme.primary
                : null,
            child: Text(
              '${widget.timeslot.$1.formattedTime} - ${widget.timeslot.$2.formattedTime}',
            ),
          ),
        ),
      ),
    );
  }
}
