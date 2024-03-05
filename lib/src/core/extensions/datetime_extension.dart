import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isBeforeDay(DateTime other) {
    // Normalize to midnight
    final DateTime normalizedDate1 = DateTime(
      year,
      month,
      day,
    );
    final DateTime normalizedDate2 = DateTime(
      other.year,
      other.month,
      other.day,
    );

    return normalizedDate1.isBefore(normalizedDate2);
  }

  bool get currentMonthOrBefore {
    return isBefore(DateTime.now().nextMonth);
  }

  String get formattedAbbrMonth {
    return DateFormat('MMM').format(this);
  }

  String get formattedMonth {
    return DateFormat('MMMM').format(this);
  }

  String get formattedDate {
    return DateFormat('yyyy MMMM dd').format(this);
  }

  DateTime get previousMonth {
    int year = this.year;
    int month = this.month - 1;
    if (month < 1) {
      month = 12;
      year--;
    }
    return DateTime(year, month);
  }

  DateTime get nextMonth {
    int year = this.year;
    int month = this.month + 1;
    if (month > 12) {
      month = 1;
      year++;
    }
    return DateTime(year, month);
  }
}
