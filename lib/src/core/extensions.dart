import 'package:brando/src/core/core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension FirebaseExceptionExtensions on Exception {
  bool checkFirebaseException(String errorCode) {
    return this is FirebaseException &&
        ((this as FirebaseException).code == errorCode ||
            toString().contains(errorCode));
  }
}

extension ConsumerStateSnackBar on ConsumerState {
  void showFeedback({required String message}) {
    showMySnackBar(context: context, message: message);
  }
}
