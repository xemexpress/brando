import 'package:brando/generated/l10n.dart';
import 'package:brando/src/apis/appointment/appointment.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentAPI implements AppointmentAPIInterface {
  AppointmentAPI({
    required FirebaseFirestore firebaseFirestore,
  })  : _firestore = firebaseFirestore,
        _userAppointmentsCollectionRef =
            firebaseFirestore.collection('userAppointments'),
        _appointmentSlotsCollectionRef =
            firebaseFirestore.collection('appointmentSlots'),
        _mailCollectionRef = firebaseFirestore.collection('mail');

  final FirebaseFirestore _firestore;
  final CollectionReference _userAppointmentsCollectionRef;
  final CollectionReference _appointmentSlotsCollectionRef;
  final CollectionReference _mailCollectionRef;

  @override
  Future<void> cancelAppointment({required String userId}) async {
    try {
      final bool cancelled =
          await _firestore.runTransaction<bool>((transaction) async {
        try {
          final DateTime now = DateTime.now();

          // Delete the user's appointment document
          final DocumentReference userAppointmentDocRef =
              _userAppointmentsCollectionRef.doc(userId);

          final DocumentSnapshot snapshot =
              await transaction.get(userAppointmentDocRef);
          final String appointmentId =
              Appointment.fromMap(snapshot.data()! as Map<String, dynamic>)
                  .appointmentId;

          transaction.delete(userAppointmentDocRef);

          // Update the appointment slot document
          final DocumentReference appointmentSlotDocRef =
              _appointmentSlotsCollectionRef.doc(appointmentId);

          transaction.update(
            appointmentSlotDocRef,
            {
              'cancelledAt': now.millisecondsSinceEpoch,
            },
          );

          return true;
        } catch (e) {
          return false;
        }
      });

      if (!cancelled) {
        throw AppointmentCancellationFailureException;
      }
    } on AppointmentCancellationFailureException catch (_) {
      rethrow;
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
  Future<void> book({
    required String userId,
    required Appointment appointment,
    required bool createNew,
  }) async {
    try {
      final bool registered = await _firestore.runTransaction<bool>(
        (transaction) async {
          try {
            DocumentReference slotRecordRef =
                _appointmentSlotsCollectionRef.doc(appointment.appointmentId);

            DocumentSnapshot potentialSlotRecord =
                await transaction.get(slotRecordRef);

            final DocumentReference userAppointmentDocRef =
                _userAppointmentsCollectionRef.doc(userId);

            if (!createNew) {
              // Copied from cancelAppointment() to here to have the full transaction
              final DateTime now = DateTime.now();

              final DocumentSnapshot userRecord =
                  await transaction.get(userAppointmentDocRef);

              final String appointmentId = Appointment.fromMap(
                      userRecord.data()! as Map<String, dynamic>)
                  .appointmentId;

              // Update the appointment slot document
              final DocumentReference oldSlotRecord =
                  _appointmentSlotsCollectionRef.doc(appointmentId);

              transaction.update(
                oldSlotRecord,
                {
                  'cancelledAt': now.millisecondsSinceEpoch,
                },
              );
            }

            final bool isSlotAvailable =
                !potentialSlotRecord.exists || // If the snapshot doesn't exist,
                    ((potentialSlotRecord.data()! as Map<String, dynamic>)
                                .containsKey('bookedBy') &&
                            ((potentialSlotRecord.data()!
                                    as Map<String, dynamic>)['bookedBy'] ==
                                userId) || // and it's this user,
                        ((potentialSlotRecord.data()! as Map<String, dynamic>)
                                .containsKey('cancelledAt') &&
                            (potentialSlotRecord.data()!
                                    as Map<String, dynamic>)['cancelledAt'] !=
                                null)); // or if it's cancelled,

            if (isSlotAvailable) {
              // Slot is available
              transaction.set(
                userAppointmentDocRef,
                appointment.toMap(),
              );

              transaction.set(
                slotRecordRef,
                {
                  'bookedBy': userId,
                },
              );

              // ? Send a notification to the admin
              DocumentReference mailRef = _mailCollectionRef.doc();
              transaction.set(mailRef, {
                'to': companyEmail,
                'message': {
                  'subject': 'An Appointment Has Been Booked',
                  'html': generateAdminEmailHtml(
                      appointment, S.current.common_locale),
                },
              });

              // Appointment booked successfully
              return true;
            } else {
              // Slot is not available
              return false;
            }
          } catch (_) {
            // print(e.toString());
            return false;
          }
        },
      );

      if (!registered) {
        throw SlotNotAvailableException();
      }
    } on SlotNotAvailableException catch (_) {
      rethrow;
    } catch (e) {
      throw GenericAppointmentException(
        message:
            'Unexpected error when booking an appointment. ${e.toString()}',
      );
    }
  }

  @override
  Future<bool> checkAvailability({
    required String userId,
    required String appointmentId,
  }) async {
    final DocumentSnapshot slotRecord =
        await _appointmentSlotsCollectionRef.doc(appointmentId).get();

    return !slotRecord.exists || // If the slotRecord doesn't exist,
        ((slotRecord.data()! as Map<String, dynamic>).containsKey('bookedBy') &&
                ((slotRecord.data()! as Map<String, dynamic>)['bookedBy'] ==
                    userId) || // and it's this user,
            ((slotRecord.data()! as Map<String, dynamic>)
                    .containsKey('cancelledAt') &&
                (slotRecord.data()! as Map<String, dynamic>)['cancelledAt'] !=
                    null)); // or if it's cancelled,;
  }
}
