import 'package:brando/src/apis/auth/auth.dart';
import 'package:brando/src/core/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authAPIProvider = Provider<AuthAPI>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  final firebaseFirestore = ref.watch(firebaseFirestoreProvider);

  return AuthAPI(
    firebaseAuth: firebaseAuth,
    firebaseFirestore: firebaseFirestore,
  );
});
