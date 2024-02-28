import 'package:brando/src/apis/apis.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      // } on GenericAuthException catch (e) {
      //   print('Error recognised in authController: ${e.message}');
      //   rethrow;
    } finally {
      isLoading(false);
    }
  }

  Future<void> signOut() async {
    isLoading(true);

    try {
      await _authAPI.signOut();
      // } catch (e) {
      //   print('Error recognised in authController: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
