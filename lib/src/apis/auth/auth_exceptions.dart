class UserNotLoggedInException implements Exception {}

class GenericAuthException implements Exception {
  final String message;

  const GenericAuthException({required this.message});
}
