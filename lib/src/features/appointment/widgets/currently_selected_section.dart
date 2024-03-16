import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:brando/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentlySelectedSection extends ConsumerWidget {
  const CurrentlySelectedSection({
    super.key,
    required this.borderWidth,
  });

  final double borderWidth;

  void toggleSectionPicker(WidgetRef ref) {
    ref.read(appointmentControllerProvider.notifier).toggleTimeslotPicker();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Appointment myAppointment =
        ref.watch(appointmentControllerProvider).appointment;
    final bool selecting =
        ref.watch(appointmentControllerProvider).isSelectingTimeslot;

    final (TimeOfDay, TimeOfDay) selectedTimeslot =
        (myAppointment.startTime, myAppointment.endTime);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => toggleSectionPicker(ref),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: borderWidth),
          ),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: PaddedTimeslot(
                        selectedTimeslot,
                        highlightable: false,
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedRotation(
                duration: const Duration(milliseconds: 200),
                turns: selecting ? 0.5 : 0,
                child: const BrandedArrow(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
