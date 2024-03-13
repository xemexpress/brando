import 'package:brando/src/models/models.dart';

abstract class AppointmentAPIInterface {
  Future<Appointment> book({
    required String userId,
    required Appointment appointment,
  });

  Future<Appointment?> currentAppointment({
    required String userId,
  });

  Future<Appointment> updateAppointment({
    required String userId,
    required Appointment appointment,
  });

  Future<void> cancelAppointment({
    required String userId,
  });
}
