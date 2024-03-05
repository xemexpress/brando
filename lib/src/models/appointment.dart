import 'package:brando/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Appointment {
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String phoneNumber;
  final String name;
  final String userId;

  Appointment({
    required DateTime date,
    required this.startTime,
    required this.endTime,
    required this.name,
    required this.phoneNumber,
    required this.userId,
  }) : date = DateTime(date.year, date.month, date.day);

// Get formatted date
  String get formattedDate {
    return DateFormat('yyyy MMM. dd').format(date);
  }

  // Get formatted start time
  String get formattedStartTime {
    return startTime.formattedTime;
  }

  // Get formatted end time
  String get formattedEndTime {
    return endTime.formattedTime;
  }

  Appointment copyWith({
    DateTime? date,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    String? name,
    String? phoneNumber,
    String? userId,
  }) {
    return Appointment(
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userId: userId ?? this.userId,
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date.millisecondsSinceEpoch,
      'startTime': {
        'hour': startTime.hour,
        'minute': startTime.minute,
      },
      'endTime': {
        'hour': endTime.hour,
        'minute': endTime.minute,
      },
      'name': name,
      'phoneNumber': phoneNumber,
      'userId': userId,
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      startTime: TimeOfDay(
          hour: map['startTime']['hour'], minute: map['startTime']['minute']),
      endTime: TimeOfDay(
          hour: map['endTime']['hour'], minute: map['endTime']['minute']),
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
      userId: map['userId'] as String,
    );
  }
}
