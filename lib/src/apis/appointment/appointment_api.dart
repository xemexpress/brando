import 'package:brando/src/apis/appointment/appointment.dart';
import 'package:brando/src/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentAPI implements AppointmentAPIInterface {
  AppointmentAPI({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseCollectionRef = firebaseFirestore.collection('appointments');

  final CollectionReference _firebaseCollectionRef;

  @override
  Future<Appointment> book({
    required String userId,
    required Appointment appointment,
  }) async {
    try {
      await _firebaseCollectionRef.doc(userId).set(appointment.toMap());

      return appointment;
    } catch (e) {
      throw GenericAppointmentException(
        message:
            'Unexpected error when booking an appointment. ${e.toString()}',
      );
    }
  }

  @override
  Future<void> cancelAppointment({
    required String userId,
  }) async {
    try {
      await _firebaseCollectionRef.doc(userId).delete();
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
    return _firebaseCollectionRef.doc(userId).snapshots().map((snapshot) {
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
          await _firebaseCollectionRef.doc(userId).get();
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
      await _firebaseCollectionRef.doc(userId).update(appointment.toMap());

      return appointment;
    } catch (e) {
      throw GenericAppointmentException(
        message:
            'Unexpected error when updating an appointment. ${e.toString()}',
      );
    }
  }
}
