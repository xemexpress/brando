import 'package:intl/intl.dart';

class Appointment {
  final DateTime date;
  final DateTime startTime;
  final DateTime endTime;
  final String userId;

  const Appointment({
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.userId,
  });

// Get formatted date
  String get formattedDate {
    return DateFormat('yyyy MMM. dd').format(date);
  }

  // Get formatted start time
  String get formattedStartTime {
    return DateFormat('HH:mm').format(startTime);
  }

  // Get formatted end time
  String get formattedEndTime {
    return DateFormat('HH:mm').format(endTime);
  }

  Appointment copyWith({
    DateTime? date,
    DateTime? startTime,
    DateTime? endTime,
    String? userId,
  }) {
    return Appointment(
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date.millisecondsSinceEpoch,
      'startTime': startTime.millisecondsSinceEpoch,
      'endTime': endTime.millisecondsSinceEpoch,
      'userId': userId,
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      startTime: DateTime.fromMillisecondsSinceEpoch(map['startTime'] as int),
      endTime: DateTime.fromMillisecondsSinceEpoch(map['endTime'] as int),
      userId: map['userId'] as String,
    );
  }

  @override
  String toString() {
    return 'Appointment(date: $date, startTime: $startTime, endTime: $endTime, userId: $userId)';
  }

  @override
  bool operator ==(covariant Appointment other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        userId.hashCode;
  }
}
