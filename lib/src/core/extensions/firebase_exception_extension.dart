import 'package:firebase_core/firebase_core.dart';

extension FirebaseExceptionExtension on Exception {
  bool checkFirebaseException(String errorCode) {
    return this is FirebaseException &&
        ((this as FirebaseException).code == errorCode ||
            toString().contains(errorCode));
  }
}
