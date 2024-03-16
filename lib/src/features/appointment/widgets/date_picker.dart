import 'package:brando/src/core/core.dart';
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

    return Container(
      width: context.responsive(null, md: 250),
      padding: context.responsive(
        const EdgeInsets.only(bottom: 25),
        md: EdgeInsets.zero,
      ),
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
