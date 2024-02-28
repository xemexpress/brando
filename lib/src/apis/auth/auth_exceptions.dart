class UserNotLoggedInException implements Exception {}

class InvalidEmailAuthException implements Exception {}

class InvalidCredentialsAuthException implements Exception {}

class NetworkRequestAuthException implements Exception {}

class GenericAuthException implements Exception {
  final String message;

  const GenericAuthException({required this.message});
}
