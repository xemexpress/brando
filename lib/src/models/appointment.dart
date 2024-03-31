import 'package:brando/src/core/core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  String formattedDate(String locale) {
    return date.formattedDate(locale);
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

  // Get custom document id
  String get appointmentId {
    return '${date.formattedDateCompact}_${startTime.formattedTimeCompact}_${endTime.formattedTimeCompact}';
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
      'date': Timestamp.fromDate(date), // Convert DateTime to Timestamp
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
      'createdAt': Timestamp.now(), // Store the current time as a Timestamp
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      date:
          (map['date'] as Timestamp).toDate(), // Convert Timestamp to DateTime
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
      createdAt: (map['createdAt'] as Timestamp)
          .toDate(), // Convert Timestamp to DateTime for createdAt
    );
  }
}
