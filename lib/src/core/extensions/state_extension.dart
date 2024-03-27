import 'package:brando/src/core/core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// extension ConsumerStateExtension on State {
//   void showFeedback({required String message}) {
//     showMySnackBar(context: context, message: message);
//   }
// }

extension StateExtension on State {
  void showFeedback({required String message}) {
    showMySnackBar(context: context, message: message);
  }
}
