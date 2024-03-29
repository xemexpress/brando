import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DayPicker extends ConsumerStatefulWidget {
  const DayPicker({
    super.key,
  });

  @override
  ConsumerState<DayPicker> createState() => _MyCalendarPickerState();
}

class _MyCalendarPickerState extends ConsumerState<DayPicker> {
  late DateTime selectedDate;
  late DateTime currentMonth;
  late List<List<int>> calendarGrid;

  void updateSelectedDate(DateTime newDate) {
    ref
        .read(appointmentControllerProvider.notifier)
        .localUpdateAppointmentDate(newDate);
  }

  @override
  Widget build(BuildContext context) {
    selectedDate = ref.watch(appointmentControllerProvider).appointment.date;
    currentMonth =
        ref.watch(appointmentControllerProvider).currentlyViewingMonth;
    calendarGrid = getCalendarGrid(currentMonth.year, currentMonth.month);
    final DateTime today = DateTime.now();
    const double borderWidth = 0.7;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: borderWidth,
        ),
      ),
      child: Column(
        children: [
          DaysOfWeekLabel(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (var row = 0; row < calendarGrid.length; row++)
                Row(
                  children: calendarGrid[row].map(
                    (day) {
                      final monthOffset = currentMonth.month +
                          (row == 0 && day > 7
                              ? -1
                              : row == calendarGrid.length - 1 && day < 7
                                  ? 1
                                  : 0);
                      final date =
                          DateTime(currentMonth.year, monthOffset, day);

                      final bool isPast =
                          date.isBeforeDay(today.add(const Duration(days: 2)));
                      final bool isToday = date.isSameDay(today);
                      final bool isSelected = date.isSameDay(selectedDate);
                      final bool beyondCurrentMonth =
                          date.month != currentMonth.month;

                      return DayOfMonth(
                        date: date,
                        selectedDate: selectedDate,
                        circled: isToday,
                        colored: isSelected,
                        enabled: !isPast,
                        isSecondary: beyondCurrentMonth || isPast,
                        onSelectDate: updateSelectedDate,
                        borderWidth: borderWidth,
                      );
                    },
                  ).toList(),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
