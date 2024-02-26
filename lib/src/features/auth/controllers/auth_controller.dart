import 'package:brando/src/apis/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final authAPIProvider = Provider<AuthAPI>((ref) {
//   final firebaseAuth = ref.watch(firebaseAuthProvider);
//   return AuthAPI(firebaseAuth: firebaseAuth);
// });

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;

  AuthController({
    required AuthAPI authAPI,
  })  : _authAPI = authAPI,
        super(false);

  void isLoading(bool value) {
    state = value;
  }

  Future<void> signInEmailAndPassword({
    required String email,
    required String password,
  }) async {
    isLoading(true);

    try {
      await _authAPI.signInEmailAndPassword(
        email: email,
        password: password,
      );

      isLoading(false);
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.code} ${e.message}');

      isLoading(false);
    } catch (e) {
      print('Unexpected error when signing in: ${e.toString()}');
      isLoading(false);
    }
  }

  void signOut({
    required BuildContext context,
  }) async {
    try {
      isLoading(true);

      await _authAPI.signOut();

      isLoading(false);
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.code} ${e.message}');

      isLoading(false);
    } catch (e) {
      print('Unexpected error when signing in: ${e.toString()}');
      isLoading(false);
    }
  }
}
