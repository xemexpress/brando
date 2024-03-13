import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DatePicker extends ConsumerWidget {
  const DatePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelectingDate =
        ref.watch(appointmentControllerProvider).isSelectingDate;

    return SizedBox(
      width: 250,
      child: Column(
        children: [
          const CurrentlySelectedDate(),
          AnimatedOpacity(
            opacity: isSelectingDate ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: const MonthPicker(),
          ),
          AnimatedOpacity(
            opacity: isSelectingDate ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: const DayPicker(),
          ),
        ],
      ),
    );
  }
}
