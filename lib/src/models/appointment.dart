import 'package:brando/src/core/core.dart';
import 'package:flutter/material.dart';

class Appointment {
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String title;
  final String name;
  final String phoneNumber;
  final DateTime? createdAt;

  Appointment({
    required DateTime date,
    required this.startTime,
    required this.endTime,
    required this.title,
    required this.name,
    required this.phoneNumber,
    this.createdAt,
  }) : date = DateTime(date.year, date.month, date.day);

// Get formatted date
  String get formattedDate {
    return date.formattedDate;
    // return DateFormat('yyyy MMM dd').format(date);
  }

  String get formattedTimeslot {
    return '$formattedStartTime - $formattedEndTime';
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
    String? title,
    String? name,
    String? phoneNumber,
    String? userId,
  }) {
    return Appointment(
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      title: title ?? this.title,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  String toString() {
    return 'Appointment(date: $date, startTime: $startTime, endTime: $endTime, title: $title, name: $name, phone: $phoneNumber)';
  }

  @override
  bool operator ==(covariant Appointment other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.title == title &&
        other.name == name &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return date.hashCode ^ startTime.hashCode ^ endTime.hashCode;
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
      'title': title,
      'name': name,
      'phoneNumber': phoneNumber,
      'createdAt': DateTime.now().millisecondsSinceEpoch,
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      startTime: TimeOfDay(
        hour: map['startTime']['hour'],
        minute: map['startTime']['minute'],
      ),
      endTime: TimeOfDay(
        hour: map['endTime']['hour'],
        minute: map['endTime']['minute'],
      ),
      title: map['title'] as String,
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }
}
