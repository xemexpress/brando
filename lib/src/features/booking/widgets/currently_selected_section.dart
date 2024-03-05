import 'package:brando/src/features/booking/controllers/controllers.dart';
import 'package:brando/src/features/booking/widgets/widgets.dart';
import 'package:brando/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentlySelectedSection extends ConsumerWidget {
  const CurrentlySelectedSection({
    super.key,
  });

  void toggleSectionPicker(WidgetRef ref) {
    ref.read(bookingProvider.notifier).toggleTimeslotPicker();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Appointment myAppointment = ref.watch(bookingProvider).appointment;
    final bool selecting = ref.watch(bookingProvider).isSelectingTimeslot;

    final (TimeOfDay, TimeOfDay) selectedTimeslot =
        (myAppointment.startTime, myAppointment.endTime);

    return GestureDetector(
      onTap: () => toggleSectionPicker(ref),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PaddedTimeslot(
              selectedTimeslot,
              highlightable: false,
            ),
            AnimatedRotation(
              duration: const Duration(milliseconds: 200),
              turns: selecting ? 0.5 : 0,
              child: const BrandedArrow(),
            ),
          ],
        ),
      ),
    );
  }
}
