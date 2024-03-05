List<List<int>> getCalendarGrid(int year, int month) {
  const daysOfWeek = 7;

  final List<List<int>> grid = [];

  // Get the first day of the month
  DateTime currentDay = DateTime(year, month, 1);

  // Push the days of the previous month.
  grid.add([]);
  for (int i = 0; i < currentDay.weekday; i++) {
    final daysBefore = currentDay.weekday - i;
    grid[0].add(currentDay.subtract(Duration(days: daysBefore)).day);
  }

  // Push the rest.
  bool isLastWeek = false;
  while (true) {
    if (isLastWeek && grid.last.length % daysOfWeek == 0) {
      break;
    }
    if (grid.last.length % daysOfWeek == 0) {
      grid.add([]);
    }

    grid.last.add(currentDay.day);

    currentDay = currentDay.add(const Duration(days: 1));

    if (currentDay.month != month) {
      isLastWeek = true;
    }
  }

  return grid;
}
