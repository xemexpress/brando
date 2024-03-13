import 'package:brando/src/apis/apis.dart';
import 'package:brando/src/apis/appointment/appointment_api_provider.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appointmentControllerProvider =
    StateNotifierProvider<AppointmentController, AppointmentState>(
  (ref) {
    final authAPI = ref.watch(authAPIProvider);
    final appointmentAPI = ref.watch(appointmentAPIProvider);

    return AppointmentController(
      authAPI: authAPI,
      appointmentAPI: appointmentAPI,
      appointment: Appointment(
        date: DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
        ).add(
          const Duration(days: 2),
        ),
        startTime: const TimeOfDay(hour: 10, minute: 0),
        endTime: const TimeOfDay(hour: 11, minute: 0),
        title: '',
        name: '',
        phoneNumber: '',
      ),
    );
  },
);
