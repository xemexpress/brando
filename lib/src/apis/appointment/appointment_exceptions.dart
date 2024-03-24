import 'package:brando/src/core/core.dart';

// class AppointmentNotFoundException implements Exception {}

class SlotNotAvailableException implements Exception {}

class GenericAppointmentException extends GenerichException {
  GenericAppointmentException({
    required String message,
  }) : super(message: message);
}
