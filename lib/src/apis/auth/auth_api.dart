import 'package:brando/src/apis/apis.dart';
import 'package:brando/src/core/extensions.dart';
import 'package:brando/src/models/models.dart';
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
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInException();
      }
    } on FirebaseAuthException catch (e) {
      if (e.checkFirebaseException('auth/invalid-credential')) {
        throw InvalidCredentialsAuthException();
      } else if (e.checkFirebaseException('auth/invalid-email')) {
        throw InvalidEmailAuthException();
      } else if (e.checkFirebaseException('auth/network-request-failed')) {
        throw NetworkRequestAuthException();
      }

      throw GenericAuthException(
        message:
            'Met a FirebaseAuthException when signing in. Please set an exception for the error code ${e.code}.',
      );
    } catch (e) {
      throw GenericAuthException(
        message: 'Unexpected error when signing in. ${e.toString()}',
      );
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      print('Met when signing out: ${e.code} ${e.message}');
      rethrow;
    } catch (e) {
      throw GenericAuthException(
          message: 'Unexpected error when signing out. ${e.toString()}');
    }
  }
}
