import 'package:brando/src/models/models.dart' show AuthUser;

abstract class AuthAPIInterface {
  AuthUser? get currentUser;

  Future<AuthUser> signInEmailAndPassword({
    required String email,
    required String password,
  });

  Future<AuthUser> signUp({
    required String email,
    required String password,
  });

  Future<void> signOut();
}
