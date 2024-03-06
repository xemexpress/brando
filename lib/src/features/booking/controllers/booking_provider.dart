import 'package:brando/src/apis/apis.dart';
import 'package:brando/src/features/booking/controllers/appointment_controller.dart';
import 'package:brando/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookingProvider =
    StateNotifierProvider<AppointmentController, AppointmentState>(
  (ref) {
    final authAPI = ref.watch(authAPIProvider);
    final DateTime today = DateTime.now();

    return AppointmentController(
      appointment: Appointment(
        date: DateTime(today.year, today.month, today.day).add(
          const Duration(days: 2),
        ),
        startTime: const TimeOfDay(hour: 10, minute: 0),
        endTime: const TimeOfDay(hour: 11, minute: 0),
        userId: authAPI.currentUser!.id,
        title: '',
        name: '',
        phoneNumber: '',
      ),
    );
  },
);
