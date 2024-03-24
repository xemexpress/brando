import 'package:brando/src/apis/appointment/appointment.dart';
import 'package:brando/src/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentAPI implements AppointmentAPIInterface {
  AppointmentAPI({
    required FirebaseFirestore firebaseFirestore,
  })  : _firestore = firebaseFirestore,
        _userAppointmentsCollectionRef =
            firebaseFirestore.collection('userAppointments'),
        _appointmentSlotsCollectionRef =
            firebaseFirestore.collection('appointmentSlots');

  final FirebaseFirestore _firestore;
  final CollectionReference _userAppointmentsCollectionRef;
  final CollectionReference _appointmentSlotsCollectionRef;

  @override
  Future<void> cancelAppointment({
    required String userId,
  }) async {
    try {
      await _userAppointmentsCollectionRef.doc(userId).delete();
    } catch (e) {
      throw GenericAppointmentException(
        message:
            'Unexpected error when cancelling an appointment. ${e.toString()}',
      );
    }
  }

  Stream<Appointment?> currentAppointmentStream({
    required String userId,
  }) {
    return _userAppointmentsCollectionRef
        .doc(userId)
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists) {
        return Appointment.fromMap(snapshot.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    }).handleError((_) => null); // Handle potential errors
  }

  @override
  Future<Appointment?> currentAppointment({
    required String userId,
  }) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _userAppointmentsCollectionRef.doc(userId).get();
      if (documentSnapshot.exists) {
        return Appointment.fromMap(
          documentSnapshot.data() as Map<String, dynamic>,
        );
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Appointment> updateAppointment({
    required String userId,
    required Appointment appointment,
  }) async {
    try {
      await _userAppointmentsCollectionRef
          .doc(userId)
          .update(appointment.toMap());

      return appointment;
    } catch (e) {
      throw GenericAppointmentException(
        message:
            'Unexpected error when updating an appointment. ${e.toString()}',
      );
    }
  }

  @override
  Future<Appointment> book({
    required String userId,
    required Appointment appointment,
  }) async {
    try {
      DocumentReference documentReference =
          _appointmentSlotsCollectionRef.doc(appointment.appointmentId);

      return await _firestore.runTransaction<Appointment>(
        (transaction) async {
          DocumentSnapshot snapshot = await transaction.get(documentReference);

          if (!snapshot.exists ||
              (snapshot.data()! as Map<String, dynamic>)['bookedBy'] == null) {
            // Slot is available
            await _userAppointmentsCollectionRef
                .doc(userId)
                .set(appointment.toMap());

            transaction.set(documentReference, {
              'bookedBy': userId,
            });
            // Appointment booked successfully
          } else {
            // Slot is not available
            throw SlotNotAvailableException();
          }

          return appointment;
        },
      );
    } on SlotNotAvailableException catch (_) {
      rethrow;
    } catch (e) {
      throw GenericAppointmentException(
        message:
            'Unexpected error when booking an appointment. ${e.toString()}',
      );
    }
  }
}
