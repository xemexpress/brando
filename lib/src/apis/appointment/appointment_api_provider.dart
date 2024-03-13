import 'package:brando/src/apis/appointment/appointment.dart';
import 'package:brando/src/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appointmentAPIProvider = Provider<AppointmentAPI>((ref) {
  final firebaseFirestore = ref.watch(firebaseFirestoreProvider);

  return AppointmentAPI(firebaseFirestore: firebaseFirestore);
});
