import 'package:brando/src/apis/apis.dart';
import 'package:brando/src/models/models.dart';
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

  AuthUser? get currentUser => _authAPI.currentUser;

  Stream<AuthUser?> authStateChanges() {
    return _authAPI.authStateChanges();
  }

  Stream<AuthUser?> userChanges() {
    return _authAPI.userChanges();
  }

  Future<void> updateDisplayName({required String displayName}) async {
    isLoading(true);

    try {
      await _authAPI.updateDisplayName(newDisplayName: displayName);
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateContactNumber({required String contactNumber}) async {
    isLoading(true);

    try {
      await _authAPI.updateContactNumber(contactNumber: contactNumber);
    } finally {
      isLoading(false);
    }
  }

  Future<void> updatePassword(
      {required String oldPassword, required String newPassword}) async {
    isLoading(true);

    try {
      await _authAPI.updatePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );
    } finally {
      isLoading(false);
    }
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
    } finally {
      isLoading(false);
    }
  }

  Future<void> signInWithGoogle() async {
    isLoading(true);

    try {
      await _authAPI.signInWithGoogle();
    } finally {
      isLoading(false);
    }
  }

  Future<void> signInWithFacebook() async {
    isLoading(true);

    try {
      await _authAPI.signInWithFacebook();
    } finally {
      isLoading(false);
    }
  }

  Future<void> signInWithApple() async {
    isLoading(true);

    try {
      await _authAPI.signInWithApple();
    } finally {
      isLoading(false);
    }
  }

  Future<void> signOut() async {
    isLoading(true);

    try {
      await _authAPI.signOut();
    } catch (e) {
      print('Error recognised in authController: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
