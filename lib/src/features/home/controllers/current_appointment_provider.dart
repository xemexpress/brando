import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentAppointmentProvider = FutureProvider((ref) {
  final appointmentController =
      ref.watch(appointmentControllerProvider.notifier);

  return appointmentController.currentAppointment();
});

final currentAppointmentStreamProvider = StreamProvider((ref) {
  final appointmentController =
      ref.watch(appointmentControllerProvider.notifier);

  return appointmentController.currentAppointmentStream();
});
