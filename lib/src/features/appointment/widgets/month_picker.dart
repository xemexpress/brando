import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MonthPicker extends ConsumerWidget {
  const MonthPicker({
    super.key,
  });

  void goToNextMonth(WidgetRef ref) {
    ref.read(appointmentControllerProvider.notifier).viewNextMonth();
  }

  void goToPrevMonth(WidgetRef ref) {
    ref.read(appointmentControllerProvider.notifier).viewPreviousMonth();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentlyViewingMonth =
        ref.watch(appointmentControllerProvider).currentlyViewingMonth;

    return Container(
      height: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.arrow_back_ios, size: 10),
            disabledColor: Theme.of(context).colorScheme.primary,
            onPressed: currentlyViewingMonth.currentMonthOrBefore
                ? null
                : () => goToPrevMonth(ref),
          ),
          Text(
              '${currentlyViewingMonth.formattedAbbrMonth} ${currentlyViewingMonth.year}'),
          IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.arrow_forward_ios, size: 10),
            onPressed: () => goToNextMonth(ref),
          ),
        ],
      ),
    );
  }
}
