import 'package:brando/src/core/core.dart';

class UserNotLoggedInException implements Exception {}

class InvalidEmailAuthException implements Exception {}

class InvalidCredentialsAuthException implements Exception {}

class NetworkRequestAuthException implements Exception {}

class GenericAuthException extends GenerichException {
  GenericAuthException({
    required String message,
  }) : super(message: message);
}
