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

  String formattedDate(String locale) {
    DateFormat yearFormat, monthFormat, dayFormat;
    final bool inChinese = locale.startsWith('zh');

    if (inChinese) {
      // Chinese formatting
      yearFormat = DateFormat('yyyy年', locale);
      monthFormat = DateFormat('MMMM', locale);
      dayFormat = DateFormat('dd日', locale);
    } else {
      // Default to English or any other format
      yearFormat = DateFormat('yyyy', locale);
      monthFormat = DateFormat('MMMM', locale);
      dayFormat = DateFormat('dd', locale);
    }

    // Combine the formatted parts
    String formattedYear = yearFormat.format(this);
    String formattedMonth = monthFormat.format(this);
    String formattedDay = dayFormat.format(this);

    // Adjust the format based on the locale
    if (inChinese) {
      return '$formattedYear $formattedMonth $formattedDay';
    } else {
      // English version or any other non-Chinese language
      return '$formattedMonth $formattedDay, $formattedYear';
    }
  }

  String get formattedDateCompact {
    return DateFormat('yyyyMMdd').format(this);
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
