import 'package:brando/src/models/models.dart';

abstract class AuthAPIInterface {
  AuthUser? get currentUser;

  // Profile related

  Future<void> updateDisplayName({
    required String newDisplayName,
  });

  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  });

  // Future<void> updatePhoneNumber({
  //   required String phoneNumber,
  // });

  // Auth related

  Stream<AuthUser?> authStateChanges();

  Stream<AuthUser?> userChanges();

  Future<AuthUser> signInEmailAndPassword({
    required String email,
    required String password,
  });

  // Future<AuthUser> signUp({
  //   required String email,
  //   required String password,
  // });

  Future<AuthUser> signInWithGoogle();

  Future<AuthUser> signInWithFacebook();

  Future<AuthUser> signInWithApple();

  Future<void> signOut();
}
