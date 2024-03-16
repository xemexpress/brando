import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeslotPicker extends ConsumerWidget {
  const TimeslotPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelectingTimeslot =
        ref.watch(appointmentControllerProvider).isSelectingTimeslot;
    final double borderWidth = context.responsive(0.4, md: 1.2);

    return SizedBox(
      height: 250,
      width: context.responsive(null, md: 140),
      child: Column(
        children: [
          CurrentlySelectedSection(borderWidth: borderWidth),
          Expanded(
            child: AnimatedOpacity(
              opacity: isSelectingTimeslot ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: SectionPicker(borderWidth: borderWidth),
            ),
          ),
        ],
      ),
    );
  }
}
