import 'package:brando/src/core/core.dart';

// login exceptions
class UserNotLoggedInException implements Exception {}

class InvalidEmailAuthException implements Exception {}

class InvalidPasswordAuthException implements Exception {}

class NetworkRequestAuthException implements Exception {}

// register exceptions
class WeakPasswordAuthException implements Exception {}

// generic exception
class GenericAuthException extends GenerichException {
  GenericAuthException({
    required String message,
  }) : super(message: message);
}
