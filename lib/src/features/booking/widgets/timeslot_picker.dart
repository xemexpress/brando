import 'package:brando/src/features/booking/controllers/controllers.dart';
import 'package:brando/src/features/booking/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeslotPicker extends ConsumerWidget {
  const TimeslotPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelectingTimeslot = ref.watch(bookingProvider).isSelectingTimeslot;

    return SizedBox(
      height: 250,
      width: 140,
      child: Column(
        children: [
          const CurrentlySelectedSection(),
          Divider(
            color: Theme.of(context).colorScheme.onSurface,
            height: 0,
          ),
          Expanded(
            child: AnimatedOpacity(
              opacity: isSelectingTimeslot ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: const SectionPicker(),
            ),
          ),
        ],
      ),
    );
  }
}
