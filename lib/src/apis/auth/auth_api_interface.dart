import 'package:brando/src/models/models.dart' show AuthUser;

abstract class AuthApiInterface {
  Future<AuthUser> currentUser();

  Future<AuthUser> signIn({
    required String email,
    required String password,
  });

  Future<AuthUser> signUp({
    required String email,
    required String password,
  });

  Future<void> signOut();
}
