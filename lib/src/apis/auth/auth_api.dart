import 'package:brando/src/apis/auth/auth_api_interface.dart';
import 'package:brando/src/models/auth_user.dart';

class AuthAPI implements AuthApiInterface {
  @override
  Future<AuthUser> currentUser() {
    // TODO: implement currentUser
    throw UnimplementedError();
  }

  @override
  Future<AuthUser> signIn({required String email, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
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
