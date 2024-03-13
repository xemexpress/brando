import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentlySelectedDate extends ConsumerWidget {
  const CurrentlySelectedDate({
    super.key,
  });

  void toggleDatePicker(WidgetRef ref) {
    ref.read(appointmentControllerProvider.notifier).toggleDatePicker();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool selecting =
        ref.watch(appointmentControllerProvider).isSelectingDate;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => toggleDatePicker(ref),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 40,
              padding: const EdgeInsets.only(right: 7),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.2,
                ),
              ),
              child: Row(
                children: [
                  const Spacer(),
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 200),
                    turns: selecting ? 0.5 : 0,
                    child: const BrandedArrow(),
                  ),
                ],
              ),
            ),
            const DateDisplay(),
          ],
        ),
      ),
    );
  }
}
