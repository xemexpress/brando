import 'package:brando/src/models/appointment.dart';
import 'package:brando/src/models/models.dart';

abstract class AppointmentAPIInterface {
  Future<void> book({
    required String userId,
    required Appointment appointment,
    required bool createNew,
  });

  Future<bool> checkAvailability({
    required String userId,
    required String appointmentId,
  });

  Future<Appointment?> currentAppointment({
    required String userId,
  });

  Future<void> cancelAppointment({
    required String userId,
  });
}
