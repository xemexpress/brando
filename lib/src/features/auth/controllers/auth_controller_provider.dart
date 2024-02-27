import 'package:brando/src/apis/auth/auth.dart';
import 'package:brando/src/features/auth/controllers/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) {
    final authAPI = ref.watch(authAPIProvider);

    return AuthController(authAPI: authAPI);
  },
);
