import 'package:brando/src/apis/auth/auth_api_interface.dart';
import 'package:brando/src/models/auth_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthAPI implements AuthAPIInterface {
  AuthAPI({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  @override
  AuthUser? get currentUser {
    final user = _firebaseAuth.currentUser;

    if (user == null) {
      return null;
    } else {
      return AuthUser.fromFirebaseUser(user);
    }
  }

  @override
  Future<AuthUser> signInEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return AuthUser.fromFirebaseUser(userCredential.user!);
    } on FirebaseAuthException {
    } catch (e) {}
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<AuthUser> signUp({required String email, required String password}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
